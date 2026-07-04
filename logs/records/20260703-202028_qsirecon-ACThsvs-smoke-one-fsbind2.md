# Run Record: qsirecon-ACThsvs-smoke-one-fsbind2

- Timestamp: 20260703-202028
- Branch: codex/linux2-qsiprep-test
- Commit: f48cf2a
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-202028_qsirecon-ACThsvs-smoke-one-fsbind2.log`
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
Traceback (most recent call last):
    raise ValueError(
ValueError: Connectivity estimation requires atlases. Please set the `--atlases` flag in your qsirecon command.
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
RUN START: 20260703-202028
PROJECT_ROOT: /ZPOOL/data/projects/rf1-dwi
GIT: codex/linux2-qsiprep-test f48cf2a
HOST: CLA19787.tu.temple.edu
USER: tug87422
PWD: /ZPOOL/data/projects/rf1-dwi/code
COMMAND: bash run_qsirecon-ACThsvs.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 --overwrite 

Using subject list: ../logs/dwi-smoke-test/sublist-qsirecon-one.txt
QSIRecon ACT-hsvs resource plan: up to 1 subject job(s); each gets --nprocs 96, --omp-nthreads 8, --mem 196000 MB
Launching QSIRecon ACT-hsvs sub-10317
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
OUTPUTS sub-10317: 1 preprocessed DWI NIfTI(s)
Using FreeSurfer subject directory: /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer/sub-10317_ses-01
Mounting FreeSurfer subject as: /freesurfer/sub-10317
QSIRecon command: singularity run --cleanenv --writable-tmpfs -B /ZPOOL/data/tools/templateflow:/opt/templateflow -B /ZPOOL/data/tools/mplconfigdir:/opt/mplconfigdir -B /ZPOOL/data/projects/rf1-dwi/.cache/dipy:/opt/dipy -B /ZPOOL/data/projects/rf1-dwi:/base -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/fmriprep:/smriprep:ro -B /ZPOOL/data/scratch/tug87422/qsirecon-ACThsvs-sub-10317/freesurfer:/freesurfer -B /ZPOOL/data/projects/rf1-sra-linux2-heudiconv14-test/derivatives/freesurfer/sub-10317_ses-01:/freesurfer/sub-10317:ro -B /ZPOOL/data/tools/licenses:/opts -B /ZPOOL/data/scratch/tug87422/qsirecon-ACThsvs-sub-10317:/scratch /ZPOOL/data/tools/qsirecon-26.0.0.sif /base/derivatives/qsiprep /base/derivatives/qsirecon-ACThsvs participant --participant-label 10317 --recon-spec mrtrix_multishell_msmt_ACT-hsvs --input-type qsiprep --datasets smriprep=/smriprep --fs-subjects-dir /freesurfer --fs-license-file /opts/fs_license.txt --nprocs 96 --omp-nthreads 8 --mem 196000 --stop-on-first-crash -w /scratch
260703-20:20:51,661 nipype.workflow IMPORTANT:
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
260703-20:20:51,683 nipype.workflow IMPORTANT:
	 Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260703-202033_a263b0d8-13fb-439a-9184-a437c7b7dd25.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
IMPORTANT:nipype.workflow:Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10317'].
           * Run identifier: 20260703-202033_a263b0d8-13fb-439a-9184-a437c7b7dd25.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
260703-20:20:52,101 nipype.utils INFO:
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

260703-20:20:52,102 nipype.workflow INFO:
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

260703-20:20:52,103 nipype.workflow INFO:
	 Found high-res anatomical data in preprocessed inputs for 10317.
INFO:nipype.workflow:Found high-res anatomical data in preprocessed inputs for 10317.
260703-20:20:52,103 nipype.workflow INFO:
	 Freesurfer directory /freesurfer/sub-10317 exists for 10317
INFO:nipype.workflow:Freesurfer directory /freesurfer/sub-10317 exists for 10317
260703-20:20:52,103 nipype.workflow INFO:
	 FreeSurfer data will be used to create a HSVS 5tt image.
INFO:nipype.workflow:FreeSurfer data will be used to create a HSVS 5tt image.
260703-20:20:52,105 nipype.workflow INFO:
	 HSVS 5tt imaged will be registered to the QSIRecon T1w image.
INFO:nipype.workflow:HSVS 5tt imaged will be registered to the QSIRecon T1w image.
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_dseg.nii.gz (<class 'str'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-20:20:52,548 nipype.workflow INFO:
	 orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
260703-20:20:52,548 nipype.workflow INFO:
	 template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
260703-20:20:52,548 nipype.workflow INFO:
	 acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10317/anat/sub-10317_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
260703-20:20:52,548 nipype.workflow INFO:
	 Found 1 high-res anatomicals to process
INFO:nipype.workflow:Found 1 high-res anatomicals to process
260703-20:20:52,553 nipype.workflow INFO:
	 Transforming ODF ROIs into DWI space for visual report.
INFO:nipype.workflow:Transforming ODF ROIs into DWI space for visual report.
260703-20:20:52,586 nipype.interface INFO:
	 Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
INFO:nipype.interface:Response configuration: {'algorithm': 'dhollander', 'nthreads': 8}
260703-20:20:52,586 nipype.interface INFO:
	 Using 8 threads in MRtrix3
INFO:nipype.interface:Using 8 threads in MRtrix3
Process Process-2:
Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/multiprocessing/process.py", line 314, in _bootstrap
    self.run()
  File "/app/.pixi/envs/qsirecon/lib/python3.10/multiprocessing/process.py", line 108, in run
    self._target(*self._args, **self._kwargs)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/cli/workflow.py", line 132, in build_workflow
    retval['workflow'] = init_qsirecon_wf()
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/workflows/base.py", line 42, in init_qsirecon_wf
    single_subject_wf = init_single_subject_recon_wf(subject_id=subject_id)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/workflows/base.py", line 282, in init_single_subject_recon_wf
    dwi_recon_wfs[dwi_file] = init_dwi_recon_workflow(
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/workflows/recon/build_workflow.py", line 87, in init_dwi_recon_workflow
    new_node = workflow_from_spec(
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/workflows/recon/build_workflow.py", line 274, in workflow_from_spec
    raise ValueError(
ValueError: Connectivity estimation requires atlases. Please set the `--atlases` flag in your qsirecon command.

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
