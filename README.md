# DWI Processing and Analyses

Analyses and processing for DWI using QSIprep.

## Linux2 QSIPrep Smoke Test

The maintained first-pass workflow is:

1. Edit or create a subject list.
2. Dry-run QSIPrep to confirm BIDS inputs and print the container commands.
3. Run QSIPrep.
4. Check QSIPrep outputs.

The scripts assume the standard Linux2 paths:

- Project checkout: current repository root
- Shared BIDS root: `/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/bids`
- Tools: `/ZPOOL/data/tools`
- Scratch: `/ZPOOL/data/scratch/<user>`
- QSIPrep image: `/ZPOOL/data/tools/qsiprep-26.0.0.sif`
- FreeSurfer license: `/ZPOOL/data/tools/licenses/fs_license.txt`

The BIDS DWI dataset is not tracked in Git and should not be duplicated in this
repository. The QSIPrep scripts bind the shared BIDS root as `/bids` inside the
container and write outputs to this repository's `derivatives/qsiprep/`
directory. Processing derivatives are ignored by Git; compact run records under
`logs/records/` are intentionally trackable.

Build the pinned QSIPrep container before running the workflow:

```bash
cd /ZPOOL/data/tools
apptainer build qsiprep-26.0.0.sif docker://pennlinc/qsiprep:26.0.0
apptainer exec qsiprep-26.0.0.sif qsiprep --version
```

If this Linux2 shell uses `singularity` instead of `apptainer`, the equivalent
commands are:

```bash
cd /ZPOOL/data/tools
singularity build qsiprep-26.0.0.sif docker://pennlinc/qsiprep:26.0.0
singularity exec qsiprep-26.0.0.sif qsiprep --version
```

Build the pinned QSIRecon container before running reconstruction workflows:

```bash
cd /ZPOOL/data/tools
apptainer build qsirecon-26.0.0.sif docker://pennlinc/qsirecon:26.0.0
apptainer exec qsirecon-26.0.0.sif qsirecon --version
```

Or with `singularity`:

```bash
cd /ZPOOL/data/tools
singularity build qsirecon-26.0.0.sif docker://pennlinc/qsirecon:26.0.0
singularity exec qsirecon-26.0.0.sif qsirecon --version
```

For the first small test, use the two subjects from the fMRI CIFTI test that are
also present in this repository's DWI subject list:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/dwi-smoke-test
printf '10317\n10953\n' > logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
```

If the shared BIDS root has `sub-11982` and you want to include it, append it:

```bash
test -d /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/bids/sub-11982 && \
  printf '11982\n' >> logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
```

Dry-run:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
JOBS="$(python3 print_subjects.py "$SUBLIST" | wc -l | tr -d ' ')"
bash run_logged.sh --label qsiprep-smoke-dry-run -- \
  bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
```

Run QSIPrep and then run the checker automatically:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
JOBS="$(python3 print_subjects.py "$SUBLIST" | wc -l | tr -d ' ')"
bash run_logged.sh --label qsiprep-smoke -- \
  bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsiprep.sh --sublist "$SUBLIST"
```

`--jobs` controls how many subject-level QSIPrep containers run at once. The
script divides the total resource budget across those jobs. By default, the
budget is 96 CPU threads and 196000 MB RAM, so `--jobs 2` gives each subject
`--nprocs 48`, `--omp-nthreads 8`, and `--mem 98000`.

Raw logs are written to ignored `logs/runs/`. Small Markdown run records are
written to tracked `logs/records/`.

## Linux2 QSIRecon NODDI Smoke Test

Run this after `check_qsiprep.sh` passes for the same subject list:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
JOBS="$(python3 print_subjects.py "$SUBLIST" | wc -l | tr -d ' ')"

bash run_logged.sh --label qsirecon-noddi-smoke-dry-run -- \
  bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
```

If the dry-run passes, launch NODDI and run the checker:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
JOBS="$(python3 print_subjects.py "$SUBLIST" | wc -l | tr -d ' ')"

bash run_logged.sh --label qsirecon-noddi-smoke -- \
  bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsirecon-noddi.sh --sublist "$SUBLIST"
```

The initial QSIRecon smoke test uses `--recon-spec amico_noddi` and writes to
`derivatives/qsirecon-noddi/`. Other recon specs should stay split into their
own wrappers because they have different dependencies and output checks.

## Notes

QSIPrep still requires a valid BIDS DWI dataset as input. Current QSIRecon
reconstruction workflows are distributed separately from QSIPrep and support
`--fs-subjects-dir` for already-run FreeSurfer outputs. The qsub-based
QSIRecon scripts in `code/` are legacy and should be modernized after the
QSIPrep smoke test passes.
