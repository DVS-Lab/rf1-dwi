# Run Record: qsirecon-ACThsvs-smoke-one-atlas

- Timestamp: 20260703-203507
- Branch: codex/linux2-qsiprep-test
- Commit: 17954ce
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-203507_qsirecon-ACThsvs-smoke-one-atlas.log`
- Command exit: 1
- Check exit: skipped
- Summary: CHECK SKIPPED: command failed, so post-run check was not launched.

## Command

```bash
bash run_qsirecon-ACThsvs.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 --overwrite 
```

## Check

```bash
bash check_qsirecon-ACThsvs.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt 
```

## Error Lines

```text
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
           * BIDS dataset path: /base/derivatives/qsiprep.
           * BIDS dataset path: /base/derivatives/qsiprep.
	 [Node] Executing "datasink_atlas_orig_AAL116_0" <qsirecon.interfaces.bids.CopyAtlas>
	 [Node] Executing "datasink_atlas_labels_orig_AAL116_0" <qsirecon.interfaces.bids.CopyAtlas>
WARNING optional QSIRecon report not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-ACThsvs/sub-10317.html
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
RUN START: 20260703-203507
PROJECT_ROOT: /ZPOOL/data/projects/rf1-dwi
GIT: codex/linux2-qsiprep-test 17954ce
HOST: CLA19787.tu.temple.edu
USER: tug87422
PWD: /ZPOOL/data/projects/rf1-dwi/code
COMMAND: bash run_qsirecon-ACThsvs.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 --overwrite 

Using subject list: ../logs/dwi-smoke-test/sublist-qsirecon-one.txt
QSIRecon ACT-hsvs resource plan: up to 1 subject job(s); each gets --nprocs 96, --omp-nthreads 8, --mem 196000 MB
QSIRecon ACT-hsvs atlases: AAL116
Launching QSIRecon ACT-hsvs sub-10317
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
OUTPUTS sub-10317: 1 preprocessed DWI NIfTI(s)
Using FreeSurfer subject directory: /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer/sub-10317_ses-01
Mounting FreeSurfer subject as: /freesurfer/sub-10317
QSIRecon atlases: AAL116
QSIRecon command: singularity run --cleanenv --writable-tmpfs -B /ZPOOL/data/tools/templateflow:/opt/templateflow -B /ZPOOL/data/tools/mplconfigdir:/opt/mplconfigdir -B /ZPOOL/data/projects/rf1-dwi/.cache/dipy:/opt/dipy -B /ZPOOL/data/projects/rf1-dwi:/base -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep:/smriprep:ro -B /ZPOOL/data/scratch/tug87422/qsirecon-ACThsvs-sub-10317/freesurfer:/freesurfer -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer/sub-10317_ses-01:/freesurfer/sub-10317:ro -B /ZPOOL/data/tools/licenses:/opts -B /ZPOOL/data/scratch/tug87422/qsirecon-ACThsvs-sub-10317:/scratch /ZPOOL/data/tools/qsirecon-26.0.0.sif /base/derivatives/qsiprep /base/derivatives/qsirecon-ACThsvs participant --participant-label 10317 --recon-spec mrtrix_multishell_msmt_ACT-hsvs --atlases AAL116 --input-type qsiprep --datasets smriprep=/smriprep --fs-subjects-dir /freesurfer --fs-license-file /opts/fs_license.txt --nprocs 96 --omp-nthreads 8 --mem 196000 --stop-on-first-crash -w /scratch
260703-20:35:31,368 nipype.workflow IMPORTANT:
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
260703-20:35:31,390 nipype.workflow IMPORTANT:
	 Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260703-203512_d400329e-5c98-43a2-8cc9-f938ec25b480.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
IMPORTANT:nipype.workflow:Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260703-203512_d400329e-5c98-43a2-8cc9-f938ec25b480.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
260703-20:35:31,805 nipype.utils INFO:
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

260703-20:35:31,806 nipype.workflow INFO:
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

260703-20:35:31,807 nipype.workflow INFO:
	 Found high-res anatomical data in preprocessed inputs for 10317.
INFO:nipype.workflow:Found high-res anatomical data in preprocessed inputs for 10317.
260703-20:35:31,807 nipype.workflow INFO:
	 Freesurfer directory /freesurfer/sub-10317 exists for 10317
INFO:nipype.workflow:Freesurfer directory /freesurfer/sub-10317 exists for 10317
260703-20:35:31,808 nipype.workflow INFO:
	 FreeSurfer data will be used to create a HSVS 5tt image.
INFO:nipype.workflow:FreeSurfer data will be used to create a HSVS 5tt image.
260703-20:35:31,810 nipype.workflow INFO:
	 HSVS 5tt imaged will be registered to the QSIRecon T1w image.
