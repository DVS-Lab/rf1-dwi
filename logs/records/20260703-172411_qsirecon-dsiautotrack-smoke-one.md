# Run Record: qsirecon-dsiautotrack-smoke-one

- Timestamp: 20260703-172411
- Branch: codex/linux2-qsiprep-test
- Commit: b962234
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-172411_qsirecon-dsiautotrack-smoke-one.log`
- Command exit: 1
- Check exit: skipped
- Summary: CHECK SKIPPED: command failed, so post-run check was not launched.

## Command

```bash
bash run_qsirecon-dsiautotrack.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 
```

## Check

```bash
bash check_qsirecon-dsiautotrack.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt 
```

## Error Lines

```text
	 [Node] Executing "_ds_tckfiles38" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles39" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles40" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles41" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles42" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles43" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles44" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles45" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles46" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles47" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles48" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles49" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles50" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles51" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles52" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles53" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles54" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles55" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles56" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles57" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles58" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles59" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles60" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles61" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles62" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles63" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles64" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles65" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles66" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles67" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles68" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles69" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles70" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles71" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles72" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles73" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles74" <qsirecon.interfaces.bids.DerivativesDataSink>
	 [Node] Executing "_ds_tckfiles75" <qsirecon.interfaces.bids.DerivativesDataSink>
WARNING optional QSIRecon report not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-dsiautotrack/sub-10317.html
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
260703-18:00:29,149 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles28" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,152 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles28", elapsed time 0.003369s.
260703-18:00:29,154 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles29" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles29".
260703-18:00:29,157 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles29" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,162 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles29", elapsed time 0.004427s.
260703-18:00:29,164 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles30" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles30".
260703-18:00:29,166 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles30" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,170 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles30", elapsed time 0.003115s.
260703-18:00:29,172 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles31" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles31".
260703-18:00:29,184 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles31" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,191 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles31", elapsed time 0.006012s.
260703-18:00:29,193 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles32" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles32".
260703-18:00:29,195 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles32" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,289 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles32", elapsed time 0.093246s.
260703-18:00:29,291 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles33" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles33".
260703-18:00:29,294 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles33" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,317 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles33", elapsed time 0.022579s.
260703-18:00:29,319 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles34" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles34".
260703-18:00:29,321 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles34" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,841 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles34", elapsed time 0.518638s.
260703-18:00:29,843 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles35" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles35".
260703-18:00:29,845 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles35" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,873 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles35", elapsed time 0.027273s.
260703-18:00:29,875 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles36" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles36".
260703-18:00:29,878 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles36" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:29,959 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles36", elapsed time 0.080972s.
260703-18:00:29,961 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles37" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles37".
260703-18:00:29,964 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles37" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:30,394 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles37", elapsed time 0.429681s.
260703-18:00:30,396 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles38" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles38".
260703-18:00:30,399 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles38" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:30,571 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles38", elapsed time 0.171143s.
260703-18:00:30,573 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles39" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles39".
260703-18:00:30,575 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles39" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:30,872 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles39", elapsed time 0.296165s.
260703-18:00:30,874 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles40" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles40".
260703-18:00:30,877 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles40" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:31,411 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles40", elapsed time 0.53409s.
260703-18:00:31,414 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles41" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles41".
260703-18:00:31,416 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles41" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:31,435 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles41", elapsed time 0.018184s.
260703-18:00:31,437 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles42" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles42".
260703-18:00:31,440 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles42" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:31,810 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles42", elapsed time 0.369828s.
260703-18:00:31,812 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles43" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles43".
260703-18:00:31,815 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles43" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:31,848 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles43", elapsed time 0.033074s.
260703-18:00:31,850 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles44" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles44".
260703-18:00:31,853 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles44" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:32,182 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles44", elapsed time 0.328618s.
260703-18:00:32,184 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles45" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles45".
260703-18:00:32,187 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles45" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:32,748 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles45", elapsed time 0.560659s.
260703-18:00:32,751 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles46" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles46".
260703-18:00:32,754 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles46" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:33,58 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles46", elapsed time 0.303689s.
260703-18:00:33,61 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles47" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles47".
260703-18:00:33,63 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles47" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:33,347 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles47", elapsed time 0.283407s.
260703-18:00:33,350 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles48" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles48".
260703-18:00:33,353 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles48" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:33,392 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles48", elapsed time 0.038353s.
260703-18:00:33,394 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles49" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles49".
260703-18:00:33,397 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles49" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,72 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles49", elapsed time 0.673848s.
260703-18:00:34,74 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles50" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles50".
260703-18:00:34,77 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles50" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,106 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles50", elapsed time 0.02856s.
260703-18:00:34,108 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles51" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles51".
260703-18:00:34,110 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles51" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,116 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles51", elapsed time 0.004838s.
260703-18:00:34,118 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles52" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles52".
260703-18:00:34,120 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles52" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,449 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles52", elapsed time 0.32818s.
260703-18:00:34,451 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles53" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles53".
260703-18:00:34,454 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles53" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,458 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles53", elapsed time 0.003338s.
260703-18:00:34,460 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles54" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles54".
260703-18:00:34,462 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles54" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,475 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles54", elapsed time 0.012181s.
260703-18:00:34,477 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles55" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles55".
260703-18:00:34,480 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles55" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,489 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles55", elapsed time 0.009033s.
260703-18:00:34,491 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles56" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles56".
260703-18:00:34,494 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles56" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:34,530 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles56", elapsed time 0.035895s.
260703-18:00:34,532 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles57" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles57".
260703-18:00:34,551 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles57" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:35,74 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles57", elapsed time 0.522411s.
260703-18:00:35,76 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles58" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles58".
260703-18:00:35,79 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles58" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,234 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles58", elapsed time 2.154589s.
260703-18:00:37,237 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles59" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles59".
260703-18:00:37,240 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles59" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,387 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles59", elapsed time 0.145697s.
260703-18:00:37,389 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles60" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles60".
260703-18:00:37,392 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles60" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,441 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles60", elapsed time 0.048939s.
260703-18:00:37,443 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles61" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles61".
260703-18:00:37,446 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles61" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,660 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles61", elapsed time 0.21377s.
260703-18:00:37,663 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles62" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles62".
260703-18:00:37,666 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles62" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,759 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles62", elapsed time 0.092176s.
260703-18:00:37,761 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles63" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles63".
260703-18:00:37,764 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles63" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,836 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles63", elapsed time 0.071417s.
260703-18:00:37,839 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles64" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles64".
260703-18:00:37,842 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles64" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:37,936 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles64", elapsed time 0.092909s.
260703-18:00:37,938 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles65" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles65".
260703-18:00:37,941 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles65" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,28 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles65", elapsed time 0.085619s.
260703-18:00:38,30 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles66" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles66".
260703-18:00:38,78 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles66" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,202 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles66", elapsed time 0.123151s.
260703-18:00:38,204 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles67" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles67".
260703-18:00:38,207 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles67" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,216 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles67", elapsed time 0.007925s.
260703-18:00:38,218 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles68" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles68".
260703-18:00:38,221 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles68" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,246 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles68", elapsed time 0.024675s.
260703-18:00:38,249 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles69" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles69".
260703-18:00:38,252 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles69" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,270 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles69", elapsed time 0.01792s.
260703-18:00:38,273 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles70" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles70".
260703-18:00:38,302 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles70" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,306 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles70", elapsed time 0.003546s.
260703-18:00:38,308 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles71" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles71".
260703-18:00:38,311 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles71" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,328 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles71", elapsed time 0.016595s.
260703-18:00:38,330 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles72" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles72".
260703-18:00:38,359 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles72" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,368 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles72", elapsed time 0.008558s.
260703-18:00:38,370 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles73" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles73".
260703-18:00:38,373 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles73" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,404 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles73", elapsed time 0.031089s.
260703-18:00:38,406 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles74" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles74".
260703-18:00:38,409 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles74" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,427 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles74", elapsed time 0.017132s.
260703-18:00:38,429 nipype.workflow INFO:
	 [Node] Setting-up "_ds_tckfiles75" in "/scratch/qsirecon_26_0_wf/sub-10317_dsistudio_pipeline/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/autotrackgqi/ds_tckfiles/mapflow/_ds_tckfiles75".
