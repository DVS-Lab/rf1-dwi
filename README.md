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
The NODDI output checker gates on scalar maps and treats the top-level HTML
report as optional because QSIRecon 26.0.0 may finish successfully without
writing `sub-*.html` at the output root.

The NODDI wrapper prepares AMICO's required rotation-matrix cache before
launching QSIRecon. The cache lives under ignored `.cache/dipy/` and is bound
into the container as `DIPY_HOME`, so subsequent NODDI reruns can reuse it.

## Additional QSIRecon Smoke Tests

The legacy qsub submission scripts remain in `code/`, but the maintained smoke
wrappers use the same `run_logged.sh` pattern as NODDI:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
SUBLIST=../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt
JOBS=1
```

For ACT-hsvs:

```bash
bash run_logged.sh --label qsirecon-ACThsvs-smoke-dry-run -- \
  bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run

bash run_logged.sh --label qsirecon-ACThsvs-smoke -- \
  bash run_qsirecon-ACThsvs.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsirecon-ACThsvs.sh --sublist "$SUBLIST"
```

The ACT-hsvs workflow includes MRtrix connectivity estimation, so it needs at
least one atlas. The wrapper defaults to the built-in `AAL116` atlas; override
with `--atlases "AAL116 Gordon333Ext"` or `QSIRECON_ACT_ATLASES` if needed.

For DSI Studio AutoTrack:

```bash
bash run_logged.sh --label qsirecon-dsiautotrack-smoke-dry-run -- \
  bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run

bash run_logged.sh --label qsirecon-dsiautotrack-smoke -- \
  bash run_qsirecon-dsiautotrack.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsirecon-dsiautotrack.sh --sublist "$SUBLIST"
```

The DSI Studio AutoTrack checker gates on bundle streamlines plus the `.fib.gz`
file. Bundle summary stats are reported when present, but are not required for
the smoke-test pass.

For MRtrix/PyAFQ tractometry:

```bash
bash run_logged.sh --label qsirecon-tractometry-smoke-dry-run -- \
  bash run_qsirecon-tractometry.sh --sublist "$SUBLIST" --jobs "$JOBS" --dry-run

bash run_logged.sh --label qsirecon-tractometry-smoke -- \
  bash run_qsirecon-tractometry.sh --sublist "$SUBLIST" --jobs "$JOBS" \
  --check bash check_qsirecon-tractometry.sh --sublist "$SUBLIST"
```

The tractometry wrapper defaults to QSIRecon's built-in
`mrtrix_multishell_msmt_pyafq_tractometry` spec. Experimental local variants
remain under `code/recon_specs/` for provenance, including the failed
CSD-threshold, DTI/`dti_fa`, DTI/power-map/empty-scalar, and
DTI/power-map/scalar-list tests. Do not use the empty-scalar variant as a
default: installed PyAFQ indexes the first scalar entry when `scalars` is
provided, so `scalars: "[]"` is invalid in this workflow. The
DTI/power-map/scalar-list variant also failed because `reg_subject_spec:
power_map` routes PyAFQ into CSD-derived registration-map generation. Set
`QSIRECON_TRACTOMETRY_RECON_SPEC` or pass `--recon-spec` only after confirming
the installed QSIRecon/PyAFQ interface expects that format.

Tractometry is not part of the currently validated smoke-test suite until PyAFQ
writes actual tractometry products such as profiles, node-wise tables, or
bundle outputs. MRtrix FODs, SIFT2 weights, and `.tck` streamlines alone are
intermediate outputs and are not sufficient for a tractometry pass.

If tractometry fails, collect compact diagnostic records before changing more
parameters:

```bash
bash run_logged.sh --label qsirecon-tractometry-debug-sub-10317 --include-full-log -- \
  bash debug_qsirecon_tractometry_inputs.sh 10317

bash run_logged.sh --label qsirecon-pyafq-interface --include-full-log -- \
  bash debug_qsirecon_pyafq_interface.sh
```

The QSIRecon 26.0.0/PyAFQ 2.0 interface diagnostic showed that PyAFQ accepts a
non-empty scalar list of internal scalar task names, including `dti_fa` and
`dti_md`, while `reg_subject_spec: dti_fa` is treated as a path-like
registration target. Before creating another tractometry YAML, inspect the
installed PyAFQ mapping source and choose a `reg_subject_spec` only from a
verified non-CSD key:

```bash
bash run_logged.sh --label qsirecon-pyafq-interface-mapping --include-full-log -- \
  bash debug_qsirecon_pyafq_interface.sh
```

If a non-CSD registration target is confirmed, create a one-off test spec that
keeps `odf_model: DTI`, keeps `scalars: "['dti_fa', 'dti_md']"`, keeps
`use_external_tracking: true`, and changes only `reg_subject_spec`. Test one
subject first, then run `check_qsirecon-tractometry.sh` before expanding to the
two-subject smoke list.

## Notes

QSIPrep still requires a valid BIDS DWI dataset as input. Current QSIRecon
reconstruction workflows are distributed separately from QSIPrep and support
extra derivative datasets plus `--fs-subjects-dir` for already-run anatomical
outputs. The shared QSIRecon wrapper binds the shared fMRIPrep derivatives as
`smriprep` and reuses the shared FreeSurfer derivatives directory from the
Linux2 fMRIPrep project. Those FreeSurfer subjects are session-qualified, such
as `sub-10317_ses-01`. For ACT-hsvs, the wrapper mounts the resolved host
FreeSurfer subject directory at a canonical `/freesurfer/sub-<label>` path so
QSIRecon can find it.
