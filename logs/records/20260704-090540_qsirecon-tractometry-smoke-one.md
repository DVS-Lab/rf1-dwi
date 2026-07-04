# Run Record: qsirecon-tractometry-smoke-one

- Timestamp: 20260704-090540
- Branch: codex/linux2-qsiprep-test
- Commit: ac2ff2e
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-090540_qsirecon-tractometry-smoke-one.log`
- Command exit: 1
- Check exit: skipped
- Summary: CHECK SKIPPED: command failed, so post-run check was not launched.

## Command

```bash
bash run_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 
```

## Check

```bash
bash check_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt 
```

## Error Lines

```text
	    if not found: res = node(self)
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	session_error   : 0
	 QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	    raise CsdNanResponseError
	AFQ.models.csd.CsdNanResponseError
	The above exception was the direct cause of the following exception:
	Traceback (most recent call last):
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	session_error   : 0
CRITICAL:nipype.workflow:QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	    raise CsdNanResponseError
	AFQ.models.csd.CsdNanResponseError
	The above exception was the direct cause of the following exception:
	Traceback (most recent call last):
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	session_error   : 0
INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
OUTPUTS sub-10317: 1 preprocessed DWI NIfTI(s)
Using FreeSurfer subjects directory: /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer
QSIRecon command: singularity run --cleanenv --writable-tmpfs -B /ZPOOL/data/tools/templateflow:/opt/templateflow -B /ZPOOL/data/tools/mplconfigdir:/opt/mplconfigdir -B /ZPOOL/data/projects/rf1-dwi/.cache/dipy:/opt/dipy -B /ZPOOL/data/projects/rf1-dwi:/base -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep:/smriprep:ro -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer:/freesurfer:ro -B /ZPOOL/data/tools/licenses:/opts -B /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10317:/scratch /ZPOOL/data/tools/qsirecon-26.0.0.sif /base/derivatives/qsiprep /base/derivatives/qsirecon-tractometry participant --participant-label 10317 --recon-spec mrtrix_multishell_msmt_pyafq_tractometry --input-type qsiprep --datasets smriprep=/smriprep --fs-subjects-dir /freesurfer --fs-license-file /opts/fs_license.txt --nprocs 96 --omp-nthreads 8 --mem 196000 --stop-on-first-crash -w /scratch
260704-09:06:03,912 nipype.workflow IMPORTANT:
	 Running QSIRecon version 26.0.0

         License NOTICE ##################################################
         QSIRecon 26.0.0
         Copyright The PennLINC Developers.
         
         This product includes software developed by
         the NiPreps Community (https://nipreps.org/).
         
         Portions of this software were developed at the Department of
         Psychology at Stanford University, Stanford, CA, US.
         
         This software is also distributed as a Docker container image.
         The bootstrapping file for the image ("Dockerfile") is licensed
         under the MIT License.
         
         This software may be distributed through an add-on package called
         "Docker Wrapper" that is under the BSD 3-clause License.
         #################################################################
IMPORTANT:nipype.workflow:Running QSIRecon version 26.0.0

         License NOTICE ##################################################
         QSIRecon 26.0.0
         Copyright The PennLINC Developers.
         
         This product includes software developed by
         the NiPreps Community (https://nipreps.org/).
         
         Portions of this software were developed at the Department of
         Psychology at Stanford University, Stanford, CA, US.
         
         This software is also distributed as a Docker container image.
         The bootstrapping file for the image ("Dockerfile") is licensed
         under the MIT License.
         
         This software may be distributed through an add-on package called
         "Docker Wrapper" that is under the BSD 3-clause License.
         #################################################################
260704-09:06:03,935 nipype.workflow IMPORTANT:
	 Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260704-090545_98e65209-5138-45bc-b88e-1883278c9ae0.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
IMPORTANT:nipype.workflow:Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260704-090545_98e65209-5138-45bc-b88e-1883278c9ae0.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
260704-09:06:04,393 nipype.utils INFO:
	 Collected anatomical data:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

INFO:nipype.utils:Collected anatomical data:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

260704-09:06:04,394 nipype.workflow INFO:
	 Anatomical data available for /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

INFO:nipype.workflow:Anatomical data available for /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

260704-09:06:04,395 nipype.workflow INFO:
	 Found high-res anatomical data in preprocessed inputs for 10317.
INFO:nipype.workflow:Found high-res anatomical data in preprocessed inputs for 10317.
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
260704-09:06:04,396 nipype.workflow INFO:
	 orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
260704-09:06:04,396 nipype.workflow INFO:
	 template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
260704-09:06:04,396 nipype.workflow INFO:
	 acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
260704-09:06:04,396 nipype.workflow INFO:
	 Found 1 high-res anatomicals to process
INFO:nipype.workflow:Found 1 high-res anatomicals to process
260704-09:06:04,402 nipype.workflow INFO:
	 Transforming ODF ROIs into DWI space for visual report.
INFO:nipype.workflow:Transforming ODF ROIs into DWI space for visual report.
260704-09:06:04,435 nipype.interface INFO:
	 Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
INFO:nipype.interface:Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
260704-09:06:04,435 nipype.interface INFO:
	 Using 8 threads in MRtrix3
INFO:nipype.interface:Using 8 threads in MRtrix3
260704-09:06:07,173 nipype.workflow INFO:
	 QSIRecon workflow graph with 57 nodes built successfully.
INFO:nipype.workflow:QSIRecon workflow graph with 57 nodes built successfully.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
INFO:cli:Generating an HTML version of the citation boilerplate...
INFO:cli:Generating a LaTeX version of the citation boilerplate...
260704-09:06:16,474 nipype.workflow IMPORTANT:
	 QSIRecon started!
IMPORTANT:nipype.workflow:QSIRecon started!
260704-09:06:20,145 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data".
260704-09:06:20,146 nipype.workflow INFO:
	 [Node] Executing "sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data" <qsirecon.interfaces.ingress.QSIPrepDWIIngress>
260704-09:06:20,151 nipype.workflow INFO:
	 [Node] Finished "sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data", elapsed time 0.002094s.
260704-09:06:20,393 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.get_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/get_template".
260704-09:06:20,395 nipype.workflow INFO:
	 [Node] Executing "get_template" <qsirecon.interfaces.anatomical.GetTemplate>
260704-09:06:20,417 nipype.workflow INFO:
	 [Node] Finished "get_template", elapsed time 0.019461s.
260704-09:06:20,709 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.resample_mask" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/resample_mask".
260704-09:06:20,712 nipype.workflow INFO:
	 [Node] Executing "resample_mask" <nipype.interfaces.ants.resampling.ApplyTransforms>
260704-09:06:20,713 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.odf_rois" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/odf_rois".
260704-09:06:20,716 nipype.workflow INFO:
	 [Node] Executing "odf_rois" <nipype.interfaces.ants.resampling.ApplyTransforms>
260704-09:06:21,671 nipype.workflow INFO:
	 [Node] Finished "resample_mask", elapsed time 0.511982s.
260704-09:06:21,674 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.voxel_size_chooser" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/voxel_size_chooser".
260704-09:06:21,676 nipype.workflow INFO:
	 [Node] Executing "voxel_size_chooser" <qsirecon.interfaces.anatomical.VoxelSizeChooser>
260704-09:06:21,697 nipype.workflow INFO:
	 [Node] Finished "voxel_size_chooser", elapsed time 0.020269s.
260704-09:06:21,720 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.mask_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/mask_template".
260704-09:06:21,722 nipype.workflow INFO:
	 [Node] Executing "mask_template" <nipype.interfaces.afni.utils.Calc>
260704-09:06:22,269 nipype.workflow INFO:
	 [Node] Finished "mask_template", elapsed time 0.545992s.
260704-09:06:23,32 nipype.interface WARNING:
	 Changing /base/derivatives/qsirecon-tractometry/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
WARNING:nipype.interface:Changing /base/derivatives/qsirecon-tractometry/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
260704-09:06:23,238 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.reorient_to_lps" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/reorient_to_lps".
260704-09:06:23,240 nipype.workflow INFO:
	 [Node] Executing "reorient_to_lps" <nipype.interfaces.afni.utils.Resample>
260704-09:06:23,523 nipype.workflow INFO:
	 [Node] Finished "reorient_to_lps", elapsed time 0.282286s.
260704-09:06:24,715 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.autobox_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/autobox_template".
260704-09:06:24,717 nipype.workflow INFO:
	 [Node] Executing "autobox_template" <nipype.interfaces.afni.utils.Autobox>
260704-09:06:25,106 nipype.workflow INFO:
	 [Node] Finished "autobox_template", elapsed time 0.386125s.
260704-09:06:25,216 nipype.workflow INFO:
	 [Node] Finished "odf_rois", elapsed time 4.043972s.
260704-09:06:26,716 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.deoblique_autobox" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/deoblique_autobox".
260704-09:06:26,718 nipype.workflow INFO:
	 [Node] Executing "deoblique_autobox" <nipype.interfaces.afni.preprocess.Warp>
260704-09:06:27,107 nipype.workflow INFO:
	 [Node] Finished "deoblique_autobox", elapsed time 0.385349s.
260704-09:06:28,715 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.resample_to_voxel_size" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/resample_to_voxel_size".
260704-09:06:28,718 nipype.workflow INFO:
	 [Node] Executing "resample_to_voxel_size" <nipype.interfaces.afni.utils.Resample>
260704-09:06:28,825 nipype.workflow INFO:
	 [Node] Finished "resample_to_voxel_size", elapsed time 0.106747s.
260704-09:06:31,808 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs".
260704-09:06:31,829 nipype.workflow INFO:
	 [Node] Executing "sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs" <qsirecon.interfaces.interchange.ReconWorkflowInputs>
260704-09:06:31,830 nipype.workflow INFO:
	 [Node] Finished "sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs", elapsed time 0.00026s.
260704-09:06:32,702 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.create_mif" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/create_mif".
260704-09:06:32,720 nipype.workflow INFO:
	 [Node] Executing "create_mif" <qsirecon.interfaces.mrtrix.MRTrixIngress>
260704-09:06:34,447 nipype.interface INFO:
	 stderr 2026-07-04T09:06:34.447167:[?7lmrconvert: [  0%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  1%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  2%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  3%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  4%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  5%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  6%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  7%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  8%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  9%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 10%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 11%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 12%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 13%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 14%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 15%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 16%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 17%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 18%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 19%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 20%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 21%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 22%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 23%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 24%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 25%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 26%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 27%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 28%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 29%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 30%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 31%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 32%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 33%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 34%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 35%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 36%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 37%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 38%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 39%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 40%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 41%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 42%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 43%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 44%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 45%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 46%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 47%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 48%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 49%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 50%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 51%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 52%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 53%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 54%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 55%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 56%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 57%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 58%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 59%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 60%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 61%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 62%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 63%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 64%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 65%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 66%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 67%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 68%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 69%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 70%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 71%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 72%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 73%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 74%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 75%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 76%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 77%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 78%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 79%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 80%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 81%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 82%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 83%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 84%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 85%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 86%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 87%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 88%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 89%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 90%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 91%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 92%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 93%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 94%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 95%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 96%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 97%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 98%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 99%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [100%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7hmrconvert: [100%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"[0K
260704-09:06:35,694 nipype.interface INFO:
	 stderr 2026-07-04T09:06:35.694648:[?7lmrconvert: [  0%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  1%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  2%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  3%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  4%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  5%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  6%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  7%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  8%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  9%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 10%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 11%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 12%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 13%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 14%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 15%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 16%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 17%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 18%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 19%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 20%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 21%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 22%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 23%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 24%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 25%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 26%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 27%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 28%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 29%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 30%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 31%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 32%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 33%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 34%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 35%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 36%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 37%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 38%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 39%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 40%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 41%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 42%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 43%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 44%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 45%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 46%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 47%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 48%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 49%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 50%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 51%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 52%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 53%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 54%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 55%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 56%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 57%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 58%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 59%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 60%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 61%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 62%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 63%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 64%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 65%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 66%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 67%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 68%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 69%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 70%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 71%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 72%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 73%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 74%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 75%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 76%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 77%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 78%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 79%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 80%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 81%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 82%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 83%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 84%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 85%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 86%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 87%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 88%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 89%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 90%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 91%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 92%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 93%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 94%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 95%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 96%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 97%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 98%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 99%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [100%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7hmrconvert: [100%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"[0K
260704-09:06:35,777 nipype.workflow INFO:
	 [Node] Finished "create_mif", elapsed time 3.056507s.
260704-09:06:37,757 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.estimate_response" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/estimate_response".
260704-09:06:37,776 nipype.workflow INFO:
	 [Node] Executing "estimate_response" <qsirecon.interfaces.mrtrix.SS3TDwi2Response>
260704-09:06:44,490 nipype.workflow INFO:
	 [Node] Finished "estimate_response", elapsed time 6.588192s.
260704-09:06:44,713 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.estimate_fod" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/estimate_fod".
260704-09:06:44,732 nipype.workflow INFO:
	 [Node] Executing "estimate_fod" <qsirecon.interfaces.mrtrix.EstimateFOD>
260704-09:11:41,242 nipype.workflow INFO:
	 [Node] Finished "estimate_fod", elapsed time 296.450199s.
260704-09:11:42,984 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.intensity_norm" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/intensity_norm".
260704-09:11:42,987 nipype.workflow INFO:
	 [Node] Executing "intensity_norm" <qsirecon.interfaces.mrtrix.MTNormalize>
260704-09:11:45,630 nipype.workflow INFO:
	 [Node] Finished "intensity_norm", elapsed time 2.489628s.
260704-09:11:47,411 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.plot_peaks" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/plot_peaks".
260704-09:11:47,413 nipype.workflow INFO:
	 [Node] Executing "plot_peaks" <qsirecon.interfaces.reports.CLIReconPeaksReport>
260704-09:11:51,51 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.track_ifod2.tractography" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/track_ifod2/tractography".
260704-09:11:51,54 nipype.workflow INFO:
	 [Node] Executing "tractography" <qsirecon.interfaces.mrtrix.TckGen>
260704-09:12:48,622 nipype.workflow INFO:
	 [Node] Finished "plot_peaks", elapsed time 61.208358s.
260704-09:22:42,926 nipype.workflow INFO:
	 [Node] Finished "tractography", elapsed time 651.871941s.
260704-09:22:43,623 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.track_ifod2.tck_sift2" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/track_ifod2/tck_sift2".
260704-09:22:43,687 nipype.workflow INFO:
	 [Node] Executing "tck_sift2" <qsirecon.interfaces.mrtrix.SIFT2>
260704-09:23:12,451 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq".
INFO:nipype.workflow:[Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq".
260704-09:23:12,456 nipype.workflow INFO:
	 [Node] Executing "run_afq" <qsirecon.interfaces.pyafq.PyAFQRecon>
INFO:nipype.workflow:[Node] Executing "run_afq" <qsirecon.interfaces.pyafq.PyAFQRecon>
INFO:AFQ:No seed mask given, using FA (or first scalar if none are FA)thresholded to 0.2
INFO:AFQ:No stop mask given, using FA (or first scalar if none are FA)thresholded to 0.2
260704-09:23:15,805 nipype.workflow INFO:
	 [Node] Finished "tck_sift2", elapsed time 32.117521s.
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
INFO:AFQ:Saving /scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq/study/subject/PYAFQ/models/sub-10317_ses-01_desc-brain_mask.nii.gz
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
WARNING:py.warnings:WARNING: No voxel with a FA higher than 0.7 were found.
        Try a larger roi or a lower threshold.
WARNING:py.warnings:WARNING: No voxel with a FA higher than 0.7 were found.
        Try a larger roi or a lower threshold.
WARNING:py.warnings:WARNING: No voxel in mask with value > 0 were found.
WARNING:py.warnings:WARNING: No voxel in mask with value > 0 were found.
WARNING:AFQ:Failed to export warped b0. This could be because your mapping type is only compatible with transformation from template to subject space. The error is: Could not compute CSD response function for file: 
<class 'nibabel.nifti1.Nifti1Image'>
data shape (80, 98, 85, 145)
affine:
[[ -2.   0.   0.  79.]
 [  0.  -2.   0.  80.]
 [  0.   0.   2. -79.]
 [  0.   0.   0.   1.]]
metadata:
<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
sizeof_hdr      : 348
data_type       : b''
db_name         : b''
extents         : 0
session_error   : 0
regular         : b''
dim_info        : 0
dim             : [  4  80  98  85 145   1   1   1]
intent_p1       : 0.0
intent_p2       : 0.0
intent_p3       : 0.0
intent_code     : none
datatype        : float64
bitpix          : 64
slice_start     : 0
pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
vox_offset      : 0.0
scl_slope       : nan
scl_inter       : nan
slice_end       : 0
slice_code      : unknown
xyzt_units      : 0
cal_max         : 0.0
cal_min         : 0.0
slice_duration  : 0.0
toffset         : 0.0
glmax           : 0
glmin           : 0
descrip         : b''
aux_file        : b''
qform_code      : unknown
sform_code      : aligned
quatern_b       : 0.0
quatern_c       : 0.0
quatern_d       : 1.0
qoffset_x       : 79.0
qoffset_y       : 80.0
qoffset_z       : -79.0
srow_x          : [-2.  0.  0. 79.]
srow_y          : [ 0. -2.  0. 80.]
srow_z          : [  0.   0.   2. -79.]
intent_name     : b''
magic           : b'n+1'
.
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
WARNING:py.warnings:WARNING: No voxel with a FA higher than 0.7 were found.
        Try a larger roi or a lower threshold.
WARNING:py.warnings:WARNING: No voxel with a FA higher than 0.7 were found.
        Try a larger roi or a lower threshold.
WARNING:py.warnings:WARNING: No voxel in mask with value > 0 were found.
WARNING:py.warnings:WARNING: No voxel in mask with value > 0 were found.
260704-09:23:21,996 nipype.workflow INFO:
	 [Node] Finished "run_afq", elapsed time 9.471592s.
INFO:nipype.workflow:[Node] Finished "run_afq", elapsed time 9.471592s.
260704-09:23:21,996 nipype.workflow WARNING:
	 Storing result file without outputs
WARNING:nipype.workflow:Storing result file without outputs
260704-09:23:21,997 nipype.workflow WARNING:
	 [Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
WARNING:nipype.workflow:[Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
260704-09:23:23,185 nipype.workflow ERROR:
	 Node run_afq failed to run on host CLA19787.tu.temple.edu.
ERROR:nipype.workflow:Node run_afq failed to run on host CLA19787.tu.temple.edu.
260704-09:23:23,189 nipype.workflow ERROR:
	 Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-090545_98e65209-5138-45bc-b88e-1883278c9ae0/crash-20260704-092323-tug87422-run_afq-d81be033-c96c-48fb-b6d3-9409bcdf097f.txt
Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 340, in csd_params
	    csdf = csd_fit_model(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 67, in _fit
	    return _model(gtab, data, response, sh_order, csd_fa_thr).fit(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 56, in _model
	    raise CsdNanResponseError
	AFQ.models.csd.CsdNanResponseError

	The above exception was the direct cause of the following exception:

	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
	    myafq.export_all()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
	    export_all_helper(self, xforms, indiv, viz)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
	    api_afq_object.export("template_xform")
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
	    return self.wf_dict[section][attr_name]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 212, in get_reg_subject
	    reg_subject_spec = data_imap[filename_dict[reg_subject_spec]]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 146, in wrapper_as_file
	    gen, meta = func(*args[:og_arg_count], **kwargs)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 216, in wrapper_as_img
	    data, meta = func(*args[:og_arg_count], **kwargs)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 347, in csd_params
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	<class 'nibabel.nifti1.Nifti1Image'>
	data shape (80, 98, 85, 145)
	affine:
	[[ -2.   0.   0.  79.]
	 [  0.  -2.   0.  80.]
	 [  0.   0.   2. -79.]
	 [  0.   0.   0.   1.]]
	metadata:
	<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
	sizeof_hdr      : 348
	data_type       : b''
	db_name         : b''
	extents         : 0
	session_error   : 0
	regular         : b''
	dim_info        : 0
	dim             : [  4  80  98  85 145   1   1   1]
	intent_p1       : 0.0
	intent_p2       : 0.0
	intent_p3       : 0.0
	intent_code     : none
	datatype        : float64
	bitpix          : 64
	slice_start     : 0
	pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
	vox_offset      : 0.0
	scl_slope       : nan
	scl_inter       : nan
	slice_end       : 0
	slice_code      : unknown
	xyzt_units      : 0
	cal_max         : 0.0
	cal_min         : 0.0
	slice_duration  : 0.0
	toffset         : 0.0
	glmax           : 0
	glmin           : 0
	descrip         : b''
	aux_file        : b''
	qform_code      : unknown
	sform_code      : aligned
	quatern_b       : 0.0
	quatern_c       : 0.0
	quatern_d       : 1.0
	qoffset_x       : 79.0
	qoffset_y       : 80.0
	qoffset_z       : -79.0
	srow_x          : [-2.  0.  0. 79.]
	srow_y          : [ 0. -2.  0. 80.]
	srow_z          : [  0.   0.   2. -79.]
	intent_name     : b''
	magic           : b'n+1'
	.


ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-090545_98e65209-5138-45bc-b88e-1883278c9ae0/crash-20260704-092323-tug87422-run_afq-d81be033-c96c-48fb-b6d3-9409bcdf097f.txt
Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 340, in csd_params
	    csdf = csd_fit_model(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 67, in _fit
	    return _model(gtab, data, response, sh_order, csd_fa_thr).fit(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 56, in _model
	    raise CsdNanResponseError
	AFQ.models.csd.CsdNanResponseError

	The above exception was the direct cause of the following exception:

	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
	    myafq.export_all()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
	    export_all_helper(self, xforms, indiv, viz)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
	    api_afq_object.export("template_xform")
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
	    return self.wf_dict[section][attr_name]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 212, in get_reg_subject
	    reg_subject_spec = data_imap[filename_dict[reg_subject_spec]]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 146, in wrapper_as_file
	    gen, meta = func(*args[:og_arg_count], **kwargs)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 216, in wrapper_as_img
	    data, meta = func(*args[:og_arg_count], **kwargs)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 347, in csd_params
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	<class 'nibabel.nifti1.Nifti1Image'>
	data shape (80, 98, 85, 145)
	affine:
	[[ -2.   0.   0.  79.]
	 [  0.  -2.   0.  80.]
	 [  0.   0.   2. -79.]
	 [  0.   0.   0.   1.]]
	metadata:
	<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
	sizeof_hdr      : 348
	data_type       : b''
	db_name         : b''
	extents         : 0
	session_error   : 0
	regular         : b''
	dim_info        : 0
	dim             : [  4  80  98  85 145   1   1   1]
	intent_p1       : 0.0
	intent_p2       : 0.0
	intent_p3       : 0.0
	intent_code     : none
	datatype        : float64
	bitpix          : 64
	slice_start     : 0
	pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
	vox_offset      : 0.0
	scl_slope       : nan
	scl_inter       : nan
	slice_end       : 0
	slice_code      : unknown
	xyzt_units      : 0
	cal_max         : 0.0
	cal_min         : 0.0
	slice_duration  : 0.0
	toffset         : 0.0
	glmax           : 0
	glmin           : 0
	descrip         : b''
	aux_file        : b''
	qform_code      : unknown
	sform_code      : aligned
	quatern_b       : 0.0
	quatern_c       : 0.0
	quatern_d       : 1.0
	qoffset_x       : 79.0
	qoffset_y       : 80.0
	qoffset_z       : -79.0
	srow_x          : [-2.  0.  0. 79.]
	srow_y          : [ 0. -2.  0. 80.]
	srow_z          : [  0.   0.   2. -79.]
	intent_name     : b''
	magic           : b'n+1'
	.


260704-09:23:23,202 nipype.workflow CRITICAL:
	 QSIRecon failed: Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 340, in csd_params
	    csdf = csd_fit_model(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 67, in _fit
	    return _model(gtab, data, response, sh_order, csd_fa_thr).fit(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 56, in _model
	    raise CsdNanResponseError
	AFQ.models.csd.CsdNanResponseError

	The above exception was the direct cause of the following exception:

	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
	    myafq.export_all()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
	    export_all_helper(self, xforms, indiv, viz)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
	    api_afq_object.export("template_xform")
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
	    return self.wf_dict[section][attr_name]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 212, in get_reg_subject
	    reg_subject_spec = data_imap[filename_dict[reg_subject_spec]]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 146, in wrapper_as_file
	    gen, meta = func(*args[:og_arg_count], **kwargs)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 216, in wrapper_as_img
	    data, meta = func(*args[:og_arg_count], **kwargs)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 347, in csd_params
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	<class 'nibabel.nifti1.Nifti1Image'>
	data shape (80, 98, 85, 145)
	affine:
	[[ -2.   0.   0.  79.]
	 [  0.  -2.   0.  80.]
	 [  0.   0.   2. -79.]
	 [  0.   0.   0.   1.]]
	metadata:
	<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
	sizeof_hdr      : 348
	data_type       : b''
	db_name         : b''
	extents         : 0
	session_error   : 0
	regular         : b''
	dim_info        : 0
	dim             : [  4  80  98  85 145   1   1   1]
	intent_p1       : 0.0
	intent_p2       : 0.0
	intent_p3       : 0.0
	intent_code     : none
	datatype        : float64
	bitpix          : 64
	slice_start     : 0
	pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
	vox_offset      : 0.0
	scl_slope       : nan
	scl_inter       : nan
	slice_end       : 0
	slice_code      : unknown
	xyzt_units      : 0
	cal_max         : 0.0
	cal_min         : 0.0
	slice_duration  : 0.0
	toffset         : 0.0
	glmax           : 0
	glmin           : 0
	descrip         : b''
	aux_file        : b''
	qform_code      : unknown
	sform_code      : aligned
	quatern_b       : 0.0
	quatern_c       : 0.0
	quatern_d       : 1.0
	qoffset_x       : 79.0
	qoffset_y       : 80.0
	qoffset_z       : -79.0
	srow_x          : [-2.  0.  0. 79.]
	srow_y          : [ 0. -2.  0. 80.]
	srow_z          : [  0.   0.   2. -79.]
	intent_name     : b''
	magic           : b'n+1'
	.


CRITICAL:nipype.workflow:QSIRecon failed: Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 340, in csd_params
	    csdf = csd_fit_model(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 67, in _fit
	    return _model(gtab, data, response, sh_order, csd_fa_thr).fit(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 56, in _model
	    raise CsdNanResponseError
	AFQ.models.csd.CsdNanResponseError

	The above exception was the direct cause of the following exception:

	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
	    myafq.export_all()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
	    export_all_helper(self, xforms, indiv, viz)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
	    api_afq_object.export("template_xform")
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
	    return self.wf_dict[section][attr_name]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 212, in get_reg_subject
	    reg_subject_spec = data_imap[filename_dict[reg_subject_spec]]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
	    args.append(opts[name])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
	    val = val()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
	    def curry_choice(k, args): return lambda:choose_fn(k, args)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
	    return vs[-1][k]
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
	    self._run_node(self.plan.efferents[k])
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
	    if not found: res = node(self)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
	    result = self.function(*args)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 146, in wrapper_as_file
	    gen, meta = func(*args[:og_arg_count], **kwargs)
	  File "<string>", line 2, in wrapper_has_args_func
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 216, in wrapper_as_img
	    data, meta = func(*args[:og_arg_count], **kwargs)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 347, in csd_params
	    raise CsdNanResponseError(
	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
	<class 'nibabel.nifti1.Nifti1Image'>
	data shape (80, 98, 85, 145)
	affine:
	[[ -2.   0.   0.  79.]
	 [  0.  -2.   0.  80.]
	 [  0.   0.   2. -79.]
	 [  0.   0.   0.   1.]]
	metadata:
	<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
	sizeof_hdr      : 348
	data_type       : b''
	db_name         : b''
	extents         : 0
	session_error   : 0
	regular         : b''
	dim_info        : 0
	dim             : [  4  80  98  85 145   1   1   1]
	intent_p1       : 0.0
	intent_p2       : 0.0
	intent_p3       : 0.0
	intent_code     : none
	datatype        : float64
	bitpix          : 64
	slice_start     : 0
	pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
	vox_offset      : 0.0
	scl_slope       : nan
	scl_inter       : nan
	slice_end       : 0
	slice_code      : unknown
	xyzt_units      : 0
	cal_max         : 0.0
	cal_min         : 0.0
	slice_duration  : 0.0
	toffset         : 0.0
	glmax           : 0
	glmin           : 0
	descrip         : b''
	aux_file        : b''
	qform_code      : unknown
	sform_code      : aligned
	quatern_b       : 0.0
	quatern_c       : 0.0
	quatern_d       : 1.0
	qoffset_x       : 79.0
	qoffset_y       : 80.0
	qoffset_z       : -79.0
	srow_x          : [-2.  0.  0. 79.]
	srow_y          : [ 0. -2.  0. 80.]
	srow_z          : [  0.   0.   2. -79.]
	intent_name     : b''
	magic           : b'n+1'
	.


INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
