# Code Manual

All production DWI entry points live in this directory. Routine batch
processing should not require editing scripts: set `SUBLIST`, set `JOBS`, run a
stage, then run the matching checker.

## Upstream Boundary

`rf1-dwi` runs after `rf1-sra-linux2`. It consumes the shared production BIDS,
fMRIPrep, and FreeSurfer outputs from:

```bash
BIDS_ROOT=/ZPOOL/data/projects/rf1-sra-linux2/bids
FMRIPREP_DERIVATIVES_DIR=/ZPOOL/data/projects/rf1-sra-linux2/derivatives/fmriprep
FREESURFER_SUBJECTS_DIR=/ZPOOL/data/projects/rf1-sra-linux2/derivatives/freesurfer
```

The DWI repo owns QSIPrep, QSIRecon, DWI checkers, DWI run records, and DWI
reconstruction specs. It should not duplicate or regenerate upstream fMRI/data
management outputs.

## Canonical Pipeline

| Order | Entry point | Worker/helper | Inputs | Outputs | Checker |
|------:|-------------|---------------|--------|---------|---------|
| 1 | `run_qsiprep.sh` | `qsiprep.sh` | Shared BIDS | `derivatives/qsiprep` | `check_qsiprep.sh` |
| 2 | `run_qsirecon-noddi.sh` | `qsirecon.sh` | QSIPrep derivatives | `derivatives/qsirecon-noddi` | `check_qsirecon-noddi.sh` |
| 3 | `run_qsirecon-ACThsvs.sh` | `qsirecon.sh` | QSIPrep plus fMRIPrep/FreeSurfer | `derivatives/qsirecon-ACThsvs` | `check_qsirecon-ACThsvs.sh` |
| 4 | `run_qsirecon-dsiautotrack.sh` | `qsirecon.sh` | QSIPrep derivatives | `derivatives/qsirecon-dsiautotrack` | `check_qsirecon-dsiautotrack.sh` |
| 5 | `run_qsirecon-tractometry.sh` | `qsirecon.sh` | QSIPrep plus tractometry recon spec | `derivatives/qsirecon-tractometry` | `check_qsirecon-tractometry.sh` |

## Batch Operation

For full production:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=sublist.txt
JOBS=1
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

For a small validation list:

