# Developer Notes

These notes collect low-level behavior that is useful when changing scripts but
too detailed for the main README.

## QSIRecon Anatomy Derivatives

`code/qsirecon.sh` binds the shared fMRIPrep derivatives into the container as
`/smriprep` and passes:

```bash
--datasets smriprep=/smriprep
```

It also binds the shared FreeSurfer subjects directory and passes:

```bash
--fs-subjects-dir /freesurfer
```

For ACT-hsvs, FreeSurfer subjects are resolved from the Linux2 fMRIPrep project
and mounted at a canonical container path like `/freesurfer/sub-10317`. This is
needed because the host subjects are session-qualified, for example
`sub-10317_ses-01`.

fMRIPrep/FreeSurfer derivatives help QSIRecon reuse anatomical work, but they
do not provide DWI-specific QSIPrep transforms. Those remain QSIPrep outputs.

## Shared Caches

`code/pipeline_common.sh` defines the cache locations used by the container
wrappers:

```bash
TEMPLATEFLOW_HOME=/ZPOOL/data/tools/templateflow
DIPY_HOME_HOST=<repo>/.cache/dipy
AFQ_HOME_HOST=/ZPOOL/data/tools/AFQ_data
```

`code/qsirecon.sh` binds the PyAFQ cache into the container at `/opt/AFQ_data`
and exports both environment variable forms:

```bash
APPTAINERENV_AFQ_HOME=/opt/AFQ_data
SINGULARITYENV_AFQ_HOME=/opt/AFQ_data
```

The installed PyAFQ source uses `AFQ_HOME` when it is set and otherwise falls
back to `~/AFQ_data`:

```python
if "AFQ_HOME" in os.environ:
    afq_home = os.environ["AFQ_HOME"]
else:
    afq_home = os.path.join(os.path.expanduser("~"), "AFQ_data")
```

Run this diagnostic on Linux2 if the cache behavior needs to be confirmed
inside the exact QSIRecon container:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
bash run_logged.sh --label qsirecon-pyafq-interface --include-full-log -- \
  bash debug_qsirecon_pyafq_interface.sh
```

To confirm the QSIRecon command includes the AFQ bind without rerunning a full
workflow:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsirecon-one.txt
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml

bash run_logged.sh --label qsirecon-tractometry-dry-run-afq-cache -- \
  bash run_qsirecon-tractometry.sh \
    --sublist "$SUBLIST" \
    --jobs 1 \
    --dry-run \
    --recon-spec "$TRACT_SPEC"
```

The dry-run should print:

```text
Using PyAFQ AFQ_HOME cache: /ZPOOL/data/tools/AFQ_data -> /opt/AFQ_data
```

and the QSIRecon command should include:

```text
-B /ZPOOL/data/tools/AFQ_data:/opt/AFQ_data
```

## Logging Semantics

`run_logged.sh` records the main command exit and optional checker exit
separately. If the main command fails, the check is skipped and the record
reports `Check exit: skipped`.

Use `--include-full-log` for short diagnostics where the full output should be
kept in the Git-tracked run record. Do not use it for long processing runs
unless you intentionally want a large record.
