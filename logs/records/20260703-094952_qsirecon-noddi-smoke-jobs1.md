# Run Record: qsirecon-noddi-smoke-jobs1

- Timestamp: 20260703-094952
- Branch: codex/linux2-qsiprep-test
- Commit: f39c413
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-094952_qsirecon-noddi-smoke-jobs1.log`
- Command exit: 1
- Check exit: skipped
- Summary: CHECK SKIPPED: command failed, so post-run check was not launched.

## Command

```bash
bash run_qsirecon-noddi.sh --sublist '' --jobs 1 
```

## Check

```bash
bash check_qsirecon-noddi.sh --sublist '' 
```

## Error Lines

```text
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
RUN START: 20260703-094952
PROJECT_ROOT: /ZPOOL/data/projects/rf1-dwi
GIT: codex/linux2-qsiprep-test f39c413
HOST: CLA19787.tu.temple.edu
USER: tug87422
PWD: /ZPOOL/data/projects/rf1-dwi/code
COMMAND: bash run_qsirecon-noddi.sh --sublist '' --jobs 1 

Required file path is empty. Check that any shell variables in the command are set.

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
