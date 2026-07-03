#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path


def normalize_subject(value: str) -> str:
    value = value.strip()
    return value[4:] if value.startswith("sub-") else value


def record_missing(missing: list[str], message: str, quiet: bool) -> None:
    missing.append(message)
    if not quiet:
        print(f"MISSING {message}")


def record_warning(message: str, quiet: bool) -> None:
    if not quiet:
        print(f"WARNING {message}")


def find_any(root: Path, patterns: list[str]) -> list[Path]:
    matches: list[Path] = []
    for pattern in patterns:
        matches.extend(root.rglob(pattern))
    return sorted(set(matches))


def check_base(out_root: Path, sub: str, quiet: bool) -> tuple[list[str], Path]:
    missing: list[str] = []
    sub_root = out_root / f"sub-{sub}"
    report = out_root / f"sub-{sub}.html"

    if not out_root.is_dir():
        record_missing(missing, str(out_root), quiet)
        return missing, sub_root
    if not report.is_file():
        record_warning(f"optional QSIRecon report not found: {report}", quiet)
    if not sub_root.is_dir():
        record_missing(missing, str(sub_root), quiet)
    return missing, sub_root


def check_required_patterns(
    out_root: Path,
    sub: str,
    required_patterns: dict[str, list[str]],
    quiet: bool,
) -> tuple[list[str], dict[str, int]]:
    missing: list[str] = []
    counts: dict[str, int] = {}
    for name, patterns in required_patterns.items():
        matches = find_any(out_root, [f"**/sub-{sub}/**/{pattern}" for pattern in patterns])
        counts[name] = len(matches)
        if not matches:
            record_missing(missing, f"{out_root}/**/sub-{sub}/**/{' or '.join(patterns)}", quiet)
    return missing, counts


def check_optional_patterns(
    out_root: Path,
    sub: str,
    optional_patterns: dict[str, list[str]],
    quiet: bool,
) -> dict[str, int]:
    counts: dict[str, int] = {}
    for name, patterns in optional_patterns.items():
        matches = find_any(out_root, [f"**/sub-{sub}/**/{pattern}" for pattern in patterns])
        counts[name] = len(matches)
        if not matches:
            record_warning(f"optional {name} not found for sub-{sub}", quiet)
    return counts


def print_counts(sub: str, counts: dict[str, int], label: str) -> None:
    count_text = ", ".join(f"{value} {name}" for name, value in counts.items())
    print(f"OUTPUTS sub-{sub}: {count_text} {label}")


def check_noddi(out_root: Path, sub: str, quiet: bool) -> int:
    missing, _ = check_base(out_root, sub, quiet)

    scalar_patterns = {
        "od": ["*model-noddi*param-od*_dwimap.nii.gz", "*model-noddi*mdp-od*_dwimap.nii.gz"],
        "icvf": ["*model-noddi*param-icvf*_dwimap.nii.gz", "*model-noddi*mdp-icvf*_dwimap.nii.gz"],
        "isovf": ["*model-noddi*param-isovf*_dwimap.nii.gz", "*model-noddi*mdp-isovf*_dwimap.nii.gz"],
    }
    scalar_missing, counts = check_required_patterns(out_root, sub, scalar_patterns, quiet)
    missing.extend(scalar_missing)

    if not quiet:
        print_counts(sub, counts, "NODDI map(s)")
    return 1 if missing else 0


def check_acthsvs(out_root: Path, sub: str, quiet: bool) -> int:
    missing, _ = check_base(out_root, sub, quiet)
    required_patterns = {
        "WM FOD": ["*param-fod*label-WM*_dwimap.mif.gz"],
        "GM FOD": ["*param-fod*label-GM*_dwimap.mif.gz"],
        "CSF FOD": ["*param-fod*label-CSF*_dwimap.mif.gz"],
        "SIFT2 weights": ["*model-sift2*_streamlineweights.csv"],
        "SIFT2 mu": ["*model-sift2*_mu.txt"],
        "HSVS segmentation": ["*seg-hsvs*_dseg.nii.gz"],
    }
    pattern_missing, counts = check_required_patterns(out_root, sub, required_patterns, quiet)
    missing.extend(pattern_missing)

    if not quiet:
        print_counts(sub, counts, "ACT-hsvs output(s)")
    return 1 if missing else 0


def check_dsiautotrack(out_root: Path, sub: str, quiet: bool) -> int:
    missing, _ = check_base(out_root, sub, quiet)
    required_patterns = {
        "bundle streamlines": ["*bundle-*_streamlines.tck", "*bundle-*_streamlines.tck.gz"],
        "DSI Studio fib": ["*_dwimap.fib.gz"],
    }
    pattern_missing, counts = check_required_patterns(out_root, sub, required_patterns, quiet)
    missing.extend(pattern_missing)
    optional_counts = check_optional_patterns(
        out_root,
        sub,
        {
            "bundle scalar stats": ["*bundles-DSIStudio*_scalarstats.tsv"],
            "bundle density stats": ["*bundles-DSIStudio*_tdistats.tsv"],
        },
        quiet,
    )
    counts.update(optional_counts)

    if not quiet:
        print_counts(sub, counts, "DSI Studio AutoTrack output(s)")
    return 1 if missing else 0


def check_tractometry(out_root: Path, sub: str, quiet: bool) -> int:
    missing, _ = check_base(out_root, sub, quiet)
    required_patterns = {
        "WM FOD": ["*param-fod*label-WM*_dwimap.mif.gz"],
        "SIFT2 weights": ["*model-sift2*_streamlineweights.csv"],
        "PyAFQ profiles": ["*tract_profiles*.csv", "*profiles*.csv", "*nodes*.csv"],
        "PyAFQ bundles": ["*bundle*.trk", "*bundle*.trk.gz", "*bundles*.trk", "*bundles*.trk.gz"],
    }
    pattern_missing, counts = check_required_patterns(out_root, sub, required_patterns, quiet)
    missing.extend(pattern_missing)

    if not quiet:
        print_counts(sub, counts, "MRtrix/PyAFQ tractometry output(s)")
    return 1 if missing else 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check practical QSIRecon outputs for one subject.")
    parser.add_argument("out_root", type=Path)
    parser.add_argument("subject")
    parser.add_argument("--workflow", choices=["noddi", "ACThsvs", "dsiautotrack", "tractometry"], required=True)
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    sub = normalize_subject(args.subject)
    if args.workflow == "noddi":
        return check_noddi(args.out_root, sub, args.quiet)
    if args.workflow == "ACThsvs":
        return check_acthsvs(args.out_root, sub, args.quiet)
    if args.workflow == "dsiautotrack":
        return check_dsiautotrack(args.out_root, sub, args.quiet)
    if args.workflow == "tractometry":
        return check_tractometry(args.out_root, sub, args.quiet)
    raise ValueError(f"Unsupported workflow: {args.workflow}")


if __name__ == "__main__":
    raise SystemExit(main())
