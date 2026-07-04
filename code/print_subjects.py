#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path


def normalize_subject(value: str) -> str:
    value = value.strip()
    if value.startswith("sub-"):
        value = value[4:]
    return value


def main() -> int:
    parser = argparse.ArgumentParser(description="Print normalized subject labels from a sublist.")
    parser.add_argument("sublist", type=Path)
    args = parser.parse_args()

    with args.sublist.open() as f:
        for raw_line in f:
            line = raw_line.split("#", 1)[0].strip()
            if not line:
                continue
            print(normalize_subject(line))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