```bash
cd /ZPOOL/data/projects/rf1-dwi
mkdir -p logs/validation
printf '10317\n10953\n' > logs/validation/sublist-dwi-validation.txt

cd code
SUBLIST=../logs/validation/sublist-dwi-validation.txt
JOBS=1
TRACT_SPEC=/base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

Run a stage, then its checker:

```bash
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run
bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS"
bash check_qsiprep.sh --sublist "$SUBLIST"
```

## Choosing `--jobs`

Use `--jobs 1` when starting a new production batch or isolating a failure.
QSIPrep and QSIRecon NODDI can divide a larger CPU/memory budget across two
jobs, but ACT-hsvs, DSI AutoTrack, and tractometry should stay conservative
unless Linux2 is quiet and the operator intentionally raises concurrency. Each
wrapper prints the resource plan before launching.

## Script Reference

### `sublist.txt`
- Status: Production input.
- Purpose: Full-subject DWI production list.
- Inputs: One subject per line, with comments and blank lines allowed.
- Outputs: None.
- Typical command: `SUBLIST=sublist.txt`.
- Checker: Parsed by wrappers and checkers.
- Notes: Use separate files under `logs/validation/` for small validation lists.

### `pipeline_common.sh`
- Status: Shared shell configuration.
- Purpose: Define Linux2 paths, containers, cache locations, project-root detection, subject parsing, and job helpers.
- Inputs: Checkout location plus optional environment overrides.
- Outputs: Shell functions and variables for DWI wrappers.
- Typical command: sourced by shell scripts.
- Checker: `bash code/check_shell_syntax.sh`.
- Notes: Production upstream defaults point at `/ZPOOL/data/projects/rf1-sra-linux2`.

### `print_subjects.py`
- Status: Shared helper.
- Purpose: Normalize subject-list parsing for shell scripts.
- Inputs: A subject-list file.
- Outputs: One normalized subject ID per line.
- Typical command: called by `pipeline_common.sh`.
- Checker: Wrapper dry-runs.
- Notes: Accepts both `10001` and `sub-10001`.

### `run_logged.sh`
- Status: Logging helper.
- Purpose: Run a command and optional checker with one raw log and one compact run record.
- Inputs: A command after `--`, and optionally a checker after `--check`.
- Outputs: Ignored `logs/runs/*.log` plus tracked `logs/records/*.md`.
- Typical command: `bash run_logged.sh --label qsiprep-check -- bash check_qsiprep.sh --sublist "$SUBLIST"`.
- Checker: The optional command supplied after `--check`.
- Notes: If no checker is supplied, the record says `Check exit: none`; if the main command fails, the check is skipped.

### `run_qsiprep.sh`
- Status: Production wrapper.
- Purpose: Launch QSIPrep for listed subjects.
- Inputs: Shared BIDS, QSIPrep container, and `qsiprep.sh`.
- Outputs: `derivatives/qsiprep`.
- Typical command: `bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `bash check_qsiprep.sh --sublist "$SUBLIST"`.
- Notes: Prints the resource plan before launching.

### `qsiprep.sh`
- Status: Production worker.
- Purpose: Run one subject through QSIPrep.
- Inputs: One subject, shared BIDS, QSIPrep container, TemplateFlow, and scratch.
- Outputs: Subject QSIPrep derivatives.
- Typical command: normally called by `run_qsiprep.sh`.
- Checker: `check_qsiprep.sh`.
- Notes: Writes under `derivatives/qsiprep`, not the root `derivatives/` folder.

### `check_qsiprep.sh`
- Status: Checker.
- Purpose: Validate expected QSIPrep outputs for a subject list.
- Inputs: Subject list and `derivatives/qsiprep`.
- Outputs: Terminal pass/fail summary.
- Typical command: `bash check_qsiprep.sh --sublist "$SUBLIST"`.
- Checker: Ends with `CHECK PASSED` or `CHECK FAILED`.
- Notes: Calls `check_qsiprep_outputs.py`.

### `check_qsiprep_outputs.py`
- Status: Checker implementation.
- Purpose: Inspect QSIPrep output files for expected operational completion.
- Inputs: Subject labels and QSIPrep derivative paths.
- Outputs: Detailed completion diagnostics.
- Typical command: called by `check_qsiprep.sh`.
- Checker: `check_qsiprep.sh`.
- Notes: Operational completion only; scientific QC remains manual.

### `run_qsirecon-noddi.sh`
- Status: Production wrapper.
- Purpose: Launch QSIRecon NODDI reconstruction for listed subjects.
- Inputs: QSIPrep derivatives and QSIRecon container.
- Outputs: `derivatives/qsirecon-noddi`.
- Typical command: `bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `bash check_qsirecon-noddi.sh --sublist "$SUBLIST"`.
- Notes: Uses AMICO/NODDI cache setup before container launch.

### `run_qsirecon-ACThsvs.sh`
- Status: Production wrapper.
- Purpose: Launch ACT-hsvs tractography/connectivity reconstruction.
- Inputs: QSIPrep derivatives plus shared fMRIPrep and FreeSurfer derivatives.
- Outputs: `derivatives/qsirecon-ACThsvs`.
- Typical command: `bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `bash check_qsirecon-ACThsvs.sh --sublist "$SUBLIST"`.
- Notes: Defaults to `AAL116`; `--atlases` can add more atlases.

### `run_qsirecon-dsiautotrack.sh`
- Status: Production wrapper.
- Purpose: Launch DSI Studio AutoTrack reconstruction.
- Inputs: QSIPrep derivatives and QSIRecon container.
- Outputs: `derivatives/qsirecon-dsiautotrack`.
- Typical command: `bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `bash check_qsirecon-dsiautotrack.sh --sublist "$SUBLIST"`.
- Notes: Bundle summaries are reported when present but not required by the checker.

### `run_qsirecon-tractometry.sh`
- Status: Production wrapper.
- Purpose: Launch MRtrix/PyAFQ tractometry reconstruction.
- Inputs: QSIPrep derivatives, QSIRecon container, PyAFQ cache, and recon spec.
- Outputs: `derivatives/qsirecon-tractometry`.
- Typical command: `bash run_qsirecon-tractometry.sh --sublist "$SUBLIST" --jobs "$JOBS" --recon-spec "$TRACT_SPEC"`.
- Checker: `bash check_qsirecon-tractometry.sh --sublist "$SUBLIST"`.
- Notes: Production uses the DTI/b0/scalars spec.

### `qsirecon.sh`
- Status: Production worker.
- Purpose: Run one subject through a selected QSIRecon workflow.
- Inputs: One subject, QSIPrep derivatives, QSIRecon container, optional fMRIPrep/FreeSurfer derivatives, and optional recon spec.
- Outputs: Workflow-specific QSIRecon derivatives.
- Typical command: normally called by `run_qsirecon-*.sh`.
- Checker: Matching `check_qsirecon-*.sh` script.
- Notes: Binds shared anatomical derivatives and PyAFQ cache when needed.

### `check_qsirecon-noddi.sh`
- Status: Checker.
- Purpose: Validate expected NODDI scalar outputs.
- Inputs: Subject list and `derivatives/qsirecon-noddi`.
- Outputs: Terminal pass/fail summary.
- Typical command: `bash check_qsirecon-noddi.sh --sublist "$SUBLIST"`.
- Checker: Ends with `CHECK PASSED` or `CHECK FAILED`.
- Notes: Calls `check_qsirecon_outputs.py`.

### `check_qsirecon-ACThsvs.sh`
- Status: Checker.
- Purpose: Validate expected ACT-hsvs outputs.
- Inputs: Subject list and `derivatives/qsirecon-ACThsvs`.
- Outputs: Terminal pass/fail summary.
- Typical command: `bash check_qsirecon-ACThsvs.sh --sublist "$SUBLIST"`.
- Checker: Ends with `CHECK PASSED` or `CHECK FAILED`.
- Notes: Missing top-level QSIRecon HTML reports are not treated as failure.

### `check_qsirecon-dsiautotrack.sh`
- Status: Checker.
- Purpose: Validate expected DSI Studio AutoTrack outputs.
- Inputs: Subject list and `derivatives/qsirecon-dsiautotrack`.
- Outputs: Terminal pass/fail summary.
- Typical command: `bash check_qsirecon-dsiautotrack.sh --sublist "$SUBLIST"`.
- Checker: Ends with `CHECK PASSED` or `CHECK FAILED`.
- Notes: Requires bundle streamlines plus `.fib.gz`.

### `check_qsirecon-tractometry.sh`
- Status: Checker.
- Purpose: Validate expected MRtrix/PyAFQ tractometry outputs.
- Inputs: Subject list and `derivatives/qsirecon-tractometry`.
- Outputs: Terminal pass/fail summary.
- Typical command: `bash check_qsirecon-tractometry.sh --sublist "$SUBLIST"`.
- Checker: Ends with `CHECK PASSED` or `CHECK FAILED`.
- Notes: Does not pass on MRtrix intermediates alone; PyAFQ outputs are required.

### `check_qsirecon_outputs.py`
- Status: Checker implementation.
- Purpose: Inspect QSIRecon workflow outputs for operational completion.
- Inputs: Subject labels, workflow name, and derivative paths.
- Outputs: Detailed completion diagnostics.
- Typical command: called by `check_qsirecon-*.sh`.
- Checker: Matching shell checker.
- Notes: Encodes workflow-specific output requirements.

### `debug_qsirecon_pyafq_interface.sh`
- Status: Diagnostic helper.
- Purpose: Inspect QSIRecon/PyAFQ source and mappings inside the configured container.
- Inputs: QSIRecon container.
- Outputs: Diagnostic terminal output and optional run record.
- Typical command: `bash run_logged.sh --label qsirecon-pyafq-interface --include-full-log -- bash debug_qsirecon_pyafq_interface.sh`.
- Checker: Manual developer review.
- Notes: Use for debugging PyAFQ behavior, not routine production.

### `debug_qsirecon_tractometry_inputs.sh`
- Status: Diagnostic helper.
- Purpose: Inspect tractometry inputs and outputs for one subject.
- Inputs: Subject ID and tractometry/QSIPrep derivatives.
- Outputs: Diagnostic terminal output and optional run record.
- Typical command: `bash debug_qsirecon_tractometry_inputs.sh 10317`.
- Checker: Manual developer review.
- Notes: Use after a tractometry failure.

### `extractNODDI.sh`
- Status: Legacy/helper.
- Purpose: Extract or summarize NODDI ROI outputs.
- Inputs: NODDI derivatives and mask resources expected by the script.
- Outputs: NODDI summary artifacts.
- Typical command: run only for the legacy NODDI summary workflow.
- Checker: Manual review of generated summary tables.
- Notes: Not part of the stage/check production path.

### `run_fmriprep.sh`
- Status: Legacy helper.
- Purpose: Historical local fMRIPrep launcher kept for provenance.
- Inputs: BIDS data and fMRIPrep configuration.
- Outputs: fMRIPrep derivatives when run.
- Typical command: do not use for normal DWI production.
- Checker: Upstream `rf1-sra-linux2` fMRIPrep checkers.
- Notes: Production fMRIPrep belongs in `rf1-sra-linux2`.

### `fmriprep_config.json`
- Status: Legacy/configuration.
- Purpose: Historical fMRIPrep BIDS filter configuration.
- Inputs: BIDS metadata.
- Outputs: fMRIPrep filter settings.
- Typical command: not run directly.
- Checker: Upstream fMRIPrep validation.
- Notes: Kept because older DWI scripts referenced local fMRIPrep.

### `fmriprep.qsub`
- Status: Legacy scheduler wrapper.
- Purpose: Historical qsub submission for fMRIPrep.
- Inputs: Scheduler environment and old fMRIPrep workflow.
- Outputs: Scheduler job output.
- Typical command: do not use for normal DWI production.
- Checker: Upstream fMRIPrep validation.
- Notes: Production fMRIPrep belongs in `rf1-sra-linux2`.

### `qsiprep.qsub`
- Status: Legacy scheduler wrapper.
- Purpose: Historical qsub submission for QSIPrep.
- Inputs: Scheduler environment and QSIPrep command settings.
- Outputs: Scheduler job output.
- Typical command: prefer `bash run_qsiprep.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `check_qsiprep.sh`.
- Notes: Kept for provenance.

### `qsirecon-noddi.qsub`
- Status: Legacy scheduler wrapper.
- Purpose: Historical qsub submission for NODDI reconstruction.
- Inputs: Scheduler environment and QSIRecon settings.
- Outputs: Scheduler job output.
- Typical command: prefer `bash run_qsirecon-noddi.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `check_qsirecon-noddi.sh`.
- Notes: Kept for provenance.

### `qsirecon-ACThsvs.qsub`
- Status: Legacy scheduler wrapper.
- Purpose: Historical qsub submission for ACT-hsvs reconstruction.
- Inputs: Scheduler environment and QSIRecon settings.
- Outputs: Scheduler job output.
- Typical command: prefer `bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `check_qsirecon-ACThsvs.sh`.
- Notes: Kept for provenance.

### `qsirecon-dsiautotrack.qsub`
- Status: Legacy scheduler wrapper.
- Purpose: Historical qsub submission for DSI Studio AutoTrack.
- Inputs: Scheduler environment and QSIRecon settings.
- Outputs: Scheduler job output.
- Typical command: prefer `bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS"`.
- Checker: `check_qsirecon-dsiautotrack.sh`.
- Notes: Kept for provenance.

### `qsirecon-tractometry.qsub`
- Status: Legacy scheduler wrapper.
- Purpose: Historical qsub submission for tractometry.
- Inputs: Scheduler environment and QSIRecon settings.
- Outputs: Scheduler job output.
- Typical command: prefer `bash run_qsirecon-tractometry.sh --sublist "$SUBLIST" --jobs "$JOBS" --recon-spec "$TRACT_SPEC"`.
- Checker: `check_qsirecon-tractometry.sh`.
- Notes: Kept for provenance.

### `recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml`
- Status: Production recon spec.
- Purpose: Validated MRtrix/PyAFQ tractometry spec for this dataset.
- Inputs: QSIPrep derivatives.
- Outputs: QSIRecon tractometry settings.
- Typical command: pass as `--recon-spec "$TRACT_SPEC"`.
- Checker: `check_qsirecon-tractometry.sh`.
- Notes: Uses DTI, b0 registration, FA/MD scalars, and external tracking.

### `recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti.yaml`
- Status: Experimental recon spec.
- Purpose: DTI-based tractometry variant kept for provenance.
- Inputs: QSIPrep derivatives.
- Outputs: QSIRecon tractometry settings.
- Typical command: not the production default.
- Checker: `check_qsirecon-tractometry.sh` when intentionally tested.
- Notes: See tractometry debugging history before using.

### `recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.yaml`
- Status: Experimental recon spec.
- Purpose: DTI/power-map tractometry variant kept for provenance.
- Inputs: QSIPrep derivatives.
- Outputs: QSIRecon tractometry settings.
- Typical command: not the production default.
- Checker: `check_qsirecon-tractometry.sh` when intentionally tested.
- Notes: Not the validated route for this dataset.

### `recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-powermap-scalars.yaml`
- Status: Experimental recon spec.
- Purpose: DTI/power-map tractometry variant with scalar settings.
- Inputs: QSIPrep derivatives.
- Outputs: QSIRecon tractometry settings.
- Typical command: not the production default.
- Checker: `check_qsirecon-tractometry.sh` when intentionally tested.
- Notes: Not the validated route for this dataset.

### `recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_csd-fa50.yaml`
- Status: Experimental recon spec.
- Purpose: CSD/FA threshold tractometry variant kept for provenance.
- Inputs: QSIPrep derivatives.
- Outputs: QSIRecon tractometry settings.
- Typical command: not the production default.
- Checker: `check_qsirecon-tractometry.sh` when intentionally tested.
- Notes: Hit the CSD response-function route during validation.

### `check_shell_syntax.sh`
- Status: Repository validation.
- Purpose: Run shell syntax checks and optional ShellCheck lint.
- Inputs: Tracked shell scripts and qsub files.
- Outputs: Terminal pass/fail status.
- Typical command: `bash code/check_shell_syntax.sh`.
- Checker: Included in `make test`.
- Notes: Does not require imaging data or containers.
