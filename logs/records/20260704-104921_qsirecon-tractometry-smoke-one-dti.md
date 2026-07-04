# Run Record: qsirecon-tractometry-smoke-one-dti

- Timestamp: 20260704-104921
- Branch: codex/linux2-qsiprep-test
- Commit: a42455c
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-104921_qsirecon-tractometry-smoke-one-dti.log`
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
Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'
	During handling of the above exception, another exception occurred:
	Traceback (most recent call last):
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'
	 QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'
	During handling of the above exception, another exception occurred:
	Traceback (most recent call last):
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'
CRITICAL:nipype.workflow:QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'
	During handling of the above exception, another exception occurred:
	Traceback (most recent call last):
	    if not found: res = node(self)
	    if not found: res = node(self)
	    if not found: res = node(self)
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
RUN START: 20260704-104921
PROJECT_ROOT: /ZPOOL/data/projects/rf1-dwi
GIT: codex/linux2-qsiprep-test a42455c
HOST: CLA19787.tu.temple.edu
USER: tug87422
PWD: /ZPOOL/data/projects/rf1-dwi/code
COMMAND: bash run_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 

Using subject list: ../logs/dwi-smoke-test/sublist-qsirecon-one.txt
QSIRecon MRtrix/PyAFQ tractometry resource plan: up to 1 subject job(s); each gets --nprocs 96, --omp-nthreads 8, --mem 196000 MB
Launching QSIRecon MRtrix/PyAFQ tractometry sub-10317
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
OUTPUTS sub-10317: 1 preprocessed DWI NIfTI(s)
Using FreeSurfer subjects directory: /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer
QSIRecon command: singularity run --cleanenv --writable-tmpfs -B /ZPOOL/data/tools/templateflow:/opt/templateflow -B /ZPOOL/data/tools/mplconfigdir:/opt/mplconfigdir -B /ZPOOL/data/projects/rf1-dwi/.cache/dipy:/opt/dipy -B /ZPOOL/data/projects/rf1-dwi:/base -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep:/smriprep:ro -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer:/freesurfer:ro -B /ZPOOL/data/tools/licenses:/opts -B /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10317:/scratch /ZPOOL/data/tools/qsirecon-26.0.0.sif /base/derivatives/qsiprep /base/derivatives/qsirecon-tractometry participant --participant-label 10317 --recon-spec /base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti.yaml --input-type qsiprep --datasets smriprep=/smriprep --fs-subjects-dir /freesurfer --fs-license-file /opts/fs_license.txt --nprocs 96 --omp-nthreads 8 --mem 196000 --stop-on-first-crash -w /scratch
260704-10:49:46,148 nipype.workflow IMPORTANT:
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
260704-10:49:46,170 nipype.workflow IMPORTANT:
	 Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260704-104927_fd0a8ec3-115b-40a4-b363-d7fdbe1def32.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
IMPORTANT:nipype.workflow:Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260704-104927_fd0a8ec3-115b-40a4-b363-d7fdbe1def32.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
260704-10:49:46,601 nipype.utils INFO:
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

260704-10:49:46,601 nipype.workflow INFO:
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

260704-10:49:46,603 nipype.workflow INFO:
	 Found high-res anatomical data in preprocessed inputs for 10317.
INFO:nipype.workflow:Found high-res anatomical data in preprocessed inputs for 10317.
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
260704-10:49:46,603 nipype.workflow INFO:
	 orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
260704-10:49:46,603 nipype.workflow INFO:
	 template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
260704-10:49:46,603 nipype.workflow INFO:
	 acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
260704-10:49:46,603 nipype.workflow INFO:
	 Found 1 high-res anatomicals to process
INFO:nipype.workflow:Found 1 high-res anatomicals to process
260704-10:49:46,609 nipype.workflow INFO:
	 Transforming ODF ROIs into DWI space for visual report.
INFO:nipype.workflow:Transforming ODF ROIs into DWI space for visual report.
260704-10:49:46,640 nipype.interface INFO:
	 Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
INFO:nipype.interface:Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
260704-10:49:46,640 nipype.interface INFO:
	 Using 8 threads in MRtrix3
INFO:nipype.interface:Using 8 threads in MRtrix3
260704-10:49:49,361 nipype.workflow INFO:
	 QSIRecon workflow graph with 57 nodes built successfully.
INFO:nipype.workflow:QSIRecon workflow graph with 57 nodes built successfully.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
INFO:cli:Generating an HTML version of the citation boilerplate...
INFO:cli:Generating a LaTeX version of the citation boilerplate...
260704-10:49:58,575 nipype.workflow IMPORTANT:
	 QSIRecon started!
IMPORTANT:nipype.workflow:QSIRecon started!
260704-10:50:02,303 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data".
260704-10:50:02,305 nipype.workflow INFO:
	 [Node] Executing "sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data" <qsirecon.interfaces.ingress.QSIPrepDWIIngress>
260704-10:50:02,310 nipype.workflow INFO:
	 [Node] Finished "sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data", elapsed time 0.00222s.
260704-10:50:02,550 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.get_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/get_template".
260704-10:50:02,552 nipype.workflow INFO:
	 [Node] Executing "get_template" <qsirecon.interfaces.anatomical.GetTemplate>
260704-10:50:02,571 nipype.workflow INFO:
	 [Node] Finished "get_template", elapsed time 0.016544s.
260704-10:50:02,821 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.resample_mask" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/resample_mask".
260704-10:50:02,823 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.odf_rois" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/odf_rois".
260704-10:50:02,825 nipype.workflow INFO:
	 [Node] Executing "resample_mask" <nipype.interfaces.ants.resampling.ApplyTransforms>
260704-10:50:02,826 nipype.workflow INFO:
	 [Node] Executing "odf_rois" <nipype.interfaces.ants.resampling.ApplyTransforms>
260704-10:50:03,767 nipype.workflow INFO:
	 [Node] Finished "resample_mask", elapsed time 0.481623s.
260704-10:50:03,770 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.voxel_size_chooser" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/voxel_size_chooser".
260704-10:50:03,772 nipype.workflow INFO:
	 [Node] Executing "voxel_size_chooser" <qsirecon.interfaces.anatomical.VoxelSizeChooser>
260704-10:50:03,793 nipype.workflow INFO:
	 [Node] Finished "voxel_size_chooser", elapsed time 0.02044s.
260704-10:50:03,816 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.mask_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/mask_template".
260704-10:50:03,818 nipype.workflow INFO:
	 [Node] Executing "mask_template" <nipype.interfaces.afni.utils.Calc>
260704-10:50:04,339 nipype.workflow INFO:
	 [Node] Finished "mask_template", elapsed time 0.52054s.
260704-10:50:05,182 nipype.interface WARNING:
	 Changing /base/derivatives/qsirecon-tractometry/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
WARNING:nipype.interface:Changing /base/derivatives/qsirecon-tractometry/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
260704-10:50:05,390 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.reorient_to_lps" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/reorient_to_lps".
260704-10:50:05,392 nipype.workflow INFO:
	 [Node] Executing "reorient_to_lps" <nipype.interfaces.afni.utils.Resample>
260704-10:50:05,683 nipype.workflow INFO:
	 [Node] Finished "reorient_to_lps", elapsed time 0.290239s.
260704-10:50:06,826 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.autobox_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/autobox_template".
260704-10:50:06,829 nipype.workflow INFO:
	 [Node] Executing "autobox_template" <nipype.interfaces.afni.utils.Autobox>
260704-10:50:07,217 nipype.workflow INFO:
	 [Node] Finished "autobox_template", elapsed time 0.385056s.
260704-10:50:07,316 nipype.workflow INFO:
	 [Node] Finished "odf_rois", elapsed time 4.031584s.
260704-10:50:08,836 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.deoblique_autobox" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/deoblique_autobox".
260704-10:50:08,838 nipype.workflow INFO:
	 [Node] Executing "deoblique_autobox" <nipype.interfaces.afni.preprocess.Warp>
260704-10:50:09,225 nipype.workflow INFO:
	 [Node] Finished "deoblique_autobox", elapsed time 0.384504s.
260704-10:50:10,808 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.resample_to_voxel_size" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/resample_to_voxel_size".
260704-10:50:10,810 nipype.workflow INFO:
	 [Node] Executing "resample_to_voxel_size" <nipype.interfaces.afni.utils.Resample>
260704-10:50:10,910 nipype.workflow INFO:
	 [Node] Finished "resample_to_voxel_size", elapsed time 0.099401s.
260704-10:50:13,867 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs".
260704-10:50:13,884 nipype.workflow INFO:
	 [Node] Executing "sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs" <qsirecon.interfaces.interchange.ReconWorkflowInputs>
260704-10:50:13,885 nipype.workflow INFO:
	 [Node] Finished "sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs", elapsed time 0.00022s.
260704-10:50:14,812 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.create_mif" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/create_mif".
260704-10:50:14,832 nipype.workflow INFO:
	 [Node] Executing "create_mif" <qsirecon.interfaces.mrtrix.MRTrixIngress>
260704-10:50:16,542 nipype.interface INFO:
	 stderr 2026-07-04T10:50:16.542098:[?7lmrconvert: [  0%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  1%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  2%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  3%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  4%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  5%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  6%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  7%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  8%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  9%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 10%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 11%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 12%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 13%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 14%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 15%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 16%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 17%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 18%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 19%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 20%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 21%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 22%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 23%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 24%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 25%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 26%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 27%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 28%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 29%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 30%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 31%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 32%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 33%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 34%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 35%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 36%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 37%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 38%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 39%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 40%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 41%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 42%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 43%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 44%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 45%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 46%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 47%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 48%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 49%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 50%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 51%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 52%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 53%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 54%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 55%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 56%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 57%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 58%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 59%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 60%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 61%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 62%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 63%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 64%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 65%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 66%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 67%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 68%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 69%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 70%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 71%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 72%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 73%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 74%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 75%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 76%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 77%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 78%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 79%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 80%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 81%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 82%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 83%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 84%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 85%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 86%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 87%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 88%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 89%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 90%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 91%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 92%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 93%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 94%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 95%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 96%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 97%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 98%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 99%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [100%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7hmrconvert: [100%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"[0K
260704-10:50:17,771 nipype.interface INFO:
	 stderr 2026-07-04T10:50:17.771694:[?7lmrconvert: [  0%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  1%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  2%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  3%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  4%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  5%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  6%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  7%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  8%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  9%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 10%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 11%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 12%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 13%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 14%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 15%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 16%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 17%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 18%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 19%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 20%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 21%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 22%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 23%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 24%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 25%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 26%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 27%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 28%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 29%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 30%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 31%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 32%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 33%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 34%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 35%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 36%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 37%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 38%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 39%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 40%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 41%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 42%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 43%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 44%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 45%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 46%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 47%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 48%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 49%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 50%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 51%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 52%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 53%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 54%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 55%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 56%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 57%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 58%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 59%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 60%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 61%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 62%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 63%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 64%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 65%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 66%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 67%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 68%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 69%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 70%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 71%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 72%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 73%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 74%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 75%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 76%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 77%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 78%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 79%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 80%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 81%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 82%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 83%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 84%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 85%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 86%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 87%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 88%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 89%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 90%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 91%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 92%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 93%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 94%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 95%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 96%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 97%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 98%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 99%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [100%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7hmrconvert: [100%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"[0K
260704-10:50:17,844 nipype.workflow INFO:
	 [Node] Finished "create_mif", elapsed time 3.011743s.
260704-10:50:19,887 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.estimate_response" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/estimate_response".
260704-10:50:19,906 nipype.workflow INFO:
	 [Node] Executing "estimate_response" <qsirecon.interfaces.mrtrix.SS3TDwi2Response>
260704-10:50:26,639 nipype.workflow INFO:
	 [Node] Finished "estimate_response", elapsed time 6.5873159999999995s.
260704-10:50:26,833 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.estimate_fod" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/estimate_fod".
260704-10:50:26,859 nipype.workflow INFO:
	 [Node] Executing "estimate_fod" <qsirecon.interfaces.mrtrix.EstimateFOD>
260704-10:55:23,809 nipype.workflow INFO:
	 [Node] Finished "estimate_fod", elapsed time 296.877774s.
260704-10:55:25,100 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.intensity_norm" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/intensity_norm".
260704-10:55:25,103 nipype.workflow INFO:
	 [Node] Executing "intensity_norm" <qsirecon.interfaces.mrtrix.MTNormalize>
260704-10:55:27,724 nipype.workflow INFO:
	 [Node] Finished "intensity_norm", elapsed time 2.49562s.
260704-10:55:29,483 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.plot_peaks" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/plot_peaks".
260704-10:55:29,486 nipype.workflow INFO:
	 [Node] Executing "plot_peaks" <qsirecon.interfaces.reports.CLIReconPeaksReport>
260704-10:55:33,93 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.track_ifod2.tractography" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/track_ifod2/tractography".
260704-10:55:33,95 nipype.workflow INFO:
	 [Node] Executing "tractography" <qsirecon.interfaces.mrtrix.TckGen>
260704-10:56:29,462 nipype.workflow INFO:
	 [Node] Finished "plot_peaks", elapsed time 59.975399s.
260704-11:06:34,180 nipype.workflow INFO:
	 [Node] Finished "tractography", elapsed time 661.083686s.
260704-11:06:35,676 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.track_ifod2.tck_sift2" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/track_ifod2/tck_sift2".
260704-11:06:35,679 nipype.workflow INFO:
	 [Node] Executing "tck_sift2" <qsirecon.interfaces.mrtrix.SIFT2>
260704-11:07:04,331 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq".
INFO:nipype.workflow:[Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq".
260704-11:07:04,336 nipype.workflow INFO:
	 [Node] Executing "run_afq" <qsirecon.interfaces.pyafq.PyAFQRecon>
INFO:nipype.workflow:[Node] Executing "run_afq" <qsirecon.interfaces.pyafq.PyAFQRecon>
INFO:AFQ:No seed mask given, using FA (or first scalar if none are FA)thresholded to 0.2
INFO:AFQ:No stop mask given, using FA (or first scalar if none are FA)thresholded to 0.2
260704-11:07:07,722 nipype.workflow INFO:
	 [Node] Finished "tck_sift2", elapsed time 32.041907s.
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
WARNING:py.warnings:WARNING: Pass ['bvecs'] as keyword args. From version 2.0.0 passing these as positional arguments will result in an error. 
INFO:AFQ:Saving /scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq/study/subject/PYAFQ/models/sub-10317_ses-01_desc-brain_mask.nii.gz
WARNING:AFQ:Failed to export warped b0. This could be because your mapping type is only compatible with transformation from template to subject space. The error is: No such file or no access: 'dti_fa'
260704-11:07:12,705 nipype.workflow INFO:
	 [Node] Finished "run_afq", elapsed time 8.31495s.
INFO:nipype.workflow:[Node] Finished "run_afq", elapsed time 8.31495s.
260704-11:07:12,705 nipype.workflow WARNING:
	 Storing result file without outputs
WARNING:nipype.workflow:Storing result file without outputs
260704-11:07:12,706 nipype.workflow WARNING:
	 [Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
WARNING:nipype.workflow:[Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
260704-11:07:13,56 nipype.workflow ERROR:
	 Node run_afq failed to run on host CLA19787.tu.temple.edu.
ERROR:nipype.workflow:Node run_afq failed to run on host CLA19787.tu.temple.edu.
260704-11:07:13,59 nipype.workflow ERROR:
	 Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-104927_fd0a8ec3-115b-40a4-b363-d7fdbe1def32/crash-20260704-110713-tug87422-run_afq-29c9eb60-533b-45aa-ae1d-022f8228b2df.txt
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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 101, in load
	    stat_result = os.stat(filename)
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'

	During handling of the above exception, another exception occurred:

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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 214, in get_reg_subject
	    img = nib.load(reg_subject_spec)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 103, in load
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'


ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-104927_fd0a8ec3-115b-40a4-b363-d7fdbe1def32/crash-20260704-110713-tug87422-run_afq-29c9eb60-533b-45aa-ae1d-022f8228b2df.txt
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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 101, in load
	    stat_result = os.stat(filename)
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'

	During handling of the above exception, another exception occurred:

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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 214, in get_reg_subject
	    img = nib.load(reg_subject_spec)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 103, in load
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'


260704-11:07:13,72 nipype.workflow CRITICAL:
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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 101, in load
	    stat_result = os.stat(filename)
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'

	During handling of the above exception, another exception occurred:

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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 214, in get_reg_subject
	    img = nib.load(reg_subject_spec)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 103, in load
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'


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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 101, in load
	    stat_result = os.stat(filename)
	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'

	During handling of the above exception, another exception occurred:

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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 214, in get_reg_subject
	    img = nib.load(reg_subject_spec)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 103, in load
	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
	FileNotFoundError: No such file or no access: 'dti_fa'



COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
