#!/usr/bin/env bash

dwi_script_dir() {
  cd "$(dirname "${BASH_SOURCE[1]}")" >/dev/null 2>&1 && pwd
}

dwi_load_config() {
  SCRIPT_DIR="$(dwi_script_dir)"
  PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
  BIDS_ROOT="${BIDS_ROOT:-/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/bids}"
  TOOLS_ROOT="${TOOLS_ROOT:-/ZPOOL/data/tools}"
  SCRATCH_ROOT="${SCRATCH_ROOT:-/ZPOOL/data/scratch}"
  TEMPLATEFLOW_HOME="${TOOLS_ROOT}/templateflow"
  MPLCONFIGDIR_HOST="${TOOLS_ROOT}/mplconfigdir"
  LICENSES_DIR="${TOOLS_ROOT}/licenses"
  DIPY_HOME_HOST="${PROJECT_ROOT}/.cache/dipy"

  QSIPREP_VERSION="26.0.0"
  QSIPREP_IMAGE="${TOOLS_ROOT}/qsiprep-${QSIPREP_VERSION}.sif"
  QSIPREP_OUTPUT_RESOLUTION="${QSIPREP_OUTPUT_RESOLUTION:-2}"
  QSIPREP_TOTAL_NPROCS="${QSIPREP_TOTAL_NPROCS:-96}"
  QSIPREP_TOTAL_MEM_MB="${QSIPREP_TOTAL_MEM_MB:-196000}"
  QSIPREP_OMP_NTHREADS="${QSIPREP_OMP_NTHREADS:-8}"
  QSIPREP_NPROCS="${QSIPREP_NPROCS:-}"
  QSIPREP_MEM_MB="${QSIPREP_MEM_MB:-}"
  QSIRECON_VERSION="26.0.0"
  QSIRECON_IMAGE="${TOOLS_ROOT}/qsirecon-${QSIRECON_VERSION}.sif"
  QSIRECON_TOTAL_NPROCS="${QSIRECON_TOTAL_NPROCS:-96}"
  QSIRECON_TOTAL_MEM_MB="${QSIRECON_TOTAL_MEM_MB:-196000}"
  QSIRECON_OMP_NTHREADS="${QSIRECON_OMP_NTHREADS:-8}"
  QSIRECON_NPROCS="${QSIRECON_NPROCS:-}"
  QSIRECON_MEM_MB="${QSIRECON_MEM_MB:-}"
  QSIRECON_AMICO_LMAX="${QSIRECON_AMICO_LMAX:-12}"
  QSIRECON_AMICO_NDIRS="${QSIRECON_AMICO_NDIRS:-500}"
  FMRIPREP_DERIVATIVES_DIR="${FMRIPREP_DERIVATIVES_DIR:-/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep}"
  FREESURFER_SUBJECTS_DIR="${FREESURFER_SUBJECTS_DIR:-${FMRIPREP_DERIVATIVES_DIR}/sourcedata/freesurfer}"
  FREESURFER_FALLBACK_SUBJECTS_DIR="${FREESURFER_FALLBACK_SUBJECTS_DIR:-/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer}"
  BATCH_SUBLIST="${SCRIPT_DIR}/sublist.txt"
}

dwi_usage() {
  printf 'Usage: %s\n' "$1" >&2
}

dwi_require_file() {
  local path="$1"
  if [[ -z "$path" ]]; then
    printf 'Required file path is empty. Check that any shell variables in the command are set.\n' >&2
    return 1
  fi
  if [[ ! -f "$path" ]]; then
    printf 'Required file not found: %s\n' "$path" >&2
    return 1
  fi
}

dwi_require_dir() {
  local path="$1"
  if [[ -z "$path" ]]; then
    printf 'Required directory path is empty. Check that any shell variables in the command are set.\n' >&2
    return 1
  fi
  if [[ ! -d "$path" ]]; then
    printf 'Required directory not found: %s\n' "$path" >&2
    return 1
  fi
}

dwi_freesurfer_subject_dir() {
  local subjects_dir="$1"
  local sub="$2"
  local candidate
  for candidate in "${subjects_dir}/${sub}" "${subjects_dir}/sub-${sub}"; do
    if [[ -d "$candidate" ]]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  shopt -s nullglob
  for candidate in "${subjects_dir}/${sub}_"* "${subjects_dir}/sub-${sub}_ses-"*; do
    if [[ -d "$candidate" ]]; then
      printf '%s\n' "$candidate"
      shopt -u nullglob
      return 0
    fi
  done
  shopt -u nullglob
  return 1
}

dwi_freesurfer_subject_has_hsvs_inputs() {
  local subject_dir="$1"
  local missing=0
  local requirement
  local hsvs_requirements=(
    mri/aparc+aseg.mgz
    mri/brainmask.mgz
    mri/norm.mgz
    mri/transforms/talairach.xfm
    surf/lh.white
    surf/lh.pial
    surf/rh.white
    surf/rh.pial
  )

  for requirement in "${hsvs_requirements[@]}"; do
    if [[ ! -e "${subject_dir}/${requirement}" ]]; then
      missing=1
    fi
  done
  return "$missing"
}

