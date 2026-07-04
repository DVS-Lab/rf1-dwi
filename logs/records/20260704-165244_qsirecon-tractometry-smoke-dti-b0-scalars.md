# Run Record: qsirecon-tractometry-smoke-dti-b0-scalars

- Timestamp: 20260704-165244
- Branch: codex/linux2-qsiprep-test
- Commit: 6385e52
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-165244_qsirecon-tractometry-smoke-dti-b0-scalars.log`
- Command exit: 0
- Check exit: 0
- Summary: CHECK PASSED: QSIRecon MRtrix/PyAFQ tractometry outputs complete for 2 subject(s).

## Command

```bash
bash run_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt --jobs 1 --overwrite --recon-spec /base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-b0-scalars.yaml 
```

## Check

```bash
bash check_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt 
```
