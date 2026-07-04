# Run Record: qsirecon-noddi-smoke-jobs1

- Timestamp: 20260703-155512
- Branch: codex/linux2-qsiprep-test
- Commit: 8c5a1c5
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-155512_qsirecon-noddi-smoke-jobs1.log`
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
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.
Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
           * BIDS dataset path: /base/derivatives/qsiprep.
           * BIDS dataset path: /base/derivatives/qsiprep.
[0;30;41m[ ERROR ][0;31m Auxiliary matrices not found; call "amico.setup()" first[0m
	 [Node] Error on "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.recon_noddi" (/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/recon_noddi)
260703-15:57:06,339 nipype.workflow ERROR:
	 Node recon_noddi failed to run on host CLA19787.tu.temple.edu.
ERROR:nipype.workflow:Node recon_noddi failed to run on host CLA19787.tu.temple.edu.
260703-15:57:06,342 nipype.workflow ERROR:
Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.
Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-noddi/sub-10953/log/20260703-155615_f0bfd798-7eeb-4299-bb74-18aaad1a61cc/crash-20260703-155706-tug87422-recon_noddi-d9ace59d-1a48-4387-8531-8ff35a67ea42.txt
Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.
Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
	 QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.
Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
CRITICAL:nipype.workflow:QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.
Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
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
260703-15:56:34,586 nipype.workflow IMPORTANT:
	 Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10953'].
           * Run identifier: 20260703-155615_f0bfd798-7eeb-4299-bb74-18aaad1a61cc.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
IMPORTANT:nipype.workflow:Building QSIRecon's workflow:
           * BIDS dataset path: /base/derivatives/qsiprep.
           * Participant list: ['10953'].
           * Run identifier: 20260703-155615_f0bfd798-7eeb-4299-bb74-18aaad1a61cc.
           * Pre-run FreeSurfer's SUBJECTS_DIR: /freesurfer.
260703-15:56:35,9 nipype.utils INFO:
	 Collected anatomical data:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

INFO:nipype.utils:Collected anatomical data:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

260703-15:56:35,10 nipype.workflow INFO:
	 Anatomical data available for /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

INFO:nipype.workflow:Anatomical data available for /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz:
acpc_aparc: null
acpc_aseg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-aseg_dseg.nii.gz
acpc_brain_mask: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz
acpc_csf_probseg: null
acpc_gm_probseg: null
acpc_preproc: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz
acpc_seg: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_dseg.nii.gz
acpc_to_template_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5
acpc_wm_probseg: null
orig_to_acpc_xfm: null
template_to_acpc_xfm: /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5

260703-15:56:35,11 nipype.workflow INFO:
	 Found high-res anatomical data in preprocessed inputs for 10953.
INFO:nipype.workflow:Found high-res anatomical data in preprocessed inputs for 10953.
260703-15:56:35,11 nipype.workflow INFO:
	 acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_aparc (<class 'str'>): None (<class 'NoneType'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_seg (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_dseg.nii.gz (<class 'str'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_aseg (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-aseg_dseg.nii.gz (<class 'str'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_brain_mask (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz (<class 'str'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
INFO:nipype.workflow:acpc_preproc (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-preproc_T1w.nii.gz (<class 'str'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_csf_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_gm_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:acpc_wm_probseg (<class 'str'>): None (<class 'NoneType'>)
260703-15:56:35,12 nipype.workflow INFO:
	 orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
INFO:nipype.workflow:orig_to_acpc_xfm (<class 'str'>): None (<class 'NoneType'>)
260703-15:56:35,12 nipype.workflow INFO:
	 template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:template_to_acpc_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-MNI152NLin2009cAsym_to-ACPC_mode-image_xfm.h5 (<class 'str'>)
260703-15:56:35,12 nipype.workflow INFO:
	 acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
INFO:nipype.workflow:acpc_to_template_xfm (<class 'str'>): /base/derivatives/qsiprep/sub-10953/anat/sub-10953_from-ACPC_to-MNI152NLin2009cAsym_mode-image_xfm.h5 (<class 'str'>)
260703-15:56:35,12 nipype.workflow INFO:
	 Found 1 high-res anatomicals to process
INFO:nipype.workflow:Found 1 high-res anatomicals to process
260703-15:56:35,17 nipype.workflow INFO:
	 Transforming ODF ROIs into DWI space for visual report.
INFO:nipype.workflow:Transforming ODF ROIs into DWI space for visual report.
260703-15:56:37,88 nipype.workflow INFO:
	 QSIRecon workflow graph with 43 nodes built successfully.
INFO:nipype.workflow:QSIRecon workflow graph with 43 nodes built successfully.
INFO:cli:Generating an HTML version of the citation boilerplate...
INFO:cli:Generating a LaTeX version of the citation boilerplate...
260703-15:56:46,231 nipype.workflow IMPORTANT:
	 QSIRecon started!
IMPORTANT:nipype.workflow:QSIRecon started!
260703-15:56:50,489 nipype.interface WARNING:
	 Changing /base/derivatives/qsirecon-noddi/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
WARNING:nipype.interface:Changing /base/derivatives/qsirecon-noddi/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-brain_mask.nii.gz dtype from float64 to float64
260703-15:57:01,784 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_inputs" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_inputs".
260703-15:57:01,785 nipype.workflow INFO:
	 [Node] Outdated cache found for "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_inputs".
260703-15:57:01,787 nipype.workflow INFO:
	 [Node] Executing "sub_10953_ses_01_space_ACPC_desc_preproc_recon_inputs" <qsirecon.interfaces.interchange.ReconWorkflowInputs>
260703-15:57:01,790 nipype.workflow INFO:
	 [Node] Finished "sub_10953_ses_01_space_ACPC_desc_preproc_recon_inputs", elapsed time 0.00041s.
260703-15:57:02,967 nipype.workflow INFO:
	 [Node] Setting-up "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.recon_noddi" in "/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/recon_noddi".
260703-15:57:02,970 nipype.workflow INFO:
	 [Node] Executing "recon_noddi" <qsirecon.interfaces.amico.NODDI>
-> Rounding b-values to nearest multiple of 50.0
[0;32m
-> Writing scheme file to [ /scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/recon_noddi/study/subject/sub-10953_ses-01_space-ACPC_desc-preproc_dwi.scheme ][0m
[0;32m
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
260703-15:57:04,766 nipype.interface INFO:
	 Fitting NODDI Model.
[0;32m
-> Creating LUT for "NODDI" model:[0m
[0;30;41m[ ERROR ][0;31m Auxiliary matrices not found; call "amico.setup()" first[0m

260703-15:57:04,773 nipype.workflow INFO:
	 [Node] Finished "recon_noddi", elapsed time 1.7978420000000002s.
260703-15:57:04,773 nipype.workflow WARNING:
	 Storing result file without outputs
260703-15:57:04,773 nipype.workflow WARNING:
	 [Node] Error on "qsirecon_26_0_wf.sub-10953_amico_noddi.sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf.fit_noddi.recon_noddi" (/scratch/qsirecon_26_0_wf/sub-10953_amico_noddi/sub_10953_ses_01_space_ACPC_desc_preproc_recon_wf/fit_noddi/recon_noddi)
260703-15:57:06,339 nipype.workflow ERROR:
	 Node recon_noddi failed to run on host CLA19787.tu.temple.edu.
ERROR:nipype.workflow:Node recon_noddi failed to run on host CLA19787.tu.temple.edu.
260703-15:57:06,342 nipype.workflow ERROR:
	 Saving crash info to /base/derivatives/qsirecon-noddi/sub-10953/log/20260703-155615_f0bfd798-7eeb-4299-bb74-18aaad1a61cc/crash-20260703-155706-tug87422-recon_noddi-d9ace59d-1a48-4387-8531-8ff35a67ea42.txt
Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/amico.py", line 332, in _run_interface
	    aeval.generate_kernels()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/core.py", line 370, in generate_kernels
	    aux = amico.lut.load_precomputed_rotation_matrices( lmax, ndirs )
	  File "amico/lut.pyx", line 156, in amico.lut.load_precomputed_rotation_matrices
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
	    exit(EX_USAGE)
	SystemExit: 64


ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-noddi/sub-10953/log/20260703-155615_f0bfd798-7eeb-4299-bb74-18aaad1a61cc/crash-20260703-155706-tug87422-recon_noddi-d9ace59d-1a48-4387-8531-8ff35a67ea42.txt
Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/amico.py", line 332, in _run_interface
	    aeval.generate_kernels()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/core.py", line 370, in generate_kernels
	    aux = amico.lut.load_precomputed_rotation_matrices( lmax, ndirs )
	  File "amico/lut.pyx", line 156, in amico.lut.load_precomputed_rotation_matrices
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
	    exit(EX_USAGE)
	SystemExit: 64


260703-15:57:06,354 nipype.workflow CRITICAL:
	 QSIRecon failed: Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/amico.py", line 332, in _run_interface
	    aeval.generate_kernels()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/core.py", line 370, in generate_kernels
	    aux = amico.lut.load_precomputed_rotation_matrices( lmax, ndirs )
	  File "amico/lut.pyx", line 156, in amico.lut.load_precomputed_rotation_matrices
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
	    exit(EX_USAGE)
	SystemExit: 64


CRITICAL:nipype.workflow:QSIRecon failed: Traceback (most recent call last):
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
    result["result"] = node.run(updatehash=updatehash)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
    result = self._run_interface(execute=True)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
    return self._run_command(execute)
  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.

Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/amico.py", line 332, in _run_interface
	    aeval.generate_kernels()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/core.py", line 370, in generate_kernels
	    aux = amico.lut.load_precomputed_rotation_matrices( lmax, ndirs )
	  File "amico/lut.pyx", line 156, in amico.lut.load_precomputed_rotation_matrices
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
	    exit(EX_USAGE)
	SystemExit: 64



COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