dwi_print_missing_freesurfer_hsvs_inputs() {
  local subject_dir="$1"
  local requirement
  local hsvs_requirements=(
    mri/aparc+aseg.mgz
    mri/brainmask.mgz
    mri/norm.mgz
    mri/transforms/talairach.xfm
    surf/lh.white
    surf/lh.pial
    surf/rh.white
    surf/rh.pial
  )

  for requirement in "${hsvs_requirements[@]}"; do
    if [[ ! -e "${subject_dir}/${requirement}" ]]; then
      printf '    missing %s\n' "${subject_dir}/${requirement}" >&2
    fi
  done
}

dwi_resolve_freesurfer_subjects_dir() {
  local sub="$1"
  local require_subject="${2:-0}"
  local require_hsvs="${3:-0}"
  local candidates=()
  local dir
  local subject_dir
  local missing_hsvs=()

  candidates+=("$FREESURFER_SUBJECTS_DIR")
  candidates+=("${FMRIPREP_DERIVATIVES_DIR}/sourcedata/freesurfer")
  candidates+=("${FMRIPREP_DERIVATIVES_DIR}/freesurfer")
  candidates+=("$FREESURFER_FALLBACK_SUBJECTS_DIR")

  for dir in "${candidates[@]}"; do
    [[ -n "$dir" && -d "$dir" ]] || continue
    if subject_dir="$(dwi_freesurfer_subject_dir "$dir" "$sub")"; then
      if ((require_hsvs)) && ! dwi_freesurfer_subject_has_hsvs_inputs "$subject_dir"; then
        missing_hsvs+=("$subject_dir")
        continue
      fi
      printf '%s\n' "$dir"
      return 0
    fi
  done

  if ((require_hsvs)) && ((${#missing_hsvs[@]})); then
    printf 'FreeSurfer subject found for sub-%s, but required ACT-hsvs inputs are incomplete:\n' "$sub" >&2
    for subject_dir in "${missing_hsvs[@]}"; do
      printf '  %s\n' "$subject_dir" >&2
      dwi_print_missing_freesurfer_hsvs_inputs "$subject_dir"
    done
    return 1
  fi

  if ((require_subject)); then
    printf 'Required FreeSurfer subject not found for sub-%s. Checked:\n' "$sub" >&2
    printf '  %s\n' "${candidates[@]}" >&2
    return 1
  fi

  for dir in "${candidates[@]}"; do
    if [[ -n "$dir" && -d "$dir" ]]; then
      printf '%s\n' "$dir"
      return 0
    fi
  done

  printf 'Required FreeSurfer subjects directory not found. Checked:\n' >&2
  printf '  %s\n' "${candidates[@]}" >&2
  return 1
}

dwi_resolve_freesurfer_subject_dir() {
  local sub="$1"
  local require_hsvs="${2:-0}"
  local candidates=()
  local dir
  local subject_dir
  local missing_hsvs=()

  candidates+=("$FREESURFER_SUBJECTS_DIR")
  candidates+=("${FMRIPREP_DERIVATIVES_DIR}/sourcedata/freesurfer")
  candidates+=("${FMRIPREP_DERIVATIVES_DIR}/freesurfer")
  candidates+=("$FREESURFER_FALLBACK_SUBJECTS_DIR")

  for dir in "${candidates[@]}"; do
    [[ -n "$dir" && -d "$dir" ]] || continue
    if subject_dir="$(dwi_freesurfer_subject_dir "$dir" "$sub")"; then
      if ((require_hsvs)) && ! dwi_freesurfer_subject_has_hsvs_inputs "$subject_dir"; then
        missing_hsvs+=("$subject_dir")
        continue
      fi
      printf '%s\n' "$subject_dir"
      return 0
    fi
  done

  if ((require_hsvs)) && ((${#missing_hsvs[@]})); then
    printf 'FreeSurfer subject found for sub-%s, but required ACT-hsvs inputs are incomplete:\n' "$sub" >&2
    for subject_dir in "${missing_hsvs[@]}"; do
      printf '  %s\n' "$subject_dir" >&2
      dwi_print_missing_freesurfer_hsvs_inputs "$subject_dir"
    done
    return 1
  fi

  printf 'Required FreeSurfer subject not found for sub-%s. Checked:\n' "$sub" >&2
  printf '  %s\n' "${candidates[@]}" >&2
  return 1
}

dwi_require_bids_root() {
  local bidsdir="$1"
  if [[ ! -d "$bidsdir" ]]; then
    printf 'BIDS root not found: %s\n' "$bidsdir" >&2
    printf 'QSIPrep expects the shared DWI BIDS dataset at BIDS_ROOT from code/pipeline_common.sh.\n' >&2
    return 1
  fi
  if [[ ! -f "${bidsdir}/dataset_description.json" ]]; then
    printf 'BIDS dataset_description.json not found: %s\n' "${bidsdir}/dataset_description.json" >&2
    printf 'This usually means %s is not the BIDS dataset root.\n' "$bidsdir" >&2
    return 1
  fi
}

dwi_read_subjects() {
  local sublist="$1"
  python3 "${SCRIPT_DIR}/print_subjects.py" "$sublist"
}

dwi_wait_for_jobs() {
  local max_jobs="$1"
  while (( "$(jobs -rp | wc -l | tr -d ' ')" >= max_jobs )); do
    sleep 2
  done
}

dwi_wait_all() {
  local failed=0
  local pid
  for pid in "$@"; do
    if ! wait "$pid"; then
      failed=1
    fi
  done
  return "$failed"
}
