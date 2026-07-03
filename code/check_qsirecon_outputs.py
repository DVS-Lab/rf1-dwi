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


def find_any(root: Path, patterns: list[str]) -> list[Path]:
    matches: list[Path] = []
    for pattern in patterns:
        matches.extend(root.rglob(pattern))
    return sorted(set(matches))


def check_noddi(out_root: Path, sub: str, quiet: bool) -> int:
    missing: list[str] = []
    sub_root = out_root / f"sub-{sub}"
    report = out_root / f"sub-{sub}.html"

    if not out_root.is_dir():
        record_missing(missing, str(out_root), quiet)
        return 1
    if not report.is_file():
        record_missing(missing, str(report), quiet)
    if not sub_root.is_dir():
        record_missing(missing, str(sub_root), quiet)

    scalar_patterns = {
        "od": ["*model-noddi*param-od*_dwimap.nii.gz", "*model-noddi*mdp-od*_dwimap.nii.gz"],
        "icvf": ["*model-noddi*param-icvf*_dwimap.nii.gz", "*model-noddi*mdp-icvf*_dwimap.nii.gz"],
        "isovf": ["*model-noddi*param-isovf*_dwimap.nii.gz", "*model-noddi*mdp-isovf*_dwimap.nii.gz"],
    }
    counts: dict[str, int] = {}
    for name, patterns in scalar_patterns.items():
        matches = find_any(out_root, [f"**/sub-{sub}/**/{pattern}" for pattern in patterns])
        counts[name] = len(matches)
        if not matches:
            record_missing(missing, f"{out_root}/**/sub-{sub}/**/{' or '.join(patterns)}", quiet)

    if not quiet:
        print(
            f"OUTPUTS sub-{sub}: "
            f"{counts.get('od', 0)} OD, "
            f"{counts.get('icvf', 0)} ICVF, "
            f"{counts.get('isovf', 0)} ISOVF NODDI map(s)"
        )
    return 1 if missing else 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check practical QSIRecon outputs for one subject.")
    parser.add_argument("out_root", type=Path)
    parser.add_argument("subject")
    parser.add_argument("--workflow", choices=["noddi"], required=True)
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    sub = normalize_subject(args.subject)
    if args.workflow == "noddi":
        return check_noddi(args.out_root, sub, args.quiet)
    raise ValueError(f"Unsupported workflow: {args.workflow}")


if __name__ == "__main__":
    raise SystemExit(main())
