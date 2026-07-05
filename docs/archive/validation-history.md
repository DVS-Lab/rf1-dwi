# Validation History

This note preserves historical validation names without making them production
defaults.

The production upstream handoff from `rf1-sra-linux2` is:

```bash
BIDS_ROOT=/ZPOOL/data/projects/rf1-sra-linux2/bids
FMRIPREP_DERIVATIVES_DIR=/ZPOOL/data/projects/rf1-sra-linux2/derivatives/fmriprep
FREESURFER_SUBJECTS_DIR=/ZPOOL/data/projects/rf1-sra-linux2/derivatives/freesurfer
```

Older logs and records may mention:

```bash
/ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test
logs/dwi-smoke-test/
```

Those names came from workflow validation and debugging. They may remain in
historical run-record filenames for provenance, but new validation lists should
use `logs/validation/` or another review-only location.

The normal full-subject production list is:

```bash
/ZPOOL/data/projects/rf1-dwi/code/sublist.txt
```

Do not replace `code/sublist.txt` with a tiny validation list unless the
operator intentionally wants that list to become the current production list.
