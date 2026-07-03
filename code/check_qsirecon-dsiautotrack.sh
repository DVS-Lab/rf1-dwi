#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash check_qsirecon-dsiautotrack.sh [--sublist FILE]
USAGE
}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

sublist="$BATCH_SUBLIST"
while (($#)); do
  case "$1" in
    --sublist)
      sublist="$2"
      shift 2
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

dwi_require_file "$sublist"
mapfile -t subjects < <(dwi_read_subjects "$sublist")
outdir="${PROJECT_ROOT}/derivatives/qsirecon-dsiautotrack"
printf 'Checking QSIRecon DSI Studio AutoTrack outputs under: %s\n' "$outdir" >&2
printf 'Using subject list: %s\n' "$sublist" >&2
printf 'Checking %d subject(s).\n' "${#subjects[@]}" >&2

failed=0
checked=0
for sub in "${subjects[@]}"; do
  checked=$((checked + 1))
  if ! python3 "${SCRIPT_DIR}/check_qsirecon_outputs.py" "$outdir" "$sub" --workflow dsiautotrack; then
    echo "sub-${sub}: incomplete QSIRecon DSI Studio AutoTrack outputs"
    failed=1
  fi
done

if ((failed)); then
  echo "CHECK FAILED: QSIRecon DSI Studio AutoTrack outputs incomplete for one or more of ${checked} subject(s)."
else
  echo "CHECK PASSED: QSIRecon DSI Studio AutoTrack outputs complete for ${checked} subject(s)."
fi
exit "$failed"
