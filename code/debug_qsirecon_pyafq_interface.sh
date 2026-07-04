#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: bash debug_qsirecon_pyafq_interface.sh

Print QSIRecon 26.0.0/PyAFQ interface source, scalar parsing behavior, and
candidate built-in reconstruction specs from inside the configured container.
USAGE
}

if (($#)); then
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 2
      ;;
  esac
fi

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=code/pipeline_common.sh
source "${scriptdir}/pipeline_common.sh"
dwi_load_config

dwi_require_file "$QSIRECON_IMAGE"
container_afq_home="/opt/AFQ_data"
export APPTAINERENV_AFQ_HOME="$container_afq_home"
export SINGULARITYENV_AFQ_HOME="$container_afq_home"
mkdir -p "$AFQ_HOME_HOST"

container_runtime="${SINGULARITY_CMD:-singularity}"
if ! command -v "$container_runtime" >/dev/null 2>&1; then
  if command -v apptainer >/dev/null 2>&1; then
    container_runtime="apptainer"
  else
    printf 'Neither singularity nor apptainer was found on PATH.\n' >&2
    exit 1
  fi
fi

printf 'QSIRecon PyAFQ interface diagnostic\n'
printf 'Host: %s\n' "$(hostname 2>/dev/null || echo unknown)"
printf 'User: %s\n' "$(whoami 2>/dev/null || echo unknown)"
printf 'Container runtime: %s\n' "$container_runtime"
printf 'QSIRecon image: %s\n' "$QSIRECON_IMAGE"
printf 'Host AFQ_HOME_HOST: %s\n' "$AFQ_HOME_HOST"
printf 'Container AFQ_HOME: %s\n' "$container_afq_home"
printf '\n'

"$container_runtime" exec -B "${AFQ_HOME_HOST}:${container_afq_home}" "$QSIRECON_IMAGE" python - <<'PY'
from importlib import metadata
from pathlib import Path
import inspect
import os
from pprint import pprint
import sys


def dist_version(*names):
    for name in names:
        try:
            return f"{name} {metadata.version(name)}"
        except metadata.PackageNotFoundError:
            pass
    return "unknown"


def heading(title):
    print(f"\n## {title}")


def print_source(label, obj):
    heading(label)
    try:
        print(inspect.getsource(obj))
    except Exception as exc:
        print(f"SOURCE UNAVAILABLE: {exc!r}")
        try:
            print(f"signature: {inspect.signature(obj)}")
        except Exception as sig_exc:
            print(f"SIGNATURE UNAVAILABLE: {sig_exc!r}")


def print_text_file(path, max_chars=12000):
    text = path.read_text()
    if len(text) <= max_chars:
        print(text)
        return
    print(text[:max_chars])
    print(f"\n... truncated after {max_chars} characters from {path}")


def print_source_matches(label, source, terms):
    heading(label)
    for lineno, line in enumerate(source.splitlines(), start=1):
        if any(term in line for term in terms):
            print(f"{lineno}: {line}")


import AFQ
import AFQ.data.fetch as afq_fetch
import AFQ.tasks.data as data
import qsirecon
import qsirecon.interfaces.pyafq as qpyafq

heading("Versions and Paths")
print(f"Python executable: {sys.executable}")
print(f"Python version: {sys.version}")
print(f"QSIRecon distribution: {dist_version('qsirecon')}")
print(f"QSIRecon __version__: {getattr(qsirecon, '__version__', 'unknown')}")
print(f"QSIRecon package: {qsirecon.__file__}")
print(f"PyAFQ distribution: {dist_version('pyAFQ', 'pyafq', 'AFQ')}")
print(f"AFQ __version__: {getattr(AFQ, '__version__', 'unknown')}")
print(f"AFQ package: {AFQ.__file__}")
print(f"AFQ.data.fetch: {afq_fetch.__file__}")
print(f"AFQ_HOME: {os.environ.get('AFQ_HOME')}")
print(f"QSIRecon PyAFQ interface: {qpyafq.__file__}")
print(f"AFQ.tasks.data: {data.__file__}")

try:
    afq_fetch_source = Path(afq_fetch.__file__).read_text()
except (OSError, UnicodeDecodeError) as exc:
    heading("AFQ.data.fetch AFQ_HOME behavior")
    print(f"Could not read AFQ.data.fetch source: {exc!r}")
else:
    print_source_matches(
        "AFQ.data.fetch AFQ_HOME behavior",
        afq_fetch_source,
        ("AFQ_HOME", "AFQ_data", "afq_home", "expanduser"),
    )

print_source("qsirecon.interfaces.pyafq source", qpyafq)

try:
    import qsirecon.workflows.recon.pyafq as workflow_pyafq
except Exception as exc:
    heading("qsirecon.workflows.recon.pyafq source")
    print(f"IMPORT FAILED: {exc!r}")
else:
    print(f"QSIRecon PyAFQ workflow builder: {workflow_pyafq.__file__}")
    print_source("qsirecon.workflows.recon.pyafq source", workflow_pyafq)

print_source("AFQ.tasks.data.get_data_plan source", data.get_data_plan)

try:
    import AFQ.tasks.mapping as mapping
except Exception as exc:
    heading("AFQ.tasks.mapping source")
    print(f"IMPORT FAILED: {exc!r}")
else:
    heading("AFQ.tasks.mapping paths")
    mapping_file = Path(mapping.__file__)
    print(f"AFQ.tasks.mapping: {mapping_file}")
    try:
        mapping_source = mapping_file.read_text()
    except (OSError, UnicodeDecodeError) as exc:
        mapping_source = ""
        print(f"Could not read mapping source: {exc!r}")
    if mapping_source:
        print_source_matches(
            "AFQ.tasks.mapping source matches",
            mapping_source,
            (
                "filename_dict",
                "reg_subject_spec",
                "power_map",
                "b0",
                "dti_fa",
                "dti_md",
                "csd",
                "get_reg_subject",
            ),
        )
        heading("AFQ.tasks.mapping full source")
        print_text_file(mapping_file, max_chars=30000)
    filename_dict = getattr(mapping, "filename_dict", None)
    heading("AFQ.tasks.mapping.filename_dict")
    if filename_dict is None:
        print("filename_dict not found")
    else:
        pprint(filename_dict)
        print("\nfilename_dict keys:")
        for key in sorted(filename_dict):
            print(f"- {key}")
        print("\nSelected registration target mappings:")
        for key in ("power_map", "b0", "dti_fa", "dti_md", "dki_fa", "dki_md"):
            print(f"{key}: {filename_dict.get(key, '<missing>')}")
    get_reg_subject = getattr(mapping, "get_reg_subject", None)
    if get_reg_subject is None:
        heading("AFQ.tasks.mapping.get_reg_subject source")
        print("get_reg_subject not found")
    else:
        heading("AFQ.tasks.mapping.get_reg_subject object")
        print(f"type: {type(get_reg_subject)!r}")
        print(f"repr: {get_reg_subject!r}")
        print("candidate attributes:")
        for attr_name in (
            "function",
            "_function",
            "fn",
            "outputs",
            "params",
            "afferents",
            "efferents",
            "name",
        ):
            try:
                attr_value = getattr(get_reg_subject, attr_name)
            except Exception as exc:
                print(f"- {attr_name}: ERROR {exc!r}")
                continue
            print(f"- {attr_name}: {attr_value!r}")
            if attr_name in ("function", "_function", "fn"):
                print_source(f"AFQ.tasks.mapping.get_reg_subject.{attr_name} source", attr_value)
        print_source("AFQ.tasks.mapping.get_reg_subject source", get_reg_subject)

try:
    import AFQ.utils.bin as afq_bin
except Exception as exc:
    heading("AFQ.utils.bin scalar parsing")
    print(f"IMPORT FAILED: {exc!r}")
else:
    toml_to_val = getattr(afq_bin, "toml_to_val", None)
    if toml_to_val is None:
        heading("AFQ.utils.bin scalar parsing")
        print("toml_to_val not found in AFQ.utils.bin")
    else:
        print_source("AFQ.utils.bin.toml_to_val source", toml_to_val)
        heading("AFQ.utils.bin.toml_to_val examples")
        examples = [
            "['dti_fa', 'dti_md']",
            "[]",
            "dti_fa",
            "{'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'}",
        ]
        for example in examples:
            try:
                parsed = toml_to_val(example)
            except Exception as exc:
                print(f"{example!r} -> ERROR {exc!r}")
            else:
                print(f"{example!r} -> {parsed!r} ({type(parsed).__name__})")

heading("Scalar Format Inference From Installed Source")
get_data_plan_source = inspect.getsource(data.get_data_plan)
if 'kwargs["scalars"][0]' in get_data_plan_source:
    print("- Installed PyAFQ indexes kwargs['scalars'][0], so an empty scalars list is invalid.")
if 'isinstance(kwargs["scalars"], list)' in get_data_plan_source:
    print("- Installed PyAFQ expects scalars to be a list when the scalars key is provided.")
if 'Definition' in get_data_plan_source and 'str' in get_data_plan_source:
    print("- The first scalar entry is checked against string or Definition-like scalar definitions.")
print("- Treat these notes as direct source-derived diagnostics, not a replacement for a test run.")

qsirecon_root = Path(qsirecon.__file__).resolve().parent
yaml_paths = sorted(qsirecon_root.rglob("*.yaml"))

heading("QSIRecon YAML Specs Under pipeline/data Paths")
for path in yaml_paths:
    if "pipeline" in str(path) or "data" in str(path):
        print(path)

heading("Candidate Built-In Specs Mentioning DTI, DKI, MAPMRI, PyAFQ, Tractometry, or Scalars")
keywords = (
    "dti",
    "dki",
    "mapmri",
    "pyafq",
    "tractometry",
    "scalar",
    "dti_fa",
    "dti_md",
    "tensor",
)
for path in yaml_paths:
    try:
        text = path.read_text()
    except (OSError, UnicodeDecodeError):
        continue
    haystack = f"{path.name}\n{text}".lower()
    if any(keyword in haystack for keyword in keywords):
        print(f"\n### {path}")
        print_text_file(path)
PY
