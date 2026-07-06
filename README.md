# RF1 DWI Processing

This repository contains the Smith Lab Linux2 production workflow for RF1 DWI
preprocessing and reconstruction. It runs after the shared RF1-SRA
fMRI/data-management workflow in `rf1-sra-linux2`.

The maintained workflow is:

- consume the shared BIDS dataset from `rf1-sra-linux2`;
- preprocess DWI data with QSIPrep;
- run selected QSIRecon reconstructions;
- check that expected derivatives were written;
- keep compact run records in Git while leaving imaging outputs and raw logs out
  of Git.

Large derivatives are written under `derivatives/` and raw logs under
`logs/runs/`; both are ignored by Git. Small Markdown summaries under
`logs/records/` are intentionally trackable.

## Pipeline Map

Run `rf1-sra-linux2` first. This DWI repository expects the shared BIDS,
fMRIPrep, and FreeSurfer outputs from the production Linux2 checkout:

```bash
BIDS_ROOT=/ZPOOL/data/projects/rf1-sra-linux2/bids
FMRIPREP_DERIVATIVES_DIR=/ZPOOL/data/projects/rf1-sra-linux2/derivatives/fmriprep
FREESURFER_SUBJECTS_DIR=/ZPOOL/data/projects/rf1-sra-linux2/derivatives/freesurfer
```

The DWI workflow should not copy, regenerate, or track those upstream outputs.
Old validation checkout names are documented only in archive/developer notes;
they are not production defaults.

```text
rf1-sra-linux2 shared BIDS/fMRIPrep/FreeSurfer
  -> rf1-dwi QSIPrep
  -> rf1-dwi QSIRecon workflow-specific derivatives
  -> rf1-dwi output checkers
  -> compact run records
```

| Stage | Required input | Run script | Output | Check script |
| --- | --- | --- | --- | --- |
| QSIPrep | Shared BIDS DWI dataset | `code/run_qsiprep.sh` | `derivatives/qsiprep/` | `code/check_qsiprep.sh` |
| QSIRecon NODDI | `derivatives/qsiprep/` | `code/run_qsirecon-noddi.sh` | `derivatives/qsirecon-noddi/` | `code/check_qsirecon-noddi.sh` |
| QSIRecon ACT-hsvs | `derivatives/qsiprep/` plus shared fMRIPrep/FreeSurfer derivatives | `code/run_qsirecon-ACThsvs.sh` | `derivatives/qsirecon-ACThsvs/` | `code/check_qsirecon-ACThsvs.sh` |
| QSIRecon DSI Studio AutoTrack | `derivatives/qsiprep/` | `code/run_qsirecon-dsiautotrack.sh` | `derivatives/qsirecon-dsiautotrack/` | `code/check_qsirecon-dsiautotrack.sh` |
| QSIRecon MRtrix/PyAFQ tractometry | `derivatives/qsiprep/` plus the DTI/b0/scalars recon spec | `code/run_qsirecon-tractometry.sh` | `derivatives/qsirecon-tractometry/` | `code/check_qsirecon-tractometry.sh` |

See `code/README.md` for a per-script implementation manual.

## Standard Paths

The scripts assume these Linux2 paths unless the shell overrides them:

| Item | Path |
| --- | --- |
| Project checkout | `/ZPOOL/data/projects/rf1-dwi` |
| Shared BIDS root | `/ZPOOL/data/projects/rf1-sra-linux2/bids` |
| fMRIPrep derivatives | `/ZPOOL/data/projects/rf1-sra-linux2/derivatives/fmriprep` |
| FreeSurfer subjects | `/ZPOOL/data/projects/rf1-sra-linux2/derivatives/freesurfer` |
| Tools and containers | `/ZPOOL/data/tools` |
| Scratch | `/ZPOOL/data/scratch/<user>` |
| TemplateFlow | `/ZPOOL/data/tools/templateflow` |
| PyAFQ `AFQ_data` cache | `/ZPOOL/data/tools/AFQ_data` |
| FreeSurfer license | `/ZPOOL/data/tools/licenses/fs_license.txt` |

