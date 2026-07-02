#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash run_qsiprep.sh [--sublist FILE] [--jobs N] [--dry-run] [--overwrite]
USAGE
}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

sublist="$BATCH_SUBLIST"
max_jobs=2
dry_run=0
overwrite=0

while (($#)); do
  case "$1" in
    --sublist)
      sublist="$2"
      shift 2
      ;;
    --jobs)
      max_jobs="$2"
      shift 2
      ;;
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
    *)
      usage
      exit 2
      ;;
  esac
done

if ! [[ "$max_jobs" =~ ^[1-9][0-9]*$ ]]; then
  echo "--jobs must be a positive integer, got: $max_jobs" >&2
  exit 2
fi

dwi_require_file "$sublist"
dwi_require_file "${SCRIPT_DIR}/qsiprep.sh"
dwi_require_bids_root "$BIDS_ROOT"

if [[ -z "$QSIPREP_NPROCS" ]]; then
  QSIPREP_NPROCS=$((QSIPREP_TOTAL_NPROCS / max_jobs))
  ((QSIPREP_NPROCS < 1)) && QSIPREP_NPROCS=1
fi
if [[ -z "$QSIPREP_MEM_MB" ]]; then
  QSIPREP_MEM_MB=$((QSIPREP_TOTAL_MEM_MB / max_jobs))
  ((QSIPREP_MEM_MB < 8000)) && QSIPREP_MEM_MB=8000
fi
if ((QSIPREP_OMP_NTHREADS > QSIPREP_NPROCS)); then
  QSIPREP_OMP_NTHREADS="$QSIPREP_NPROCS"
fi
export QSIPREP_NPROCS QSIPREP_OMP_NTHREADS QSIPREP_MEM_MB

echo "Using subject list: $sublist"
echo "QSIPrep resource plan: up to ${max_jobs} subject job(s); each gets --nprocs ${QSIPREP_NPROCS}, --omp-nthreads ${QSIPREP_OMP_NTHREADS}, --mem ${QSIPREP_MEM_MB} MB"

args=()
((dry_run)) && args+=(--dry-run)
((overwrite)) && args+=(--overwrite)

pids=()
while IFS= read -r sub; do
  dwi_wait_for_jobs "$max_jobs"
  echo "Launching QSIPrep sub-${sub}"
  bash "${SCRIPT_DIR}/qsiprep.sh" "${args[@]}" "$sub" &
  pids+=("$!")
done < <(dwi_read_subjects "$sublist")

dwi_wait_all "${pids[@]}"
