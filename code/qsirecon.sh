#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash qsirecon.sh [--dry-run] [--overwrite] --workflow NAME --recon-spec SPEC SUBJECT

Supported initial workflow:
  --workflow noddi --recon-spec amico_noddi
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

dwi_require_dir "$qsiprepdir"
python3 "${SCRIPT_DIR}/check_qsiprep_outputs.py" "$BIDS_ROOT" "$qsiprepdir" "$sub" --outputs-only

if [[ "$overwrite" -ne 1 ]] && python3 "${SCRIPT_DIR}/check_qsirecon_outputs.py" "$outdir" "$sub" --workflow "$workflow" --quiet; then
  echo "sub-${sub} already has practical QSIRecon ${workflow} outputs; skipping"
  exit 0
fi

export APPTAINERENV_TEMPLATEFLOW_HOME=/opt/templateflow
export APPTAINERENV_MPLCONFIGDIR=/opt/mplconfigdir

cmd=(
  singularity run --cleanenv --writable-tmpfs
  -B "${TEMPLATEFLOW_HOME}:/opt/templateflow"
  -B "${MPLCONFIGDIR_HOST}:/opt/mplconfigdir"
  -B "${PROJECT_ROOT}:/base"
  -B "${LICENSES_DIR}:/opts"
  -B "${scratchdir}:/scratch"
  "$QSIRECON_IMAGE"
  /base/derivatives/qsiprep "$container_outdir"
  participant --participant-label "$sub"
  --recon-spec "$recon_spec"
  --input-type qsiprep
  --fs-license-file /opts/fs_license.txt
  --nprocs "$qsirecon_nprocs"
  --omp-nthreads "$qsirecon_omp_nthreads"
  --mem "$qsirecon_mem_mb"
  --stop-on-first-crash
  -w /scratch
)

printf 'QSIRecon command:'
printf ' %q' "${cmd[@]}"
printf '\n'
if ((dry_run)); then
  echo "Dry run: not launching QSIRecon."
  exit 0
fi

mkdir -p "$outdir" "$scratchdir"
dwi_require_file "$QSIRECON_IMAGE"
dwi_require_file "${LICENSES_DIR}/fs_license.txt"
"${cmd[@]}"
python3 "${SCRIPT_DIR}/check_qsirecon_outputs.py" "$outdir" "$sub" --workflow "$workflow"