The BIDS dataset, derivative folders, container scratch, and raw logs are not
tracked in Git.

## Subject Lists

Run production commands on Linux2 from the repository's `code/` directory:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=sublist.txt
JOBS=1
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

Use subject lists in this order:

| Level | Purpose | Normal location |
| --- | --- | --- |
| Full production/cohort list | Run or verify all intended DWI participants. | `code/sublist.txt` |
| New-batch/update list | Run a newly available subset before folding it into the full list. | Local operator list, commonly under `logs/batches/` |
| Small validation list | Validate a workflow change with a few representative subjects. | Local operator list, commonly under `logs/validation/` |

`code/sublist.txt` is the normal full-subject production list. It accepts one
subject per line, comments, blank lines, and either `10001` or `sub-10001`
forms. Do not replace it with a tiny validation list unless the operator
intentionally wants that list to become the current production list.

For a new-batch/update run, keep the subset separate and point the wrappers at
it explicitly:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/batches
printf '12345\n12346\n' > logs/batches/sublist-dwi-batch-YYYYMMDD.txt

cd code
SUBLIST=../logs/batches/sublist-dwi-batch-YYYYMMDD.txt
```

For a small validation run, keep a separate review-only list:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/validation
printf '10317\n10953\n' > logs/validation/sublist-dwi-validation.txt

cd code
SUBLIST=../logs/validation/sublist-dwi-validation.txt
JOBS=1
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

## One-Time Container Setup

Build the pinned containers before running the workflow:

```bash
cd /ZPOOL/data/tools
apptainer build qsiprep-26.0.0.sif docker://pennlinc/qsiprep:26.0.0
apptainer exec qsiprep-26.0.0.sif qsiprep --version

apptainer build qsirecon-26.0.0.sif docker://pennlinc/qsirecon:26.0.0
apptainer exec qsirecon-26.0.0.sif qsirecon --version
```

If this Linux2 shell uses `singularity` instead of `apptainer`, use the same
commands with `singularity`.

## Choosing `--jobs`

Use `JOBS=1` for the first production pass, after any failure, and for the
heavier QSIRecon reconstructions. The wrappers print their resource plan before
launching, including the per-job CPU and memory values when a stage divides a
fixed budget.

QSIPrep and QSIRecon NODDI default to `--jobs 2` in their wrappers, but
`JOBS=1` is the safer operator default when starting a new batch. ACT-hsvs, DSI
AutoTrack, and tractometry default to one job and should stay conservative
unless Linux2 is quiet and the operator intentionally raises concurrency.

## Everyday Use

Run each stage only after the previous stage's checker passes for the same
subject list.

### QSIPrep

```bash
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsiprep.sh --sublist "$SUBLIST"
```

Success looks like:

```text
CHECK PASSED: QSIPrep outputs complete
```

### QSIRecon NODDI

```bash
bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsirecon-noddi.sh --sublist "$SUBLIST"
```

Success looks like:

```text
CHECK PASSED: QSIRecon NODDI outputs complete
```

### QSIRecon ACT-hsvs

```bash
bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsirecon-ACThsvs.sh --sublist "$SUBLIST"
```

Success looks like:

```text
CHECK PASSED: QSIRecon ACT-hsvs outputs complete
```

The ACT-hsvs workflow uses shared fMRIPrep and FreeSurfer outputs from
`rf1-sra-linux2`. It defaults to the built-in `AAL116` atlas. To use more
atlases:

```bash
bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS" --atlases "AAL116 Gordon333Ext"
```

### QSIRecon DSI Studio AutoTrack

```bash
bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsirecon-dsiautotrack.sh --sublist "$SUBLIST"
```

Success looks like:

```text
CHECK PASSED: QSIRecon DSI Studio AutoTrack outputs complete
```

The checker requires bundle streamlines plus the `.fib.gz` file. Bundle summary
statistics are reported when present but are not required for validation.

### QSIRecon MRtrix/PyAFQ Tractometry

```bash
bash run_qsirecon-tractometry.sh \
  --sublist "$SUBLIST" \
  --jobs "$JOBS" \
  --dry-run \
  --recon-spec "$TRACT_SPEC"

