# DWI Processing and Analyses

This repository contains Linux2 scripts for RF1 DWI preprocessing and
reconstruction. The maintained workflow is:

- preprocess DWI data with QSIPrep;
- run selected QSIRecon reconstructions;
- check that expected derivatives were written;
- keep compact run records in Git while leaving large outputs out of Git.

Large derivatives are written under `derivatives/` and raw logs under
`logs/runs/`; both are ignored by Git. Small Markdown summaries under
`logs/records/` are intentionally trackable.

## Where To Run Commands

Run the processing commands on Linux2 from the repository's `code/` directory:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
```

In the examples below:

- `cd /path/to/folder` means "go to this folder".
- `SUBLIST=...` saves a subject-list path so you do not have to retype it.
- `JOBS=1` means run one subject/container at a time.
- `\` means the same command continues on the next line.
- `--` means `run_logged.sh` options stop there; the real command starts after it.
- `--check` means run this check command after the main command succeeds.

For a slower but easier-to-debug first pass, use `JOBS=1`.

## Standard Paths

The scripts assume these Linux2 paths unless you override the variables in the
shell:

| Item | Path |
| --- | --- |
| Project checkout | `/ZPOOL/data/projects/rf1-dwi` |
| Shared BIDS root | `/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/bids` |
| fMRIPrep derivatives | `/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep` |
| FreeSurfer subjects | `/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer` |
| Tools and containers | `/ZPOOL/data/tools` |
| Scratch | `/ZPOOL/data/scratch/<user>` |
| FreeSurfer license | `/ZPOOL/data/tools/licenses/fs_license.txt` |

The BIDS DWI dataset is not tracked in Git and should not be copied into this
repository.

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

## Shared Caches

The scripts use these shared or pipeline-managed cache directories:

- TemplateFlow: `/ZPOOL/data/tools/templateflow`
- DIPY/AMICO: `<repo>/.cache/dipy`
- PyAFQ `AFQ_data`: `/ZPOOL/data/tools/AFQ_data`

PyAFQ normally defaults to `~/AFQ_data`. This repository sets `AFQ_HOME` inside
the QSIRecon container so AFQ templates are shared across lab users instead of
being downloaded separately into each user's home directory.

## Subject Lists

The standard two-subject smoke-test list is:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/dwi-smoke-test
printf '10317\n10953\n' > logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
```

For one-subject tractometry debugging, keep a separate one-line list:

```bash
printf '10317\n' > logs/dwi-smoke-test/sublist-qsirecon-one.txt
```

Start each shell session with:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
JOBS=1
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

## Recommended Order

| Step | What to run | What success looks like |
| --- | --- | --- |
| 1 | QSIPrep dry run | `CHECK PASSED` dry-run message |
| 2 | QSIPrep | command exits 0 |
| 3 | QSIPrep check | `CHECK PASSED` |
| 4 | NODDI | command exits 0 |
| 5 | NODDI check | `CHECK PASSED` |
| 6 | ACT-hsvs | command exits 0 |
| 7 | ACT-hsvs check | `CHECK PASSED` |
| 8 | DSI AutoTrack | command exits 0 |
| 9 | DSI AutoTrack check | `CHECK PASSED` |
| 10 | Tractometry with the DTI/b0/scalars spec | command exits 0 |
| 11 | Tractometry check | `CHECK PASSED` |

## Everyday Use

### QSIPrep

Dry-run first:

```bash
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
```

Run QSIPrep:

```bash
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS"
```

Check QSIPrep outputs:

```bash
bash check_qsiprep.sh --sublist "$SUBLIST"
```

`--jobs` controls how many subject-level containers run at once. The scripts
divide the total resource budget across those jobs.

### QSIRecon NODDI

Run this only after `check_qsiprep.sh` passes for the same subject list.

```bash
bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsirecon-noddi.sh --sublist "$SUBLIST"
```

