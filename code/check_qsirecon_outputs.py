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


def relative_paths(root: Path, paths: list[Path]) -> list[str]:
    relative: list[str] = []
    for path in paths:
        try:
            relative.append(str(path.relative_to(root)))
        except ValueError:
            relative.append(str(path))
    return relative


def find_any(root: Path, patterns: list[str]) -> list[Path]:
    matches: list[Path] = []
    for pattern in patterns:
        matches.extend(root.rglob(pattern))
    return sorted(set(matches))


def check_base(out_root: Path, sub: str, quiet: bool) -> tuple[list[str], Path]:
    missing: list[str] = []
    sub_root = out_root / f"sub-{sub}"

    if not out_root.is_dir():
        record_missing(missing, str(out_root), quiet)
        return missing, sub_root
    if not (out_root / "dataset_description.json").is_file():
        record_missing(missing, str(out_root / "dataset_description.json"), quiet)
    reports = find_any(out_root, [f"**/sub-{sub}.html"])
    if not reports:
        record_warning(f"optional QSIRecon report not found under: {out_root}/**/sub-{sub}.html", quiet)
    if not sub_root.is_dir():
        record_missing(missing, str(sub_root), quiet)
    return missing, sub_root


def check_required_patterns(
    out_root: Path,
    sub: str,
    required_patterns: dict[str, list[str]],
    quiet: bool,
) -> tuple[list[str], dict[str, int], dict[str, list[Path]]]:
    missing: list[str] = []
    counts: dict[str, int] = {}
    matches_by_name: dict[str, list[Path]] = {}
    for name, patterns in required_patterns.items():
        matches = find_any(out_root, [f"**/sub-{sub}/**/{pattern}" for pattern in patterns])
        matches_by_name[name] = matches
        counts[name] = len(matches)
        if not matches:
            record_missing(missing, f"{out_root}/**/sub-{sub}/**/{' or '.join(patterns)}", quiet)
    return missing, counts, matches_by_name


def check_optional_patterns(
    out_root: Path,
    sub: str,
    optional_patterns: dict[str, list[str]],
    quiet: bool,
) -> tuple[dict[str, int], dict[str, list[Path]]]:
    counts: dict[str, int] = {}
    matches_by_name: dict[str, list[Path]] = {}
    for name, patterns in optional_patterns.items():
        matches = find_any(out_root, [f"**/sub-{sub}/**/{pattern}" for pattern in patterns])
        matches_by_name[name] = matches
        counts[name] = len(matches)
        if not matches:
            record_warning(f"optional {name} not found for sub-{sub}", quiet)
    return counts, matches_by_name


def print_counts(sub: str, counts: dict[str, int], label: str) -> None:
    count_text = ", ".join(f"{value} {name}" for name, value in counts.items())
    print(f"OUTPUTS sub-{sub}: {count_text} {label}")


def print_match_examples(out_root: Path, matches_by_name: dict[str, list[Path]], max_files: int) -> None:
    for name, matches in matches_by_name.items():
        if not matches:
            continue
        shown = relative_paths(out_root, matches[:max_files])
        for path in shown:
            print(f"  {name}: {path}")
        if len(matches) > max_files:
            print(f"  {name}: ... {len(matches) - max_files} more")


def check_noddi(out_root: Path, sub: str, quiet: bool, max_files: int) -> int:
    missing, _ = check_base(out_root, sub, quiet)

    scalar_patterns = {
        "od": ["*model-noddi*param-od*_dwimap.nii.gz", "*model-noddi*mdp-od*_dwimap.nii.gz"],
        "icvf": ["*model-noddi*param-icvf*_dwimap.nii.gz", "*model-noddi*mdp-icvf*_dwimap.nii.gz"],
        "isovf": ["*model-noddi*param-isovf*_dwimap.nii.gz", "*model-noddi*mdp-isovf*_dwimap.nii.gz"],
    }
    scalar_missing, counts, required_matches = check_required_patterns(out_root, sub, scalar_patterns, quiet)
    missing.extend(scalar_missing)
    optional_counts, optional_matches = check_optional_patterns(
        out_root,
        sub,
        {
            "rmse": ["*model-noddi*param-rmse*_dwimap.nii.gz"],
            "nrmse": ["*model-noddi*param-nrmse*_dwimap.nii.gz"],
            "tf": ["*model-noddi*param-tf*_dwimap.nii.gz"],
            "direction map": ["*model-noddi*param-direction*_dwimap.nii.gz"],
            "direction fib": ["*model-noddi*param-direction*_dwi.fib.gz", "*model-noddi*param-direction*_dwimap.fib.gz"],
            "config": ["*model-noddi*_config.pickle.gz"],
        },
        quiet,
    )
    counts.update(optional_counts)

    if not quiet:
        print_counts(sub, counts, "NODDI map(s)")
        print_match_examples(out_root, {**required_matches, **optional_matches}, max_files)
    return 1 if missing else 0


