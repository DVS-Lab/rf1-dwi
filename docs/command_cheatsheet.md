# Command Cheatsheet

This page explains the shell patterns used by the Linux2 production and
validation commands.
It is meant for users who can follow commands but do not live in Bash every day.

## Basic Pieces

Go to a directory:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
```

Save a value for later:

```bash
SUBLIST=sublist.txt
JOBS=1
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

Use the saved value:

```bash
bash check_qsiprep.sh --sublist "$SUBLIST"
```

The quotes around `"$SUBLIST"` are deliberate. They keep the value together if
a path ever contains special shell characters.

For a small validation run, keep the list separate from production:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/validation
printf '10317\n10953\n' > logs/validation/sublist-dwi-validation.txt

cd code
SUBLIST=../logs/validation/sublist-dwi-validation.txt
```

## Line Continuation

A trailing backslash means the command continues on the next line:

```bash
bash run_qsirecon-tractometry.sh \
  --sublist "$SUBLIST" \
  --jobs "$JOBS" \
  --recon-spec "$TRACT_SPEC"
```

That is the same as typing one long line.

## Dry Runs

`--dry-run` checks inputs and prints the container command without launching the
full workflow:

```bash
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
```

Dry-runs should end with a `CHECK PASSED` dry-run message.

## Jobs

`--jobs 1` runs one subject/container at a time. Larger values run more
subjects at once and divide the configured CPU and memory budget across them.

When debugging, prefer:

```bash
JOBS=1
```

## Logged Runs

`run_logged.sh` wraps another command and writes:

- a raw log under `logs/runs/`;
- a compact run record under `logs/records/`.

The `--` marker means `run_logged.sh` options stop there and the real command
starts after it:

```bash
bash run_logged.sh --label qsiprep-check -- \
  bash check_qsiprep.sh --sublist "$SUBLIST"
```

The label becomes part of the log filename.

## Separate Run And Check

The clearest pattern is to run the processing command and checker separately:

```bash
bash run_logged.sh --label qsirecon-noddi-run -- \
  bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS"

bash run_logged.sh --label qsirecon-noddi-check -- \
  bash check_qsirecon-noddi.sh --sublist "$SUBLIST"
```

## Combined Run And Check

For compact records, `run_logged.sh` can run a checker after the
main command succeeds:

```bash
bash run_logged.sh --label qsirecon-noddi-run -- \
  bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsirecon-noddi.sh --sublist "$SUBLIST"
```

This `--check` belongs to `run_logged.sh`, not to QSIRecon. If the main command
fails, the check is skipped and the run record says so.

## Overwrite

Most scripts skip subjects that already have practical outputs. Add
`--overwrite` when you intentionally want to rerun a subject:

```bash
bash run_qsirecon-tractometry.sh \
  --sublist "$SUBLIST" \
  --jobs "$JOBS" \
  --overwrite \
  --recon-spec "$TRACT_SPEC"
```

## Useful Searches

Search compact run records for pass/fail status:

```bash
grep -R "CHECK PASSED\\|CHECK FAILED\\|Command exit" ../logs/records
```

List the newest run records:

```bash
ls -lrt ../logs/records | tail
```