NODDI uses `amico_noddi` and writes to `derivatives/qsirecon-noddi/`. The
checker gates on NODDI scalar maps.

### QSIRecon ACT-hsvs

```bash
bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsirecon-ACThsvs.sh --sublist "$SUBLIST"
```

The ACT-hsvs workflow uses the shared FreeSurfer outputs from the fMRIPrep
project. It defaults to the built-in `AAL116` atlas. To use more atlases:

```bash
bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS" --atlases "AAL116 Gordon333Ext"
```

### QSIRecon DSI Studio AutoTrack

```bash
bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsirecon-dsiautotrack.sh --sublist "$SUBLIST"
```

The checker requires bundle streamlines plus the `.fib.gz` file. Bundle summary
statistics are reported when present but are not required for the smoke-test
pass.

### QSIRecon MRtrix/PyAFQ Tractometry

The validated tractometry smoke test uses the custom DTI/b0/scalars spec:

```bash
bash run_qsirecon-tractometry.sh \
  --sublist "$SUBLIST" \
  --jobs "$JOBS" \
  --recon-spec "$TRACT_SPEC"

bash check_qsirecon-tractometry.sh --sublist "$SUBLIST"
```

This spec uses `odf_model: DTI`, `reg_subject_spec: b0`,
`scalars: "['dti_fa', 'dti_md']"`, and `use_external_tracking: true`.
Tractometry should be called passing only after
`check_qsirecon-tractometry.sh` prints `CHECK PASSED`.

The built-in power-map/CSD tractometry route was not the validated path for
this dataset. See [tractometry_debugging_history.md](docs/tractometry_debugging_history.md)
for the debugging provenance.

## Advanced: Logged Runs

The everyday commands above print directly to the terminal. To save a raw log
and a compact Git-tracked run record, wrap the same command in `run_logged.sh`:

```bash
bash run_logged.sh --label qsirecon-noddi-smoke -- \
  bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS"

bash run_logged.sh --label qsirecon-noddi-check -- \
  bash check_qsirecon-noddi.sh --sublist "$SUBLIST"
```

The combined `--check` form is useful for compact smoke tests, but separate run
and check commands are easier for new users to read. More examples are in
[command_cheatsheet.md](docs/command_cheatsheet.md).

## How To Know Whether It Worked

Look for these signals:

- `Command exit: 0` means the main command finished successfully.
- `Check exit: 0` means the checker command passed.
- `CHECK PASSED` is the easiest phrase to search for.
- `Command exit: 0` without a checker is promising but not fully validated.
- Raw logs are in `logs/runs/`.
- Small run records are in `logs/records/`.

Missing top-level QSIRecon HTML reports are not, by themselves, a failure. The
QSIRecon checkers validate reconstruction products rather than assuming an
fMRIPrep-style `sub-*.html` report at the output root.

## Troubleshooting

| Problem | Likely cause | What to do |
| --- | --- | --- |
| `Required file not found` | Wrong path or subject list | Check `SUBLIST` and make sure you are in `/ZPOOL/data/projects/rf1-dwi/code` |
| `Required file path is empty` | A shell variable such as `SUBLIST` was not set | Re-run the setup lines that define `SUBLIST`, `JOBS`, and `TRACT_SPEC` |
| `BIDS root not found` | Linux2 shared BIDS path is missing | Check `/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/bids` |
| `CHECK FAILED` | Expected outputs are incomplete | Inspect `logs/records/`, then the matching raw log in `logs/runs/` |
| Tractometry CSD response error | Wrong PyAFQ registration target for this dataset | Use and verify the DTI/b0/scalars spec |
| No QSIRecon HTML report | Not necessarily a failure | Rely on the output checker |

## More Details

- [Command cheatsheet](docs/command_cheatsheet.md)
- [Tractometry debugging history](docs/tractometry_debugging_history.md)
- [Developer notes](docs/developer_notes.md)
