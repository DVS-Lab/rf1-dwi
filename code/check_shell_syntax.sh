#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 && pwd)"
cd "$repo_root"

while IFS= read -r script; do
  bash -n "$script"
done < <(git ls-files '*.sh' '*.qsub')

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck \
    code/pipeline_common.sh \
    code/run_logged.sh \
    code/run_qsiprep.sh \
    code/qsiprep.sh \
    code/run_qsirecon-noddi.sh \
    code/run_qsirecon-ACThsvs.sh \
    code/run_qsirecon-dsiautotrack.sh \
    code/run_qsirecon-tractometry.sh \
    code/qsirecon.sh \
    code/check_qsiprep.sh \
    code/check_qsirecon-noddi.sh \
    code/check_qsirecon-ACThsvs.sh \
    code/check_qsirecon-dsiautotrack.sh \
    code/check_qsirecon-tractometry.sh \
    code/debug_qsirecon_pyafq_interface.sh \
    code/debug_qsirecon_tractometry_inputs.sh
else
  echo "ShellCheck not installed; skipped shellcheck lint."
fi
