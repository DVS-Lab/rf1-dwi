#!/usr/bin/env bash

dwi_script_dir() {
  cd "$(dirname "${BASH_SOURCE[1]}")" >/dev/null 2>&1 && pwd
}

dwi_load_config() {
  SCRIPT_DIR="$(dwi_script_dir)"
  PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
  BIDS_ROOT="/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/bids"
  TOOLS_ROOT="/ZPOOL/data/tools"
  SCRATCH_ROOT="/ZPOOL/data/scratch"
  TEMPLATEFLOW_HOME="${TOOLS_ROOT}/templateflow"
  MPLCONFIGDIR_HOST="${TOOLS_ROOT}/mplconfigdir"
  LICENSES_DIR="${TOOLS_ROOT}/licenses"

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
  FMRIPREP_DERIVATIVES_DIR="/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep"
  FREESURFER_SUBJECTS_DIR="/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer"
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