bash run_qsirecon-tractometry.sh \
  --sublist "$SUBLIST" \
  --jobs "$JOBS" \
  --recon-spec "$TRACT_SPEC"

bash check_qsirecon-tractometry.sh --sublist "$SUBLIST"
```

Success looks like:

```text
CHECK PASSED: QSIRecon MRtrix/PyAFQ tractometry outputs complete
```

The validated tractometry spec uses `odf_model: DTI`, `reg_subject_spec: b0`,
`scalars: "['dti_fa', 'dti_md']"`, and `use_external_tracking: true`. The
built-in power-map/CSD tractometry route was not the validated path for this
dataset. See [tractometry debugging history](docs/tractometry_debugging_history.md)
for the provenance.

## Advanced: Logged Runs

The everyday commands above print directly to the terminal. To save a raw log
and a compact Git-tracked run record, wrap the same command in `run_logged.sh`:

```bash
bash run_logged.sh --label qsiprep-run -- \
  bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS"

bash run_logged.sh --label qsiprep-check -- \
  bash check_qsiprep.sh --sublist "$SUBLIST"
```

The combined `--check` form is available when a compact record is helpful:

```bash
bash run_logged.sh --label qsiprep -- \
  bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsiprep.sh --sublist "$SUBLIST"
```

If the main command fails, the check is skipped and the run record says
`Check exit: skipped`. If no checker is supplied, the record says
`Check exit: none`.

## How To Know Whether It Worked

Look for these signals:

- `Command exit: 0` means the main command finished successfully.
- `Check exit: 0` means the checker command passed.
- `Check exit: none` means no checker was provided.
- `Check exit: skipped` means the main command failed, so outputs were not
  validated.
- `CHECK PASSED` is the clearest phrase to search for.
- `CHECK FAILED` means expected outputs are incomplete; inspect
  `logs/records/`, then the matching raw log under `logs/runs/`.

Missing top-level QSIRecon HTML reports are not, by themselves, a failure. The
QSIRecon checkers validate reconstruction products rather than assuming an
fMRIPrep-style `sub-*.html` report at the output root.

## Historical And Legacy Material

Historical validation names are preserved in archive/developer notes for
provenance. New docs and new validation lists should use `validation` or
stage-specific names.

Legacy qsub wrappers and old local fMRIPrep helpers remain in `code/` for
provenance. They are documented in `code/README.md` but are not the default
production route.

## Troubleshooting

| Problem | Likely cause | What to do |
| --- | --- | --- |
| `Required file not found` | Wrong path or subject list | Check `SUBLIST` and make sure you are in `/ZPOOL/data/projects/rf1-dwi/code` |
| `Required file path is empty` | A shell variable such as `SUBLIST` was not set | Re-run the setup lines that define `SUBLIST`, `JOBS`, and `TRACT_SPEC` |
| `BIDS root not found` | Shared BIDS path is missing | Check `/ZPOOL/data/projects/rf1-sra-linux2/bids` and finish upstream fMRI/data-management first |
| `CHECK FAILED` | Expected outputs are incomplete | Inspect `logs/records/`, then the matching raw log in `logs/runs/` |
| Tractometry CSD response error | Wrong PyAFQ registration target for this dataset | Use and verify the DTI/b0/scalars spec |
| No QSIRecon HTML report | Not necessarily a failure | Rely on the output checker |

## Before Asking For Help

Please send:

1. The exact command.
2. The newest file in `logs/records/`.
3. Whether the record says `Command exit: 0`.
4. Whether the record says `Check exit: 0`.
5. The first `CHECK FAILED` or `ERROR` line, if present.

## Repository Checks

Repository-level checks do not require real imaging data or neuroimaging
containers:

```bash
make test
```

## More Details

- [Code manual](code/README.md)
- [Command cheatsheet](docs/command_cheatsheet.md)
- [Tractometry debugging history](docs/tractometry_debugging_history.md)
- [Developer notes](docs/developer_notes.md)
- [Validation history](docs/archive/validation-history.md)
