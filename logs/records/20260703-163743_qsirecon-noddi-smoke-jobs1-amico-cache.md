# Run Record: qsirecon-noddi-smoke-jobs1-amico-cache

- Timestamp: 20260703-163743
- Branch: codex/linux2-qsiprep-test
- Commit: cedc01e
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-163743_qsirecon-noddi-smoke-jobs1-amico-cache.log`
- Command exit: 1
- Check exit: skipped
- Summary: CHECK SKIPPED: command failed, so post-run check was not launched.

## Command

```bash
bash run_qsirecon-noddi.sh --sublist ../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt --jobs 1 
```

## Check

```bash
bash check_qsirecon-noddi.sh --sublist ../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt 
```

## Error Lines

```text
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort
           * BIDS dataset path: /base/derivatives/qsiprep.
           * BIDS dataset path: /base/derivatives/qsiprep.
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort
           * BIDS dataset path: /base/derivatives/qsiprep.
           * BIDS dataset path: /base/derivatives/qsiprep.
INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
-> Loading data:[0m
	* DWI signal
		- dim    = 80 x 98 x 85 x 145
		- pixdim = 2.000 x 2.000 x 2.000
	* Acquisition scheme
		- 145 samples, 5 shells
		- 3 @ b=0 , 6 @ b=250.0 , 61 @ b=5000.0 , 21 @ b=1000.0 , 24 @ b=2000.0 , 30 @ b=3250.0 
	* Binary mask
		- dim    = 80 x 98 x 85
		- pixdim = 2.000 x 2.000 x 2.000
		- voxels = 198530
[0;32m   [ 1.4 seconds ][0m
[0;32m
-> Preprocessing:[0m
	* Normalizing to b0... [ min=0.00,  mean=0.48, max=56.30 ]
	* Keeping all b0 volume(s)
[0;32m   [ 0.2 seconds ][0m
260703-16:40:58,859 nipype.interface INFO:
	 Fitting NODDI Model.
[0;32m
-> Creating LUT for "NODDI" model:[0m
[0;32m   [ 3.0 seconds ][0m
[0;32m
-> Resampling LUT for subject "subject":[0m
[0;32m   [ 3.2 seconds ][0m
[0;32m
-> Estimating principal directions (OLS):[0m
[0;32m   [ 00h 00m 00s ][0m
[0;32m
-> Fitting 'NODDI' model to 198530 voxels (using 8 threads):[0m
[0;32m   [ 00h 00m 14s ][0m
[0;32m
-> Saving output to "AMICO/NODDI/*":[0m
	- configuration  [OK]
	- fit_dir.nii.gz  [OK]
	- fit_RMSE.nii.gz  [OK]
	- fit_NRMSE.nii.gz  [OK]
	- fit_NDI.nii.gz  [OK]
	- fit_ODI.nii.gz  [OK]
	- fit_FWF.nii.gz  [OK]
	- fit_NDI_modulated.nii.gz  [OK]
	- fit_ODI_modulated.nii.gz  [OK]
[0;32m   [ DONE ][0m
260703-16:41:20,72 nipype.workflow INFO:
	 [Node] Finished "recon_noddi", elapsed time 23.00567s.
260703-16:41:20,590 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.convert_to_fibgz" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/convert_to_fibgz".
260703-16:41:20,593 nipype.workflow INFO:
	 [Node] Executing "convert_to_fibgz" <qsirecon.interfaces.converters.NODDItoFIBGZ>
260703-16:41:20,751 nipype.workflow INFO:
	 Detecting Peaks
260703-16:41:21,315 nipype.workflow INFO:
	 [Node] Finished "convert_to_fibgz", elapsed time 0.721055s.
260703-16:41:21,317 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.noddi_tissue_fraction" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/noddi_tissue_fraction".
260703-16:41:21,319 nipype.workflow INFO:
	 [Node] Executing "noddi_tissue_fraction" <qsirecon.interfaces.amico.NODDITissueFraction>
260703-16:41:21,548 nipype.workflow INFO:
	 [Node] Finished "noddi_tissue_fraction", elapsed time 0.228492s.
260703-16:41:22,722 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.plot_peaks" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/plot_peaks".
260703-16:41:22,725 nipype.workflow INFO:
	 [Node] Executing "plot_peaks" <qsirecon.interfaces.reports.CLIReconPeaksReport>
260703-16:41:29,934 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data0" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data0".
260703-16:41:29,936 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data0" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,939 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data0", elapsed time 0.000316s.
260703-16:41:29,942 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data1" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data1".
260703-16:41:29,943 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data1" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,944 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data1", elapsed time 0.000146s.
260703-16:41:29,945 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data2" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data2".
260703-16:41:29,946 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data2" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,947 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data2", elapsed time 0.000128s.
260703-16:41:29,948 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data3" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data3".
260703-16:41:29,950 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data3" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,950 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data3", elapsed time 0.000126s.
260703-16:41:29,951 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data4" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data4".
260703-16:41:29,953 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data4" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,953 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data4", elapsed time 0.000116s.
260703-16:41:29,955 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data5" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data5".
260703-16:41:29,956 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data5" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,956 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data5", elapsed time 0.000168s.
260703-16:41:29,958 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data6" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data6".
260703-16:41:29,959 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data6" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,960 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data6", elapsed time 0.000117s.
260703-16:41:29,961 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data7" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data7".
260703-16:41:29,963 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data7" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,963 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data7", elapsed time 0.000113s.
260703-16:41:29,964 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data8" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data8".
260703-16:41:29,966 nipype.workflow INFO:
	 [Node] Executing "_organize_scalar_data8" <qsirecon.interfaces.recon_scalars.OrganizeScalarData>
260703-16:41:29,966 nipype.workflow INFO:
	 [Node] Finished "_organize_scalar_data8", elapsed time 0.000113s.
260703-16:41:30,172 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data0" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data0".
260703-16:41:30,173 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data0" - collecting precomputed outputs
260703-16:41:30,174 nipype.workflow INFO:
	 [Node] "_organize_scalar_data0" found cached.
260703-16:41:30,174 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data1" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data1".
260703-16:41:30,175 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data1" - collecting precomputed outputs
260703-16:41:30,175 nipype.workflow INFO:
	 [Node] "_organize_scalar_data1" found cached.
260703-16:41:30,176 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data2" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data2".
260703-16:41:30,177 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data2" - collecting precomputed outputs
260703-16:41:30,177 nipype.workflow INFO:
	 [Node] "_organize_scalar_data2" found cached.
260703-16:41:30,177 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data3" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data3".
260703-16:41:30,178 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data3" - collecting precomputed outputs
260703-16:41:30,178 nipype.workflow INFO:
	 [Node] "_organize_scalar_data3" found cached.
260703-16:41:30,179 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data4" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data4".
260703-16:41:30,180 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data4" - collecting precomputed outputs
260703-16:41:30,180 nipype.workflow INFO:
	 [Node] "_organize_scalar_data4" found cached.
260703-16:41:30,180 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data5" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data5".
260703-16:41:30,181 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data5" - collecting precomputed outputs
260703-16:41:30,181 nipype.workflow INFO:
	 [Node] "_organize_scalar_data5" found cached.
260703-16:41:30,182 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data6" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data6".
260703-16:41:30,183 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data6" - collecting precomputed outputs
260703-16:41:30,183 nipype.workflow INFO:
	 [Node] "_organize_scalar_data6" found cached.
260703-16:41:30,183 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data7" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data7".
260703-16:41:30,184 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data7" - collecting precomputed outputs
260703-16:41:30,184 nipype.workflow INFO:
	 [Node] "_organize_scalar_data7" found cached.
260703-16:41:30,185 nipype.workflow INFO:
	 [Node] Setting-up "_organize_scalar_data8" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/organize_scalar_data/mapflow/_organize_scalar_data8".
260703-16:41:30,185 nipype.workflow INFO:
	 [Node] Cached "_organize_scalar_data8" - collecting precomputed outputs
260703-16:41:30,185 nipype.workflow INFO:
	 [Node] "_organize_scalar_data8" found cached.
260703-16:41:38,838 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.plot_scalars" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/plot_scalars".
260703-16:41:38,851 nipype.workflow INFO:
	 [Node] Executing "plot_scalars" <qsirecon.interfaces.reports.ScalarReport>
260703-16:41:42,309 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data5" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data5".
260703-16:41:42,311 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data5" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,313 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data4" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data4".
260703-16:41:42,314 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data5", elapsed time 0.000223s.
260703-16:41:42,315 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data3" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data3".
260703-16:41:42,315 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data4" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,317 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data3" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,317 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data8" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data8".
260703-16:41:42,318 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data4", elapsed time 0.000248s.
260703-16:41:42,318 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data8" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,319 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data8", elapsed time 9.1e-05s.
260703-16:41:42,319 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data3", elapsed time 0.000224s.
260703-16:41:42,323 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data6" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data6".
260703-16:41:42,325 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data6" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,328 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data6", elapsed time 0.000143s.
260703-16:41:42,351 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data7" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data7".
260703-16:41:42,351 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data2" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data2".
260703-16:41:42,353 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data7" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,354 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data2" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,356 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data7", elapsed time 0.000215s.
260703-16:41:42,358 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data2", elapsed time 0.000227s.
260703-16:41:42,361 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data0" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data0".
260703-16:41:42,363 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data0" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,366 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data1" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data1".
260703-16:41:42,366 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data0", elapsed time 0.000221s.
260703-16:41:42,367 nipype.workflow INFO:
	 [Node] Executing "_disorganize_scalar_data1" <qsirecon.interfaces.recon_scalars.DisorganizeScalarData>
260703-16:41:42,370 nipype.workflow INFO:
	 [Node] Finished "_disorganize_scalar_data1", elapsed time 0.000167s.
260703-16:41:42,645 nipype.workflow INFO:
	 [Node] Finished "plot_peaks", elapsed time 19.92025s.
260703-16:41:44,601 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data0" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data0".
260703-16:41:44,601 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data0" - collecting precomputed outputs
260703-16:41:44,602 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data0" found cached.
260703-16:41:44,602 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data1" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data1".
260703-16:41:44,603 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data1" - collecting precomputed outputs
260703-16:41:44,603 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data1" found cached.
260703-16:41:44,603 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data2" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data2".
260703-16:41:44,604 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data2" - collecting precomputed outputs
260703-16:41:44,604 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data2" found cached.
260703-16:41:44,604 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data3" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data3".
260703-16:41:44,605 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data3" - collecting precomputed outputs
260703-16:41:44,605 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data3" found cached.
260703-16:41:44,605 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data4" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data4".
260703-16:41:44,606 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data4" - collecting precomputed outputs
260703-16:41:44,606 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data4" found cached.
260703-16:41:44,606 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data5" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data5".
260703-16:41:44,607 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data5" - collecting precomputed outputs
260703-16:41:44,607 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data5" found cached.
260703-16:41:44,607 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data6" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data6".
260703-16:41:44,608 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data6" - collecting precomputed outputs
260703-16:41:44,608 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data6" found cached.
260703-16:41:44,608 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data7" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data7".
260703-16:41:44,609 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data7" - collecting precomputed outputs
260703-16:41:44,609 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data7" found cached.
260703-16:41:44,609 nipype.workflow INFO:
	 [Node] Setting-up "_disorganize_scalar_data8" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/scalar_output_wf/disorganize_scalar_data/mapflow/_disorganize_scalar_data8".
260703-16:41:44,610 nipype.workflow INFO:
	 [Node] Cached "_disorganize_scalar_data8" - collecting precomputed outputs
260703-16:41:44,610 nipype.workflow INFO:
	 [Node] "_disorganize_scalar_data8" found cached.
260703-16:42:05,906 nipype.workflow INFO:
	 [Node] Finished "plot_scalars", elapsed time 27.054439s.
260703-16:42:08,397 nipype.workflow IMPORTANT:
	 QSIRecon finished successfully!
IMPORTANT:nipype.workflow:QSIRecon finished successfully!
260703-16:42:08,401 nipype.workflow IMPORTANT:
	 Works derived from this QSIRecon execution should include the boilerplate text found in <OUTPUT_PATH>/logs/CITATION.md.
IMPORTANT:nipype.workflow:Works derived from this QSIRecon execution should include the boilerplate text found in <OUTPUT_PATH>/logs/CITATION.md.
INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort
MISSING /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-noddi/sub-10953.html
OUTPUTS sub-10953: 2 OD, 2 ICVF, 1 ISOVF NODDI map(s)

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
