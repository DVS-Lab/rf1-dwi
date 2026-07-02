#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path


def normalize_subject(value: str) -> str:
    value = value.strip()
    return value[4:] if value.startswith("sub-") else value


def nifti_base(path: Path) -> Path:
    name = path.name
    if name.endswith(".nii.gz"):
        return path.with_name(name[:-7])
    if name.endswith(".nii"):
        return path.with_name(name[:-4])
    return path


def missing_companions(nifti: Path, suffixes: list[str]) -> list[Path]:
    base = nifti_base(nifti)
    return [base.with_suffix(suffix) for suffix in suffixes if not base.with_suffix(suffix).is_file()]


def record_missing(missing: list[str], message: str, quiet: bool) -> None:
    missing.append(message)
    if not quiet:
        print(f"MISSING {message}")


def record_warning(message: str, quiet: bool) -> None:
    if not quiet:
        print(f"WARNING {message}")


def check_inputs(bids_root: Path, sub: str, quiet: bool) -> int:
    missing: list[str] = []
    subdir = bids_root / f"sub-{sub}"

    if not bids_root.is_dir():
        record_missing(missing, str(bids_root), quiet)
        return 1
    if not (bids_root / "dataset_description.json").is_file():
        record_missing(missing, str(bids_root / "dataset_description.json"), quiet)
    if not subdir.is_dir():
        record_missing(missing, str(subdir), quiet)
        return 1

    dwi_inputs = sorted(path for path in subdir.rglob("*_dwi.nii*") if "/dwi/" in path.as_posix())
    t1w_inputs = sorted(path for path in subdir.rglob("*_T1w.nii*") if "/anat/" in path.as_posix())

    if not dwi_inputs:
        record_missing(missing, f"{subdir}/**/dwi/*_dwi.nii[.gz]", quiet)
    for nifti in dwi_inputs:
        for companion in missing_companions(nifti, [".bval", ".bvec", ".json"]):
            record_missing(missing, str(companion), quiet)

    if not t1w_inputs:
        record_warning(f"no T1w input found for sub-{sub}; QSIPrep may run DWI-only anatomy", quiet)

    if not quiet:
        print(f"INPUTS sub-{sub}: {len(dwi_inputs)} DWI NIfTI(s), {len(t1w_inputs)} T1w NIfTI(s)")
    return 1 if missing else 0


def check_outputs(qsiprep_root: Path, bids_root: Path, sub: str, quiet: bool) -> int:
    missing: list[str] = []
    subout = qsiprep_root / f"sub-{sub}"
    report = qsiprep_root / f"sub-{sub}.html"
    bids_subdir = bids_root / f"sub-{sub}"
    t1w_inputs = sorted(path for path in bids_subdir.rglob("*_T1w.nii*") if "/anat/" in path.as_posix()) if bids_subdir.is_dir() else []

    if not qsiprep_root.is_dir():
        record_missing(missing, str(qsiprep_root), quiet)
        return 1
    if not report.is_file():
        record_missing(missing, str(report), quiet)
    if not subout.is_dir():
        record_missing(missing, str(subout), quiet)
        return 1

    dwi_outputs = sorted(path for path in subout.rglob("*desc-preproc_dwi.nii.gz") if "/dwi/" in path.as_posix())
    if not dwi_outputs:
        record_missing(missing, f"{subout}/**/dwi/*desc-preproc_dwi.nii.gz", quiet)
    for nifti in dwi_outputs:
        for companion in missing_companions(nifti, [".bval", ".bvec", ".json"]):
            record_missing(missing, str(companion), quiet)

    if t1w_inputs:
        anat_outputs = sorted(path for path in subout.rglob("*desc-preproc_T1w.nii.gz") if "/anat/" in path.as_posix())
        mni_to_t1w = sorted(subout.rglob("*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5"))
        orig_to_t1w = sorted(subout.rglob("*from-orig_to-T1w_mode-image_xfm.txt"))
        if not anat_outputs:
            record_missing(missing, f"{subout}/**/anat/*desc-preproc_T1w.nii.gz", quiet)
        if not mni_to_t1w:
            record_missing(missing, f"{subout}/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5", quiet)
        if not orig_to_t1w:
            record_missing(missing, f"{subout}/**/anat/*from-orig_to-T1w_mode-image_xfm.txt", quiet)

    if not quiet:
        print(f"OUTPUTS sub-{sub}: {len(dwi_outputs)} preprocessed DWI NIfTI(s)")
    return 1 if missing else 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check practical QSIPrep inputs and outputs for one subject.")
    parser.add_argument("bids_root", type=Path)
    parser.add_argument("qsiprep_root", type=Path)
    parser.add_argument("subject")
    parser.add_argument("--inputs-only", action="store_true")
    parser.add_argument("--outputs-only", action="store_true")
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    sub = normalize_subject(args.subject)
    status = 0

    if not args.outputs_only:
        status |= check_inputs(args.bids_root, sub, args.quiet)
    if not args.inputs_only:
        status |= check_outputs(args.qsiprep_root, args.bids_root, sub, args.quiet)

    return 1 if status else 0


if __name__ == "__main__":
    raise SystemExit(main())
