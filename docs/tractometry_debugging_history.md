# Tractometry Debugging History

The validated QSIRecon MRtrix/PyAFQ tractometry smoke test for this dataset is
the custom DTI/b0/scalars spec:

```text
code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml
```

It uses:

- `odf_model: DTI`
- `reg_subject_spec: b0`
- `scalars: "['dti_fa', 'dti_md']"`
- `use_external_tracking: true`

Validated records:

- `logs/records/20260704-165224_qsirecon-tractometry-check-one-dti-b0-scalars.md`
- `logs/records/20260704-165244_qsirecon-tractometry-smoke-dti-b0-scalars.md`

The two-subject smoke record reports `Command exit: 0`, `Check exit: 0`, and:

```text
CHECK PASSED: QSIRecon MRtrix/PyAFQ tractometry outputs complete for 2 subject(s).
```

## Why The Spec Uses b0

Container source diagnostics showed that PyAFQ maps registration target names
through its installed mapping table. For this QSIRecon 26.0.0/PyAFQ 2.0
container, the relevant mappings were:

- `power_map -> csd_pmap`
- `b0 -> b0`
- `dti_fa_subject -> dti_fa`
- `subject_sls -> b0`

The built-in power-map path asks PyAFQ for a CSD-derived registration image.
That route failed on this smoke dataset with a CSD response-function error. The
validated DTI/b0/scalars spec keeps DTI modeling but uses the non-CSD `b0`
registration target.

## Failed Or Experimental Variants

These records are useful provenance and should not be deleted:

| Variant | Result | Notes |
| --- | --- | --- |
| Built-in `mrtrix_multishell_msmt_pyafq_tractometry` | failed | PyAFQ CSD response-function failure in `run_afq` |
| CSD FA-threshold tweak | failed | Still hit the CSD response-function route |
| DTI with `reg_subject_spec: dti_fa` | failed | PyAFQ treated `dti_fa` like a path-like registration target |
| DTI/power-map with `scalars: "[]"` | failed | Installed PyAFQ indexes `scalars[0]`; empty scalar lists are invalid |
| DTI/power-map with `['dti_fa', 'dti_md']` | failed | `power_map` maps to CSD-derived `csd_pmap` |
| DTI/b0 with `['dti_fa', 'dti_md']` | passed | Validated by one-subject and two-subject checkers |

## Diagnostic Commands

Inspect QSIRecon/PyAFQ source inside the configured container:

```bash
cd /ZPOOL/data/projects/rf1-dwi/code
bash run_logged.sh --label qsirecon-pyafq-interface --include-full-log -- \
  bash debug_qsirecon_pyafq_interface.sh
```

Inspect tractometry inputs and outputs for a subject:

```bash
bash run_logged.sh --label qsirecon-tractometry-debug-sub-10317 --include-full-log -- \
  bash debug_qsirecon_tractometry_inputs.sh 10317
```

## Checker Rule

Do not weaken the tractometry checker to pass on MRtrix intermediates alone.
A valid tractometry pass requires PyAFQ outputs such as profiles, node-wise
tables, or bundle files. MRtrix FODs, SIFT2 weights, and `.tck` streamlines are
useful intermediates but are not sufficient to call tractometry complete.
