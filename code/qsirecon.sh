#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash qsirecon.sh [--dry-run] [--overwrite] [--atlases LIST] --workflow NAME --recon-spec SPEC SUBJECT

Supported initial workflow:
  --workflow noddi --recon-spec amico_noddi

Atlas LIST may be comma- or space-separated when quoted, for example:
  --atlases AAL116
  --atlases "AAL116 Gordon333Ext"
USAGE
}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

dry_run=0
overwrite=0
workflow=""
recon_spec=""
atlas_values=()
while (($#)); do
  case "$1" in
    --dry-run)
      dry_run=1
      shift
      ;;
    --overwrite)
      overwrite=1
      shift
      ;;
    --workflow)
      workflow="$2"
      shift 2
      ;;
    --recon-spec)
      recon_spec="$2"
      shift 2
      ;;
    --atlases)
      atlas_arg="${2:-}"
      if [[ -z "$atlas_arg" ]]; then
        usage
        exit 2
      fi
      atlas_arg="${atlas_arg//,/ }"
      read -r -a parsed_atlases <<< "$atlas_arg"
      atlas_values+=("${parsed_atlases[@]}")
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      usage
      exit 2
      ;;
    *)
      break
      ;;
  esac
done

if (($# != 1)) || [[ -z "$workflow" || -z "$recon_spec" ]]; then
  usage
  exit 2
fi

sub="${1#sub-}"
qsiprepdir="${PROJECT_ROOT}/derivatives/qsiprep"
outdir="${PROJECT_ROOT}/derivatives/qsirecon-${workflow}"
container_outdir="/base/derivatives/qsirecon-${workflow}"
scratchdir="${SCRATCH_ROOT}/$(whoami)/qsirecon-${workflow}-sub-${sub}"
qsirecon_nprocs="${QSIRECON_NPROCS:-$QSIRECON_TOTAL_NPROCS}"
qsirecon_omp_nthreads="${QSIRECON_OMP_NTHREADS:-8}"
qsirecon_mem_mb="${QSIRECON_MEM_MB:-$QSIRECON_TOTAL_MEM_MB}"
container_dipy_home="/opt/dipy"
container_afq_home="/opt/AFQ_data"
container_freesurfer_dir="/freesurfer"
container_freesurfer_subject_dir="${container_freesurfer_dir}/sub-${sub}"
scratch_freesurfer_dir="${scratchdir}/freesurfer"
require_freesurfer_subject=0
require_freesurfer_hsvs=0
if [[ "$recon_spec" == *"ACT-hsvs"* ]]; then
  require_freesurfer_subject=1
  require_freesurfer_hsvs=1
fi

dwi_require_dir "$qsiprepdir"
dwi_require_dir "$FMRIPREP_DERIVATIVES_DIR"
freesurfer_subjects_dir=""
freesurfer_subject_dir=""
freesurfer_container_args=()
if ((require_freesurfer_subject)); then
  freesurfer_subject_dir="$(dwi_resolve_freesurfer_subject_dir "$sub" "$require_freesurfer_hsvs")"
  freesurfer_container_args=(
    -B "${scratch_freesurfer_dir}:${container_freesurfer_dir}"
    -B "${freesurfer_subject_dir}:${container_freesurfer_subject_dir}:ro"
  )
else
  freesurfer_subjects_dir="$(dwi_resolve_freesurfer_subjects_dir "$sub" 0 0)"
  freesurfer_container_args=(
    -B "${freesurfer_subjects_dir}:${container_freesurfer_dir}:ro"
  )
fi
python3 "${SCRIPT_DIR}/check_qsiprep_outputs.py" "$BIDS_ROOT" "$qsiprepdir" "$sub" --outputs-only

if [[ "$overwrite" -ne 1 ]] && python3 "${SCRIPT_DIR}/check_qsirecon_outputs.py" "$outdir" "$sub" --workflow "$workflow" --quiet; then
  echo "sub-${sub} already has practical QSIRecon ${workflow} outputs; skipping"
  exit 0
fi

export APPTAINERENV_TEMPLATEFLOW_HOME=/opt/templateflow
export APPTAINERENV_MPLCONFIGDIR=/opt/mplconfigdir
export APPTAINERENV_DIPY_HOME="$container_dipy_home"
export APPTAINERENV_AFQ_HOME="$container_afq_home"
export SINGULARITYENV_AFQ_HOME="$container_afq_home"
export APPTAINERENV_AMICO_LMAX="$QSIRECON_AMICO_LMAX"
export APPTAINERENV_AMICO_NDIRS="$QSIRECON_AMICO_NDIRS"

container_args=(
  --cleanenv --writable-tmpfs
  -B "${TEMPLATEFLOW_HOME}:/opt/templateflow"
  -B "${MPLCONFIGDIR_HOST}:/opt/mplconfigdir"
  -B "${DIPY_HOME_HOST}:${container_dipy_home}"
  -B "${AFQ_HOME_HOST}:${container_afq_home}"
  -B "${PROJECT_ROOT}:/base"
  -B "${FMRIPREP_DERIVATIVES_DIR}:/smriprep:ro"
  "${freesurfer_container_args[@]}"
  -B "${LICENSES_DIR}:/opts"
  -B "${scratchdir}:/scratch"
)

amico_setup_python='import os
from dipy.data.fetcher import dipy_home
import amico.lut
lmax = int(os.environ.get("AMICO_LMAX", "12"))
ndirs = int(os.environ.get("AMICO_NDIRS", "500"))
print(f"Preparing AMICO rotation matrices in {dipy_home} for lmax={lmax}, ndirs={ndirs}", flush=True)
amico.lut.precompute_rotation_matrices(lmax, ndirs)
print("AMICO rotation matrices ready.", flush=True)'

amico_setup_cmd=()
if [[ "$recon_spec" == "amico_noddi" ]]; then
  amico_setup_cmd=(
    singularity exec "${container_args[@]}"
    "$QSIRECON_IMAGE"
    python -c "$amico_setup_python"
  )
fi

atlas_args=()
if ((${#atlas_values[@]})); then
  atlas_args=(--atlases "${atlas_values[@]}")
fi

cmd=(
  singularity run "${container_args[@]}"
  "$QSIRECON_IMAGE"
  /base/derivatives/qsiprep "$container_outdir"
  participant --participant-label "$sub"
  --recon-spec "$recon_spec"
  "${atlas_args[@]}"
  --input-type qsiprep
  --datasets smriprep=/smriprep
  --fs-subjects-dir /freesurfer
  --fs-license-file /opts/fs_license.txt
  --nprocs "$qsirecon_nprocs"
  --omp-nthreads "$qsirecon_omp_nthreads"
  --mem "$qsirecon_mem_mb"
  --stop-on-first-crash
  -w /scratch
)

if ((${#amico_setup_cmd[@]})); then
  printf 'AMICO setup command:'
  printf ' %q' "${amico_setup_cmd[@]}"
  printf '\n'
fi
if ((require_freesurfer_subject)); then
  printf 'Using FreeSurfer subject directory: %s\n' "$freesurfer_subject_dir"
  printf 'Mounting FreeSurfer subject as: %s\n' "$container_freesurfer_subject_dir"
else
  printf 'Using FreeSurfer subjects directory: %s\n' "$freesurfer_subjects_dir"
fi
if ((${#atlas_values[@]})); then
  printf 'QSIRecon atlases:'
  printf ' %s' "${atlas_values[@]}"
  printf '\n'
fi
printf 'Using PyAFQ AFQ_HOME cache: %s -> %s\n' "$AFQ_HOME_HOST" "$container_afq_home"
printf 'QSIRecon command:'
printf ' %q' "${cmd[@]}"
printf '\n'
if ((dry_run)); then
  echo "Dry run: not launching QSIRecon."
  exit 0
fi

mkdir -p "$outdir" "$scratchdir" "$DIPY_HOME_HOST" "$AFQ_HOME_HOST"
if ((require_freesurfer_subject)); then
  mkdir -p "${scratch_freesurfer_dir}/sub-${sub}"
fi
dwi_require_file "$QSIRECON_IMAGE"
dwi_require_file "${LICENSES_DIR}/fs_license.txt"
if ((${#amico_setup_cmd[@]})); then
  "${amico_setup_cmd[@]}"
fi
"${cmd[@]}"
python3 "${SCRIPT_DIR}/check_qsirecon_outputs.py" "$outdir" "$sub" --workflow "$workflow"