INFO:nipype.workflow:HSVS 5tt imaged will be registered to the QSIRecon T1w image.
260703-20:35:32,239 nipype.workflow INFO:
	 acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-20:35:32,240 nipype.workflow INFO:
	 orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
260703-20:35:32,240 nipype.workflow INFO:
	 template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
260703-20:35:32,240 nipype.workflow INFO:
	 acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
260703-20:35:32,241 nipype.interface INFO:
	 Collecting atlases from smriprep: /smriprep
INFO:nipype.interface:Collecting atlases from smriprep: /smriprep
260703-20:35:36,550 nipype.interface INFO:
	 Collecting atlases from qsireconatlases: /home/qsirecon/.cache/qsirecon/QSIReconAtlases
INFO:nipype.interface:Collecting atlases from qsireconatlases: /home/qsirecon/.cache/qsirecon/QSIReconAtlases
260703-20:35:36,635 nipype.workflow INFO:
	 Found 1 high-res anatomicals to process
INFO:nipype.workflow:Found 1 high-res anatomicals to process
260703-20:35:36,638 nipype.workflow INFO:
	 Found T1w-to-template transforms from QSIRecon
INFO:nipype.workflow:Found T1w-to-template transforms from QSIRecon
260703-20:35:36,639 nipype.workflow INFO:
	 Transforming ODF ROIs into DWI space for visual report.
INFO:nipype.workflow:Transforming ODF ROIs into DWI space for visual report.
260703-20:35:36,679 nipype.interface INFO:
	 Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
INFO:nipype.interface:Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
260703-20:35:36,679 nipype.interface INFO:
	 Using 8 threads in MRtrix3
INFO:nipype.interface:Using 8 threads in MRtrix3
260703-20:35:38,768 nipype.workflow INFO:
	 QSIRecon workflow graph with 82 nodes built successfully.
INFO:nipype.workflow:QSIRecon workflow graph with 82 nodes built successfully.
INFO:cli:Generating an HTML version of the citation boilerplate...
INFO:cli:Generating a LaTeX version of the citation boilerplate...
260703-20:35:47,903 nipype.workflow IMPORTANT:
	 QSIRecon started!
IMPORTANT:nipype.workflow:QSIRecon started!
260703-20:35:51,48 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.fs_source" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/fs_source".
260703-20:35:51,50 nipype.workflow INFO:
	 [Node] Executing "fs_source" <nipype.interfaces.io.FreeSurferSource>
260703-20:35:51,60 nipype.workflow INFO:
	 [Node] Finished "fs_source", elapsed time 0.007546s.
260703-20:35:51,981 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.datasink_atlas_orig_AAL116_0" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/datasink_atlas_orig_AAL116_0".
260703-20:35:51,983 nipype.workflow INFO:
	 [Node] Executing "datasink_atlas_orig_AAL116_0" <qsirecon.interfaces.bids.CopyAtlas>
260703-20:35:51,990 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data".
260703-20:35:51,990 nipype.workflow INFO:
	 [Node] Finished "datasink_atlas_orig_AAL116_0", elapsed time 0.004733s.
260703-20:35:51,990 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.datasink_atlas_labels_orig_AAL116_0" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/datasink_atlas_labels_orig_AAL116_0".
260703-20:35:51,991 nipype.workflow INFO:
	 [Node] Executing "sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data" <qsirecon.interfaces.ingress.QSIPrepDWIIngress>
260703-20:35:51,992 nipype.workflow INFO:
	 [Node] Executing "datasink_atlas_labels_orig_AAL116_0" <qsirecon.interfaces.bids.CopyAtlas>
260703-20:35:51,995 nipype.workflow INFO:
	 [Node] Finished "datasink_atlas_labels_orig_AAL116_0", elapsed time 0.000996s.
260703-20:35:51,996 nipype.workflow INFO:
	 [Node] Finished "sub_10317_ses_01_space_ACPC_desc_preproc_ingressed_dwi_data", elapsed time 0.002042s.
260703-20:35:52,198 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.odf_rois" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/odf_rois".
260703-20:35:52,201 nipype.workflow INFO:
	 [Node] Executing "odf_rois" <nipype.interfaces.ants.resampling.ApplyTransforms>
260703-20:35:52,231 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.resample_mask" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/resample_mask".
260703-20:35:52,318 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.create_5tt_hsvs" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/create_5tt_hsvs".
260703-20:35:52,320 nipype.workflow INFO:
	 [Node] Executing "create_5tt_hsvs" <qsirecon.interfaces.mrtrix.GenerateMasked5tt>