def check_acthsvs(out_root: Path, sub: str, quiet: bool, max_files: int) -> int:
    missing, _ = check_base(out_root, sub, quiet)
    required_patterns = {
        "WM FOD": ["*param-fod*label-WM*_dwimap.mif.gz"],
        "GM FOD": ["*param-fod*label-GM*_dwimap.mif.gz"],
        "CSF FOD": ["*param-fod*label-CSF*_dwimap.mif.gz"],
        "SIFT2 weights": ["*model-sift2*_streamlineweights.csv"],
        "SIFT2 mu": ["*model-sift2*_mu.txt"],
        "tractogram": ["*streamlines.tck", "*streamlines.tck.gz"],
        "connectivity matrix": ["*connectivity.mat"],
        "HSVS segmentation": ["*seg-hsvs*_probseg.nii.gz", "*seg-hsvs*probseg.nii.gz"],
        "atlas segmentation": ["*space-T1w_seg-*_dseg.nii.gz", "*space-*_seg-*_dseg.nii.gz"],
    }
    pattern_missing, counts, matches = check_required_patterns(out_root, sub, required_patterns, quiet)
    missing.extend(pattern_missing)
    optional_counts, optional_matches = check_optional_patterns(
        out_root,
        sub,
        {
            "fsnative HSVS segmentation": ["*seg-hsvs*_probseg.mif.gz", "*seg-hsvs*probseg.mif.gz"],
            "atlas LUT": ["*seg-*_dseg.txt"],
            "exemplar bundles": ["*exemplarbundles.zip"],
        },
        quiet,
    )
    counts.update(optional_counts)

    if not quiet:
        print_counts(sub, counts, "ACT-hsvs output(s)")
        print_match_examples(out_root, {**matches, **optional_matches}, max_files)
    return 1 if missing else 0


def check_dsiautotrack(out_root: Path, sub: str, quiet: bool, max_files: int) -> int:
    missing, _ = check_base(out_root, sub, quiet)
    required_patterns = {
        "bundle streamlines": ["*bundle-*_streamlines.tck", "*bundle-*_streamlines.tck.gz"],
        "DSI Studio fib": ["*_dwimap.fib.gz"],
    }
    pattern_missing, counts, matches = check_required_patterns(out_root, sub, required_patterns, quiet)
    missing.extend(pattern_missing)
    optional_counts, optional_matches = check_optional_patterns(
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
        print_match_examples(out_root, {**matches, **optional_matches}, max_files)
    return 1 if missing else 0


def check_tractometry(out_root: Path, sub: str, quiet: bool, max_files: int) -> int:
    missing, _ = check_base(out_root, sub, quiet)
    required_patterns = {
        "WM FOD": ["*param-fod*label-WM*_dwimap.mif.gz"],
        "SIFT2 weights": ["*model-sift2*_streamlineweights.csv"],
        "PyAFQ profiles": ["*tract_profiles*.csv", "*profiles*.csv", "*nodes*.csv"],
        "PyAFQ bundles": ["*bundle*.trk", "*bundle*.trk.gz", "*bundles*.trk", "*bundles*.trk.gz"],
    }
    pattern_missing, counts, matches = check_required_patterns(out_root, sub, required_patterns, quiet)
    missing.extend(pattern_missing)

    if not quiet:
        print_counts(sub, counts, "MRtrix/PyAFQ tractometry output(s)")
        print_match_examples(out_root, matches, max_files)
    return 1 if missing else 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check practical QSIRecon outputs for one subject.")
    parser.add_argument("out_root", type=Path)
    parser.add_argument("subject")
    parser.add_argument("--workflow", choices=["noddi", "ACThsvs", "dsiautotrack", "tractometry"], required=True)
    parser.add_argument("--quiet", action="store_true")
    parser.add_argument("--max-files", type=int, default=8, help="Maximum matched paths to print per output class.")
    args = parser.parse_args()

    sub = normalize_subject(args.subject)
    if args.workflow == "noddi":
        return check_noddi(args.out_root, sub, args.quiet, args.max_files)
    if args.workflow == "ACThsvs":
        return check_acthsvs(args.out_root, sub, args.quiet, args.max_files)
    if args.workflow == "dsiautotrack":
        return check_dsiautotrack(args.out_root, sub, args.quiet, args.max_files)
    if args.workflow == "tractometry":
        return check_tractometry(args.out_root, sub, args.quiet, args.max_files)
    raise ValueError(f"Unsupported workflow: {args.workflow}")


if __name__ == "__main__":
    raise SystemExit(main())