260703-18:00:38,431 nipype.workflow INFO:
	 [Node] Executing "_ds_tckfiles75" <qsirecon.interfaces.bids.DerivativesDataSink>
260703-18:00:38,445 nipype.workflow INFO:
	 [Node] Finished "_ds_tckfiles75", elapsed time 0.013077s.
260703-18:00:41,487 nipype.workflow IMPORTANT:
	 QSIRecon finished successfully!
IMPORTANT:nipype.workflow:QSIRecon finished successfully!
260703-18:00:41,491 nipype.workflow IMPORTANT:
	 Works derived from this QSIRecon execution should include the boilerplate text found in <OUTPUT_PATH>/logs/CITATION.md.
IMPORTANT:nipype.workflow:Works derived from this QSIRecon execution should include the boilerplate text found in <OUTPUT_PATH>/logs/CITATION.md.
WARNING optional QSIRecon report not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-dsiautotrack/sub-10317.html
MISSING /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-dsiautotrack/**/sub-10317/**/*bundles-DSIStudio*_scalarstats.tsv
MISSING /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-dsiautotrack/**/sub-10317/**/*bundles-DSIStudio*_tdistats.tsv
OUTPUTS sub-10317: 76 bundle streamlines, 0 bundle scalar stats, 0 bundle density stats, 1 DSI Studio fib DSI Studio AutoTrack output(s)

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
