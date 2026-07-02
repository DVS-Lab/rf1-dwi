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
- Tools: `/ZPOOL/data/tools`
- Scratch: `/ZPOOL/data/scratch/<user>`
- QSIPrep image: `/ZPOOL/data/tools/qsiprep-0.21.4.sif`
- FreeSurfer license: `/ZPOOL/data/tools/licenses/fs_license.txt`

For the first small test, use the two subjects from the fMRI CIFTI test that are
also present in this repository's DWI subject list:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/dwi-smoke-test
printf '10317\n10953\n' > logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
```

If `bids/sub-11982` exists and you want to include it, append it:

```bash
test -d bids/sub-11982 && printf '11982\n' >> logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
```

Dry-run:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
bash run_logged.sh --label qsiprep-smoke-dry-run -- \
  bash run_qsiprep.sh --sublist "$SUBLIST" --jobs 2 --dry-run
```

Run QSIPrep and then run the checker automatically:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
bash run_logged.sh --label qsiprep-smoke -- \
  bash run_qsiprep.sh --sublist "$SUBLIST" --jobs 2 \
  --check bash check_qsiprep.sh --sublist "$SUBLIST"
```

`--jobs` controls how many subject-level QSIPrep containers run at once. The
script divides the total resource budget across those jobs. By default, the
budget is 96 CPU threads and 196000 MB RAM, so `--jobs 2` gives each subject
`--nprocs 48`, `--omp-nthreads 8`, and `--mem 98000`.

Raw logs are written to ignored `logs/runs/`. Small Markdown run records are
written to tracked `logs/records/`.

## Notes

QSIPrep still requires a valid BIDS DWI dataset as input. Current QSIRecon
reconstruction workflows are distributed separately from QSIPrep and support
`--fs-subjects-dir` for already-run FreeSurfer outputs. The qsub-based
QSIRecon scripts in `code/` are legacy and should be modernized after the
QSIPrep smoke test passes.
