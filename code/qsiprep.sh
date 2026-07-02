#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash qsiprep.sh [--dry-run] [--overwrite] SUBJECT
USAGE
}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

dry_run=0
overwrite=0
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

if (($# != 1)); then
  usage
  exit 2
fi

sub="${1#sub-}"
bidsdir="$BIDS_ROOT"
derivdir="${PROJECT_ROOT}/derivatives"
qsiprepdir="${derivdir}/qsiprep"
scratchdir="${SCRATCH_ROOT}/$(whoami)/qsiprep-sub-${sub}"
qsiprep_nprocs="${QSIPREP_NPROCS:-$QSIPREP_TOTAL_NPROCS}"
qsiprep_omp_nthreads="${QSIPREP_OMP_NTHREADS:-8}"
qsiprep_mem_mb="${QSIPREP_MEM_MB:-$QSIPREP_TOTAL_MEM_MB}"

dwi_require_bids_root "$bidsdir"
python3 "${SCRIPT_DIR}/check_qsiprep_outputs.py" "$bidsdir" "$qsiprepdir" "$sub" --inputs-only

if [[ "$overwrite" -ne 1 ]] && python3 "${SCRIPT_DIR}/check_qsiprep_outputs.py" "$bidsdir" "$qsiprepdir" "$sub" --outputs-only --quiet; then
  echo "sub-${sub} already has practical QSIPrep completion outputs; skipping"
  exit 0
fi

export APPTAINERENV_TEMPLATEFLOW_HOME=/opt/templateflow
export APPTAINERENV_MPLCONFIGDIR=/opt/mplconfigdir

cmd=(
  singularity run --cleanenv
  -B "${TEMPLATEFLOW_HOME}:/opt/templateflow"
  -B "${MPLCONFIGDIR_HOST}:/opt/mplconfigdir"
  -B "${PROJECT_ROOT}:/base"
  -B "${bidsdir}:/bids"
  -B "${LICENSES_DIR}:/opts"
  -B "${scratchdir}:/scratch"
  "$QSIPREP_IMAGE"
  /bids /base/derivatives
  participant --participant_label "$sub"
  --output-resolution "$QSIPREP_OUTPUT_RESOLUTION"
  --nprocs "$qsiprep_nprocs"
  --omp-nthreads "$qsiprep_omp_nthreads"
  --mem "$qsiprep_mem_mb"
  --fs-license-file /opts/fs_license.txt
  --skip-bids-validation
  --stop-on-first-crash
  -w /scratch
)

printf 'QSIPrep command:'
printf ' %q' "${cmd[@]}"
printf '\n'
if ((dry_run)); then
  echo "Dry run: not launching QSIPrep."
  python3 "${SCRIPT_DIR}/check_qsiprep_outputs.py" "$bidsdir" "$qsiprepdir" "$sub" --outputs-only || true
  exit 0
fi

mkdir -p "$derivdir" "$scratchdir"
dwi_require_file "$QSIPREP_IMAGE"
dwi_require_file "${LICENSES_DIR}/fs_license.txt"
"${cmd[@]}"
python3 "${SCRIPT_DIR}/check_qsiprep_outputs.py" "$bidsdir" "$qsiprepdir" "$sub" --outputs-only