260703-20:35:52,330 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.get_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/get_template".
260703-20:35:52,332 nipype.workflow INFO:
	 [Node] Executing "get_template" <qsirecon.interfaces.anatomical.GetTemplate>
260703-20:35:52,358 nipype.workflow INFO:
	 [Node] Finished "get_template", elapsed time 0.021554s.
260703-20:35:53,539 nipype.workflow INFO:
	 [Node] Executing "resample_mask" <nipype.interfaces.ants.resampling.ApplyTransforms>
260703-20:35:53,961 nipype.workflow INFO:
	 [Node] Finished "resample_mask", elapsed time 0.24295s.
260703-20:35:56,529 nipype.workflow INFO:
	 [Node] Finished "odf_rois", elapsed time 4.091753s.
labelconvert: Image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz" stored with floating-point type; need to check for non-integer or negative values
[?7llabelconvert: [  1%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  2%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  3%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  5%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  6%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  8%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  9%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 10%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 12%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 13%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 15%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 16%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 18%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 19%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 20%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 22%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 23%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 25%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 26%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 28%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 29%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 30%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 32%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 33%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 35%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 36%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 38%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 39%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 40%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 42%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 43%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 45%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 46%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 48%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 49%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 50%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 52%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 53%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 55%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 56%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 58%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 59%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 60%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 62%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 63%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 65%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 66%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 68%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 69%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 70%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 72%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 73%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 75%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 76%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 78%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 79%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 80%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 82%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 83%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 85%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 86%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 88%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 89%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 90%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 92%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 93%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 95%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 96%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 98%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 99%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [100%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7hlabelconvert: [100%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"[0K
[?7llabelconvert: [  0%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  1%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  2%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  3%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  4%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  5%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  6%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  7%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  8%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [  9%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 10%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 11%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 12%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 13%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 14%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 15%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 16%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 17%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 18%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 19%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 20%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 21%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 22%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 23%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 24%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 25%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 26%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 27%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 28%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 29%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 30%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 31%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 32%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 33%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 34%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 35%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 36%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 37%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 38%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 39%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 40%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 41%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 42%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 43%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 44%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 45%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 46%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 47%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 48%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 49%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 50%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 51%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 52%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 53%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 54%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 55%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 56%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 57%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 58%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 59%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 60%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 61%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 62%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 63%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 64%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 65%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 66%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 67%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 68%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 69%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 70%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 71%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 72%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 73%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 74%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 75%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 76%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 77%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 78%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 79%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 80%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 81%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 82%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 83%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 84%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 85%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 86%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 87%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 88%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 89%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 90%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 91%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 92%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 93%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 94%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 95%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 96%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 97%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 98%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [ 99%] Verifying parcellation image...[0K[?7h[?7llabelconvert: [100%] Verifying parcellation image...[0K[?7hlabelconvert: [100%] Verifying parcellation image[0K
[?7llabelconvert: [  1%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  2%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  3%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  5%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  6%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  8%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [  9%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 10%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 12%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 13%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 15%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 16%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 18%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 19%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 20%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 22%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 23%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 25%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 26%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 28%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 29%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 30%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 32%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 33%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 35%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 36%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 38%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 39%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 40%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 42%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 43%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 45%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 46%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 48%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 49%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 50%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 52%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 53%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 55%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 56%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 58%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 59%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 60%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 62%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 63%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 65%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 66%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 68%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 69%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 70%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 72%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 73%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 75%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 76%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 78%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 79%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 80%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 82%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 83%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 85%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 86%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 88%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 89%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 90%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 92%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 93%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 95%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 96%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 98%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [ 99%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7h[?7llabelconvert: [100%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"...[0K[?7hlabelconvert: [100%] uncompressing image "/home/qsirecon/.cache/qsirecon/QSIReconAtlases/tpl-MNI152NLin2009cAsym/tpl-MNI152NLin2009cAsym_atlas-AAL116_res-01_dseg.nii.gz"[0K
260703-20:35:57,379 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.voxel_size_chooser" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/voxel_size_chooser".
260703-20:35:57,382 nipype.workflow INFO:
	 [Node] Executing "voxel_size_chooser" <qsirecon.interfaces.anatomical.VoxelSizeChooser>
260703-20:35:57,404 nipype.workflow INFO:
	 [Node] Finished "voxel_size_chooser", elapsed time 0.022004s.
260703-20:35:57,478 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.register_fs_to_qsiprep_wf.convert_fs_brain" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/register_fs_to_qsiprep_wf/convert_fs_brain".
260703-20:35:57,481 nipype.workflow INFO:
	 [Node] Executing "convert_fs_brain" <nipype.interfaces.mrtrix3.utils.MRConvert>
260703-20:35:57,502 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.mask_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/mask_template".
260703-20:35:57,504 nipype.workflow INFO:
	 [Node] Executing "mask_template" <nipype.interfaces.afni.utils.Calc>
260703-20:35:57,514 nipype.interface WARNING:
	 Changing /base/derivatives/qsirecon-ACThsvs/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
WARNING:nipype.interface:Changing /base/derivatives/qsirecon-ACThsvs/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
260703-20:35:58,43 nipype.workflow INFO:
	 [Node] Finished "convert_fs_brain", elapsed time 0.431025s.
260703-20:35:58,114 nipype.workflow INFO:
	 [Node] Finished "mask_template", elapsed time 0.609314s.
260703-20:35:59,503 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.register_fs_to_qsiprep_wf.register_to_qsiprep" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/register_fs_to_qsiprep_wf/register_to_qsiprep".
260703-20:35:59,506 nipype.workflow INFO:
	 [Node] Executing "register_to_qsiprep" <nipype.interfaces.ants.registration.Registration>
260703-20:35:59,528 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.reorient_to_lps" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/reorient_to_lps".
260703-20:35:59,530 nipype.workflow INFO:
	 [Node] Executing "reorient_to_lps" <nipype.interfaces.afni.utils.Resample>
260703-20:35:59,542 nipype.interface WARNING:
	 Changing /base/derivatives/qsirecon-ACThsvs/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_seg-AAL116_dseg.nii.gz dtype from float64 to float64
WARNING:nipype.interface:Changing /base/derivatives/qsirecon-ACThsvs/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_seg-AAL116_dseg.nii.gz dtype from float64 to float64
260703-20:35:59,841 nipype.workflow INFO:
	 [Node] Finished "reorient_to_lps", elapsed time 0.310167s.
260703-20:36:01,530 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.autobox_template" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/autobox_template".
260703-20:36:01,553 nipype.workflow INFO:
	 [Node] Executing "autobox_template" <nipype.interfaces.afni.utils.Autobox>
260703-20:36:02,81 nipype.workflow INFO:
	 [Node] Finished "autobox_template", elapsed time 0.527812s.
260703-20:36:03,531 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.deoblique_autobox" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/deoblique_autobox".
260703-20:36:03,533 nipype.workflow INFO:
	 [Node] Executing "deoblique_autobox" <nipype.interfaces.afni.preprocess.Warp>
260703-20:36:03,984 nipype.workflow INFO:
	 [Node] Finished "deoblique_autobox", elapsed time 0.449734s.
260703-20:36:05,507 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf.output_grid_wf.resample_to_voxel_size" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_dwi_specific_anat_wf/output_grid_wf/resample_to_voxel_size".
260703-20:36:05,510 nipype.workflow INFO:
	 [Node] Executing "resample_to_voxel_size" <nipype.interfaces.afni.utils.Resample>
260703-20:36:05,651 nipype.workflow INFO:
	 [Node] Finished "resample_to_voxel_size", elapsed time 0.140699s.
260703-20:36:42,396 nipype.workflow INFO:
	 [Node] Finished "register_to_qsiprep", elapsed time 42.889263s.
260703-20:36:43,535 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.register_fs_to_qsiprep_wf.convert_ants_transform" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/register_fs_to_qsiprep_wf/convert_ants_transform".
260703-20:36:43,537 nipype.workflow INFO:
	 [Node] Executing "convert_ants_transform" <qsirecon.interfaces.ants.ConvertTransformFile>
260703-20:36:43,639 nipype.workflow INFO:
	 [Node] Finished "convert_ants_transform", elapsed time 0.101659s.
260703-20:36:45,529 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.register_fs_to_qsiprep_wf.convert_ants_to_mrtrix_transform" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/register_fs_to_qsiprep_wf/convert_ants_to_mrtrix_transform".
260703-20:36:45,532 nipype.workflow INFO:
	 [Node] Executing "convert_ants_to_mrtrix_transform" <qsirecon.interfaces.mrtrix.ITKTransformConvert>
260703-20:36:45,608 nipype.workflow INFO:
	 [Node] Finished "convert_ants_to_mrtrix_transform", elapsed time 0.075889s.
260703-20:36:47,530 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.register_fs_to_qsiprep_wf.transform_brain" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/register_fs_to_qsiprep_wf/transform_brain".
260703-20:36:47,531 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.register_fs_to_qsiprep_wf.transform_aseg" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/register_fs_to_qsiprep_wf/transform_aseg".
260703-20:36:47,533 nipype.workflow INFO:
	 [Node] Executing "transform_brain" <qsirecon.interfaces.mrtrix.TransformHeader>
260703-20:36:47,533 nipype.workflow INFO:
	 [Node] Executing "transform_aseg" <qsirecon.interfaces.mrtrix.TransformHeader>
260703-20:36:48,528 nipype.workflow INFO:
	 [Node] Finished "transform_aseg", elapsed time 0.994344s.
260703-20:36:48,533 nipype.workflow INFO:
	 [Node] Finished "transform_brain", elapsed time 0.999803s.
260703-20:39:12,818 nipype.workflow INFO:
	 [Node] Finished "create_5tt_hsvs", elapsed time 200.324545s.
260703-20:39:16,315 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.recon_anatomical_wf_0.apply_header_to_5tt" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/recon_anatomical_wf_0/apply_header_to_5tt".
260703-20:39:16,342 nipype.workflow INFO:
	 [Node] Executing "apply_header_to_5tt" <qsirecon.interfaces.mrtrix.TransformHeader>
260703-20:39:16,989 nipype.workflow INFO:
	 [Node] Finished "apply_header_to_5tt", elapsed time 0.647029s.
260703-20:39:21,149 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs".
260703-20:39:21,692 nipype.workflow INFO:
	 [Node] Executing "sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs" <qsirecon.interfaces.interchange.ReconWorkflowInputs>
260703-20:39:21,693 nipype.workflow INFO:
	 [Node] Finished "sub_10317_ses_01_space_ACPC_desc_preproc_recon_inputs", elapsed time 0.000248s.
260703-20:39:23,154 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.create_mif" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/create_mif".
260703-20:39:23,173 nipype.workflow INFO:
	 [Node] Executing "create_mif" <qsirecon.interfaces.mrtrix.MRTrixIngress>
260703-20:39:24,895 nipype.interface INFO:
	 stderr 2026-07-03T20:39:24.895283:[?7lmrconvert: [  0%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  1%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  2%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  3%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  4%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  5%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  6%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  7%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  8%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [  9%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 10%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 11%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 12%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 13%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 14%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 15%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 16%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 17%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 18%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 19%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 20%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 21%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 22%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 23%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 24%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 25%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 26%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 27%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 28%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 29%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 30%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 31%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 32%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 33%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 34%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 35%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 36%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 37%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 38%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 39%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 40%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 41%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 42%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 43%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 44%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 45%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 46%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 47%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 48%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 49%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 50%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 51%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 52%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 53%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 54%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 55%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 56%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 57%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 58%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 59%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 60%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 61%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 62%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 63%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 64%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 65%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 66%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 67%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 68%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 69%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 70%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 71%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 72%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 73%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 74%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 75%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 76%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 77%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 78%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 79%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 80%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 81%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 82%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 83%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 84%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 85%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 86%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 87%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 88%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 89%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 90%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 91%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 92%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 93%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 94%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 95%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 96%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 97%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 98%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [ 99%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7h[?7lmrconvert: [100%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"...[0K[?7hmrconvert: [100%] uncompressing image "/base/derivatives/qsiprep/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_desc-preproc_dwi.nii.gz"[0K
260703-20:39:26,146 nipype.interface INFO:
	 stderr 2026-07-03T20:39:26.146860:[?7lmrconvert: [  0%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  1%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  2%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  3%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  4%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  5%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  6%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  7%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  8%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [  9%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 10%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 11%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 12%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 13%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 14%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 15%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 16%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 17%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 18%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 19%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 20%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 21%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 22%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 23%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 24%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 25%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 26%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 27%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 28%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 29%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 30%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 31%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 32%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 33%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 34%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 35%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 36%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 37%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 38%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 39%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 40%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 41%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 42%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 43%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 44%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 45%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 46%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 47%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 48%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 49%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 50%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 51%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 52%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 53%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 54%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 55%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 56%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 57%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 58%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 59%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 60%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 61%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 62%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 63%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 64%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 65%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 66%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 67%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 68%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 69%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 70%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 71%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 72%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 73%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 74%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 75%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 76%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 77%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 78%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 79%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 80%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 81%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 82%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 83%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 84%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 85%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 86%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 87%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 88%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 89%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 90%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 91%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 92%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 93%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 94%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 95%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 96%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 97%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 98%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [ 99%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7h[?7lmrconvert: [100%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"...[0K[?7hmrconvert: [100%] copying from "/base/deri...CPC_desc-preproc_dwi.nii.gz" to "/scratch/q...e-ACPC_desc-preproc_dwi.mif"[0K
260703-20:39:26,224 nipype.workflow INFO:
	 [Node] Finished "create_mif", elapsed time 3.050728s.
260703-20:39:27,156 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.estimate_response" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/estimate_response".
260703-20:39:27,207 nipype.workflow INFO:
	 [Node] Executing "estimate_response" <qsirecon.interfaces.mrtrix.SS3TDwi2Response>
260703-20:39:33,899 nipype.workflow INFO:
	 [Node] Finished "estimate_response", elapsed time 6.61546s.
260703-20:39:35,171 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.estimate_fod" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/estimate_fod".
260703-20:39:35,193 nipype.workflow INFO:
	 [Node] Executing "estimate_fod" <qsirecon.interfaces.mrtrix.EstimateFOD>
260703-20:44:26,814 nipype.workflow INFO:
	 [Node] Finished "estimate_fod", elapsed time 291.620617s.
260703-20:44:27,425 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.intensity_norm" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/intensity_norm".
260703-20:44:27,445 nipype.workflow INFO:
	 [Node] Executing "intensity_norm" <qsirecon.interfaces.mrtrix.MTNormalize>
260703-20:44:29,887 nipype.workflow INFO:
	 [Node] Finished "intensity_norm", elapsed time 2.441317s.
260703-20:44:31,835 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.msmt_csd.plot_peaks" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/msmt_csd/plot_peaks".
260703-20:44:31,856 nipype.workflow INFO:
	 [Node] Executing "plot_peaks" <qsirecon.interfaces.reports.CLIReconPeaksReport>
260703-20:44:35,506 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.track_ifod2.tractography" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/track_ifod2/tractography".
260703-20:44:35,509 nipype.workflow INFO:
	 [Node] Executing "tractography" <qsirecon.interfaces.mrtrix.TckGen>
260703-20:45:02,399 nipype.workflow INFO:
	 [Node] Finished "plot_peaks", elapsed time 30.542093s.
260703-22:44:56,676 nipype.workflow INFO:
	 [Node] Finished "tractography", elapsed time 7221.065536s.
260703-22:44:57,910 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.track_ifod2.tck_sift2" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/track_ifod2/tck_sift2".
260703-22:44:57,913 nipype.workflow INFO:
	 [Node] Executing "tck_sift2" <qsirecon.interfaces.mrtrix.SIFT2>
260703-22:48:39,272 nipype.workflow INFO:
	 [Node] Finished "tck_sift2", elapsed time 221.359002s.
260703-22:49:52,384 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.mrtrix_conn.calc_connectivity" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity".
260703-22:49:52,388 nipype.workflow INFO:
	 [Node] Executing "calc_connectivity" <qsirecon.interfaces.mrtrix.MRTrixAtlasGraph>
260703-22:49:52,395 nipype.workflow INFO:
	 Workflow mrtrix_atlasgraph settings: ['check', 'execution', 'logging', 'monitoring']
260703-22:49:52,400 nipype.workflow INFO:
	 Running in parallel.
260703-22:49:52,402 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 4 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:49:54,404 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 3 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_sift_invnodevol_radius2_count
260703-22:49:55,789 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_sift_invnodevol_radius2_count" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_sift_invnodevol_radius2_count".
260703-22:49:55,791 nipype.workflow INFO:
	 [Node] Executing "AAL116_sift_invnodevol_radius2_count" <qsirecon.interfaces.mrtrix.BuildConnectome>
260703-22:50:18,712 nipype.workflow INFO:
	 [Node] Finished "AAL116_sift_invnodevol_radius2_count", elapsed time 22.792847s.
260703-22:50:20,430 nipype.workflow INFO:
	 [Job 0] Completed (mrtrix_atlasgraph.AAL116_sift_invnodevol_radius2_count).
260703-22:50:20,431 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 4 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:50:20,468 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_radius2_meanlength" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_radius2_meanlength".
260703-22:50:20,470 nipype.workflow INFO:
	 [Node] Executing "AAL116_radius2_meanlength" <qsirecon.interfaces.mrtrix.BuildConnectome>
260703-22:50:22,432 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 3 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_radius2_meanlength
260703-22:50:40,528 nipype.workflow INFO:
	 [Node] Finished "AAL116_radius2_meanlength", elapsed time 20.05758s.
260703-22:50:42,452 nipype.workflow INFO:
	 [Job 1] Completed (mrtrix_atlasgraph.AAL116_radius2_meanlength).
260703-22:50:42,453 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 4 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:50:42,489 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_radius2_count" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_radius2_count".
260703-22:50:42,491 nipype.workflow INFO:
	 [Node] Executing "AAL116_radius2_count" <qsirecon.interfaces.mrtrix.BuildConnectome>
260703-22:50:44,455 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 3 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_radius2_count
260703-22:51:01,261 nipype.workflow INFO:
	 [Node] Finished "AAL116_radius2_count", elapsed time 18.768932s.
260703-22:51:02,473 nipype.workflow INFO:
	 [Job 2] Completed (mrtrix_atlasgraph.AAL116_radius2_count).
260703-22:51:02,473 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 4 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:51:02,510 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_sift_radius2_count" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_sift_radius2_count".
260703-22:51:02,512 nipype.workflow INFO:
	 [Node] Executing "AAL116_sift_radius2_count" <qsirecon.interfaces.mrtrix.BuildConnectome>
260703-22:51:04,475 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 3 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_sift_radius2_count
260703-22:51:25,399 nipype.workflow INFO:
	 [Node] Finished "AAL116_sift_radius2_count", elapsed time 22.886383s.
260703-22:51:26,497 nipype.workflow INFO:
	 [Job 3] Completed (mrtrix_atlasgraph.AAL116_sift_radius2_count).
260703-22:51:26,498 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 6 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:51:26,533 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_sift_invnodevol_radius2_count_c2t" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_sift_invnodevol_radius2_count_c2t".
260703-22:51:26,535 nipype.workflow INFO:
	 [Node] Executing "AAL116_sift_invnodevol_radius2_count_c2t" <qsirecon.interfaces.mrtrix.Connectome2Tck>
260703-22:51:28,499 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 5 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_sift_invnodevol_radius2_count_c2t
260703-22:51:57,176 nipype.workflow INFO:
	 [Node] Finished "AAL116_sift_invnodevol_radius2_count_c2t", elapsed time 30.640411s.
260703-22:51:58,530 nipype.workflow INFO:
	 [Job 4] Completed (mrtrix_atlasgraph.AAL116_sift_invnodevol_radius2_count_c2t).
260703-22:51:58,531 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 5 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:51:58,565 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_radius2_meanlength_c2t" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_radius2_meanlength_c2t".
260703-22:51:58,567 nipype.workflow INFO:
	 [Node] Executing "AAL116_radius2_meanlength_c2t" <qsirecon.interfaces.mrtrix.Connectome2Tck>
260703-22:52:00,532 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 4 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_radius2_meanlength_c2t
260703-22:52:29,347 nipype.workflow INFO:
	 [Node] Finished "AAL116_radius2_meanlength_c2t", elapsed time 30.779527s.
260703-22:52:30,563 nipype.workflow INFO:
	 [Job 5] Completed (mrtrix_atlasgraph.AAL116_radius2_meanlength_c2t).
260703-22:52:30,564 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 4 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:52:30,600 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_radius2_count_c2t" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_radius2_count_c2t".
260703-22:52:30,602 nipype.workflow INFO:
	 [Node] Executing "AAL116_radius2_count_c2t" <qsirecon.interfaces.mrtrix.Connectome2Tck>
260703-22:52:32,565 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 3 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_radius2_count_c2t
260703-22:53:01,205 nipype.workflow INFO:
	 [Node] Finished "AAL116_radius2_count_c2t", elapsed time 30.601999s.
260703-22:53:02,594 nipype.workflow INFO:
	 [Job 6] Completed (mrtrix_atlasgraph.AAL116_radius2_count_c2t).
260703-22:53:02,595 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 3 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:53:02,633 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.AAL116_sift_radius2_count_c2t" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/AAL116_sift_radius2_count_c2t".
260703-22:53:02,635 nipype.workflow INFO:
	 [Node] Executing "AAL116_sift_radius2_count_c2t" <qsirecon.interfaces.mrtrix.Connectome2Tck>
260703-22:53:04,596 nipype.workflow INFO:
	 [MultiProc] Running 1 tasks, and 2 jobs ready. Free memory (GB): 226.15/226.35, Free processors: 0/8.
                     Currently running:
                       * mrtrix_atlasgraph.AAL116_sift_radius2_count_c2t
260703-22:53:33,726 nipype.workflow INFO:
	 [Node] Finished "AAL116_sift_radius2_count_c2t", elapsed time 31.090958s.
260703-22:53:34,626 nipype.workflow INFO:
	 [Job 7] Completed (mrtrix_atlasgraph.AAL116_sift_radius2_count_c2t).
260703-22:53:34,627 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 4 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:53:34,665 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.merge_mats" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/merge_mats".
260703-22:53:34,669 nipype.workflow INFO:
	 [Node] Executing "merge_mats" <nipype.interfaces.utility.base.Merge>
260703-22:53:34,669 nipype.workflow INFO:
	 [Node] Finished "merge_mats", elapsed time 0.000125s.
260703-22:53:34,697 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.merge_csvs" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/merge_csvs".
260703-22:53:34,700 nipype.workflow INFO:
	 [Node] Executing "merge_csvs" <nipype.interfaces.utility.base.Merge>
260703-22:53:34,701 nipype.workflow INFO:
	 [Node] Finished "merge_csvs", elapsed time 0.000118s.
260703-22:53:34,702 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.merge_tcks" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/merge_tcks".
260703-22:53:34,705 nipype.workflow INFO:
	 [Node] Executing "merge_tcks" <nipype.interfaces.utility.base.Merge>
260703-22:53:34,706 nipype.workflow INFO:
	 [Node] Finished "merge_tcks", elapsed time 9.4e-05s.
260703-22:53:34,707 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.merge_weights" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/merge_weights".
260703-22:53:34,709 nipype.workflow INFO:
	 [Node] Executing "merge_weights" <nipype.interfaces.utility.base.Merge>
260703-22:53:34,710 nipype.workflow INFO:
	 [Node] Finished "merge_weights", elapsed time 0.000108s.
260703-22:53:36,627 nipype.workflow INFO:
	 [Job 8] Completed (mrtrix_atlasgraph.merge_mats).
260703-22:53:36,628 nipype.workflow INFO:
	 [Job 9] Completed (mrtrix_atlasgraph.merge_csvs).
260703-22:53:36,628 nipype.workflow INFO:
	 [Job 10] Completed (mrtrix_atlasgraph.merge_tcks).
260703-22:53:36,629 nipype.workflow INFO:
	 [Job 11] Completed (mrtrix_atlasgraph.merge_weights).
260703-22:53:36,629 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 1 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:53:36,675 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.merge_exemplars" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/merge_exemplars".
260703-22:53:36,678 nipype.workflow INFO:
	 [Node] Executing "merge_exemplars" <nipype.interfaces.utility.base.Merge>
260703-22:53:36,679 nipype.workflow INFO:
	 [Node] Finished "merge_exemplars", elapsed time 0.00012s.
260703-22:53:38,630 nipype.workflow INFO:
	 [Job 12] Completed (mrtrix_atlasgraph.merge_exemplars).
260703-22:53:38,631 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 1 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:53:38,674 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.compress_exemplars" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/compress_exemplars".
260703-22:53:38,676 nipype.workflow INFO:
	 [Node] Executing "compress_exemplars" <qsirecon.interfaces.mrtrix.CompressConnectome2Tck>
260703-22:53:39,641 nipype.workflow INFO:
	 [Node] Finished "compress_exemplars", elapsed time 0.964112s.
260703-22:53:40,632 nipype.workflow INFO:
	 [Job 13] Completed (mrtrix_atlasgraph.compress_exemplars).
260703-22:53:40,633 nipype.workflow INFO:
	 [MultiProc] Running 0 tasks, and 0 jobs ready. Free memory (GB): 226.35/226.35, Free processors: 8/8.
260703-22:53:42,675 nipype.workflow INFO:
	 [Node] Setting-up "mrtrix_atlasgraph.compress_exemplars" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/calc_connectivity/mrtrix_atlasgraph/compress_exemplars".
260703-22:53:42,677 nipype.workflow INFO:
	 [Node] Cached "mrtrix_atlasgraph.compress_exemplars" - collecting precomputed outputs
260703-22:53:42,677 nipype.workflow INFO:
	 [Node] "mrtrix_atlasgraph.compress_exemplars" found cached.
260703-22:53:42,677 nipype.workflow INFO:
	 [Node] Finished "calc_connectivity", elapsed time 230.288956s.
260703-22:53:44,295 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_hsvs.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.mrtrix_conn.plot_connectivity" in "/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_hsvs/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/mrtrix_conn/plot_connectivity".
260703-22:53:44,297 nipype.workflow INFO:
	 [Node] Executing "plot_connectivity" <qsirecon.interfaces.reports.ConnectivityReport>
260703-22:53:44,375 nipype.workflow INFO:
	 [Node] Finished "plot_connectivity", elapsed time 0.077257s.
260703-22:53:47,798 nipype.workflow IMPORTANT:
	 QSIRecon finished successfully!
IMPORTANT:nipype.workflow:QSIRecon finished successfully!
260703-22:53:47,802 nipype.workflow IMPORTANT:
	 Works derived from this QSIRecon execution should include the boilerplate text found in <OUTPUT_PATH>/logs/CITATION.md.
IMPORTANT:nipype.workflow:Works derived from this QSIRecon execution should include the boilerplate text found in <OUTPUT_PATH>/logs/CITATION.md.
WARNING optional QSIRecon report not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-ACThsvs/sub-10317.html
MISSING /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-ACThsvs/**/sub-10317/**/*seg-hsvs*_dseg.nii.gz
OUTPUTS sub-10317: 1 WM FOD, 1 GM FOD, 1 CSF FOD, 1 SIFT2 weights, 1 SIFT2 mu, 0 HSVS segmentation ACT-hsvs output(s)

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
