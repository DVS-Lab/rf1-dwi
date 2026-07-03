#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash run_qsirecon-ACThsvs.sh [--sublist FILE] [--jobs N] [--dry-run] [--overwrite]
USAGE
}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

sublist="$BATCH_SUBLIST"
max_jobs=1
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
dwi_require_file "${SCRIPT_DIR}/qsirecon.sh"
dwi_require_dir "${PROJECT_ROOT}/derivatives/qsiprep"

if [[ -z "$QSIRECON_NPROCS" ]]; then
  QSIRECON_NPROCS=$((QSIRECON_TOTAL_NPROCS / max_jobs))
  ((QSIRECON_NPROCS < 1)) && QSIRECON_NPROCS=1
fi
if [[ -z "$QSIRECON_MEM_MB" ]]; then
  QSIRECON_MEM_MB=$((QSIRECON_TOTAL_MEM_MB / max_jobs))
  ((QSIRECON_MEM_MB < 8000)) && QSIRECON_MEM_MB=8000
fi
if ((QSIRECON_OMP_NTHREADS > QSIRECON_NPROCS)); then
  QSIRECON_OMP_NTHREADS="$QSIRECON_NPROCS"
fi
export QSIRECON_NPROCS QSIRECON_OMP_NTHREADS QSIRECON_MEM_MB

echo "Using subject list: $sublist"
echo "QSIRecon ACT-hsvs resource plan: up to ${max_jobs} subject job(s); each gets --nprocs ${QSIRECON_NPROCS}, --omp-nthreads ${QSIRECON_OMP_NTHREADS}, --mem ${QSIRECON_MEM_MB} MB"

args=(--workflow ACThsvs --recon-spec mrtrix_multishell_msmt_ACT-hsvs)
((dry_run)) && args+=(--dry-run)
((overwrite)) && args+=(--overwrite)

pids=()
while IFS= read -r sub; do
  dwi_wait_for_jobs "$max_jobs"
  echo "Launching QSIRecon ACT-hsvs sub-${sub}"
  bash "${SCRIPT_DIR}/qsirecon.sh" "${args[@]}" "$sub" &
  pids+=("$!")
done < <(dwi_read_subjects "$sublist")

if ! dwi_wait_all "${pids[@]}"; then
  if ((dry_run)); then
    echo "CHECK FAILED: QSIRecon ACT-hsvs dry-run inputs incomplete for one or more of ${#pids[@]} subject(s)."
  fi
  exit 1
fi

if ((dry_run)); then
  echo "CHECK PASSED: QSIRecon ACT-hsvs dry-run inputs and commands ready for ${#pids[@]} subject(s)."
fi
