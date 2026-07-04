#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash debug_qsirecon_tractometry_inputs.sh SUBJECT

SUBJECT may be 10317 or sub-10317.
USAGE
}

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

if (($# != 1)); then
  usage
  exit 2
fi

sub="${1#sub-}"
qsiprep_subdir="${PROJECT_ROOT}/derivatives/qsiprep/sub-${sub}"
tractometry_dir="${PROJECT_ROOT}/derivatives/qsirecon-tractometry"
scratch_dir="${SCRATCH_ROOT}/$(whoami)/qsirecon-tractometry-sub-${sub}"

print_header() {
  printf '\n## %s\n' "$1"
}

print_root() {
  local label="$1"
  local root="$2"
  printf '%s: %s\n' "$label" "$root"
  if [[ -d "$root" ]]; then
    printf 'Status: present\n'
  else
    printf 'Status: missing\n'
  fi
}

find_name_patterns() {
  local root="$1"
  shift
  [[ -d "$root" ]] || return 0
  local pattern
  for pattern in "$@"; do
    find "$root" -type f -name "$pattern" -print 2>/dev/null
  done | sort -u
}

find_path_patterns() {
  local root="$1"
  shift
  [[ -d "$root" ]] || return 0
  local pattern
  for pattern in "$@"; do
    find "$root" -type f -path "$pattern" -print 2>/dev/null
  done | sort -u
}

print_matches() {
  local label="$1"
  local root="$2"
  shift 2
  local matches
  local count
  matches="$(find_name_patterns "$root" "$@")"
  if [[ -n "$matches" ]]; then
    count="$(printf '%s\n' "$matches" | wc -l | tr -d ' ')"
  else
    count=0
  fi
  print_header "$label"
  print_root "Root" "$root"
  printf 'Count: %d\n' "$count"
  if [[ -n "$matches" ]]; then
    printf '%s\n' "$matches"
  fi
}

print_path_matches() {
  local label="$1"
  local root="$2"
  shift 2
  local matches
  local count
  matches="$(find_path_patterns "$root" "$@")"
  if [[ -n "$matches" ]]; then
    count="$(printf '%s\n' "$matches" | wc -l | tr -d ' ')"
  else
    count=0
  fi
  print_header "$label"
  print_root "Root" "$root"
  printf 'Count: %d\n' "$count"
  if [[ -n "$matches" ]]; then
    printf '%s\n' "$matches"
  fi
}

print_crash_context() {
  local root="$1"
  local crashes
  local count
  crashes="$(find_name_patterns "$root" "*crash*.txt" "crash-*")"
  if [[ -n "$crashes" ]]; then
    count="$(printf '%s\n' "$crashes" | wc -l | tr -d ' ')"
  else
    count=0
  fi
  print_header "Crash Context"
  print_root "Root" "$root"
  printf 'Crash files: %d\n' "$count"
  if [[ -z "$crashes" ]]; then
    return 0
  fi

  local crash
  while IFS= read -r crash; do
    [[ -n "$crash" ]] || continue
    printf '\n### %s\n' "$crash"
    if command -v rg >/dev/null 2>&1; then
      rg -n -B 30 -A 60 "CsdNanResponseError|run_afq|Could not compute CSD response|No voxel" "$crash" || true
    else
      grep -n -B 30 -A 60 -E "CsdNanResponseError|run_afq|Could not compute CSD response|No voxel" "$crash" || true
    fi
  done <<< "$crashes"
}

printf 'QSIRecon tractometry diagnostic summary\n'
printf 'Subject: sub-%s\n' "$sub"
printf 'Project root: %s\n' "$PROJECT_ROOT"
printf 'Generated: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %Z')"

print_header "Roots"
print_root "QSIPrep subject" "$qsiprep_subdir"
print_root "QSIRecon tractometry" "$tractometry_dir"
print_root "Tractometry scratch" "$scratch_dir"

print_matches "QSIPrep Preprocessed DWI" "$qsiprep_subdir" \
  "*desc-preproc*_dwi.nii.gz" "*space-*_dwi.nii.gz"
print_matches "QSIPrep Gradients and Metadata" "$qsiprep_subdir" \
  "*_dwi.bval" "*_dwi.bvec" "*_dwi.json"
print_matches "Brain Masks" "$qsiprep_subdir" \
  "*desc-brain_mask.nii.gz" "*_mask.nii.gz"

print_matches "QSIRecon DTI FA/MD Derivatives" "$tractometry_dir" \
  "*odfmodel-DTI_desc-FA_dwi.nii.gz" "*odfmodel-DTI_desc-MD_dwi.nii.gz" \
  "*desc-FA_dwi.nii.gz" "*desc-MD_dwi.nii.gz"
print_matches "Scratch DTI FA/MD Derivatives" "$scratch_dir" \
  "*odfmodel-DTI_desc-FA_dwi.nii.gz" "*odfmodel-DTI_desc-MD_dwi.nii.gz" \
  "*desc-FA_dwi.nii.gz" "*desc-MD_dwi.nii.gz"

print_matches "MRtrix FOD Maps" "$tractometry_dir" \
  "*param-fod*_dwimap.mif.gz" "*param-fod*_dwimap.nii.gz"
print_matches "Scratch MRtrix FOD Maps" "$scratch_dir" \
  "*param-fod*_dwimap.mif.gz" "*param-fod*_dwimap.nii.gz"

print_matches "Tractograms and Bundles" "$tractometry_dir" \
  "*.tck" "*.tck.gz" "*.trk" "*.trk.gz"
print_matches "Scratch Tractograms and Bundles" "$scratch_dir" \
  "*.tck" "*.tck.gz" "*.trk" "*.trk.gz"

print_path_matches "PyAFQ Shim Inputs and Outputs" "$scratch_dir" \
  "*/pyafq_tractometry/run_afq/study/subject/*"

print_matches "PyAFQ Profiles" "$tractometry_dir" \
  "*tract_profiles*.csv" "*profiles*.csv" "*nodes*.csv"
print_matches "QSIRecon Crash Files" "$tractometry_dir" \
  "*crash*.txt" "crash-*"
print_matches "Scratch Crash and Result Files" "$scratch_dir" \
  "*crash*.txt" "crash-*" "*.pklz" "result_*.json"

print_crash_context "$tractometry_dir"
print_crash_context "$scratch_dir"
