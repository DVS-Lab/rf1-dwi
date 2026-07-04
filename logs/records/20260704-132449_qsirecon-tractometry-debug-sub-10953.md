# Run Record: qsirecon-tractometry-debug-sub-10953

- Timestamp: 20260704-132449
- Branch: codex/linux2-qsiprep-test
- Commit: 4d42eba
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-132449_qsirecon-tractometry-debug-sub-10953.log`
- Command exit: 0
- Check exit: 0
- Summary: No CHECK PASSED/FAILED line found.

## Command

```bash
bash debug_qsirecon_tractometry_inputs.sh 10953 
```

## Full Log

```text
RUN START: 20260704-132449
PROJECT_ROOT: /ZPOOL/data/projects/rf1-dwi
GIT: codex/linux2-qsiprep-test 4d42eba
HOST: CLA19787.tu.temple.edu
USER: tug87422
PWD: /ZPOOL/data/projects/rf1-dwi/code
COMMAND: bash debug_qsirecon_tractometry_inputs.sh 10953 

QSIRecon tractometry diagnostic summary
Subject: sub-10953
Project root: /ZPOOL/data/projects/rf1-dwi
Generated: 2026-07-04 13:24:49 EDT

## Roots
QSIPrep subject: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953
Status: present
QSIRecon tractometry: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Tractometry scratch: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing

## QSIPrep Preprocessed DWI
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953
Status: present
Count: 1
/ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-preproc_dwi.nii.gz

## QSIPrep Gradients and Metadata
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953
Status: present
Count: 3
/ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-preproc_dwi.bval
/ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-preproc_dwi.bvec
/ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-preproc_dwi.json

## Brain Masks
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953
Status: present
Count: 2
/ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/anat/sub-10953_space-ACPC_desc-brain_mask.nii.gz
/ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10953/ses-01/dwi/sub-10953_ses-01_space-ACPC_desc-brain_mask.nii.gz

## QSIRecon DTI FA/MD Derivatives
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Count: 0

## Scratch DTI FA/MD Derivatives
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Count: 0

## MRtrix FOD Maps
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Count: 3
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/derivatives/qsirecon-MRtrix3/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_model-msmtcsd_param-fod_label-CSF_dwimap.mif.gz
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/derivatives/qsirecon-MRtrix3/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_model-msmtcsd_param-fod_label-GM_dwimap.mif.gz
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/derivatives/qsirecon-MRtrix3/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_model-msmtcsd_param-fod_label-WM_dwimap.mif.gz

## Scratch MRtrix FOD Maps
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Count: 0

## Tractograms and Bundles
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Count: 1
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/derivatives/qsirecon-MRtrix3/sub-10317/ses-01/dwi/sub-10317_ses-01_space-ACPC_model-ifod2_streamlines.tck.gz

## Scratch Tractograms and Bundles
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Count: 0

## PyAFQ Shim Inputs and Outputs
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Count: 0

## Tensor Scalar Search
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Count: 0

## Tensor Scalar Search
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Count: 0

## PyAFQ Profiles
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Count: 0

## QSIRecon Crash Files
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Count: 4
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-090545_98e65209-5138-45bc-b88e-1883278c9ae0/crash-20260704-092323-tug87422-run_afq-d81be033-c96c-48fb-b6d3-9409bcdf097f.txt
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-093725_f5672d85-c46a-4a6e-9351-58b101ad5625/crash-20260704-095512-tug87422-run_afq-d849ec09-0bba-48b1-8097-f610ba1ea514.txt
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-104927_fd0a8ec3-115b-40a4-b363-d7fdbe1def32/crash-20260704-110713-tug87422-run_afq-29c9eb60-533b-45aa-ae1d-022f8228b2df.txt
/ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-112044_7d8b95be-00d7-447c-92cc-a031a3d1855a/crash-20260704-113802-tug87422-run_afq-5a6de6a4-6480-4f56-b389-bac8c9803a9c.txt

## Scratch Crash and Result Files
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Count: 0

## Crash Context
Root: /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry
Status: present
Crash files: 4

### /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-090545_98e65209-5138-45bc-b88e-1883278c9ae0/crash-20260704-092323-tug87422-run_afq-d81be033-c96c-48fb-b6d3-9409bcdf097f.txt
1:Node: qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq
2:Working directory: /scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq
3-
4-Node inputs:
5-
6-bval_file = <undefined>
7-bvec_file = <undefined>
8-dwi_file = <undefined>
9-itk_file = <undefined>
10-kwargs = {'directions': 'prob', 'max_angle': 30.0, 'sphere': None, 'seed_mask': None, 'seed_threshold': 0, 'n_seeds': 1, 'random_seeds': False, 'rng_seed': None, 'stop_mask': None, 'stop_threshold': 0, 'step_size': 0.5, 'odf_model': 'CSD', 'tracker': 'local', 'nb_points': False, 'nb_streamlines': False, 'clip_edges': False, 'parallel_segmentation': {'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'}, 'prob_threshold': 0, 'dist_to_waypoint': None, 'rng': None, 'return_idx': False, 'filter_by_endpoints': True, 'dist_to_atlas': 4, 'save_intermediates': None, 'n_points': 100, 'clean_rounds': 5, 'distance_threshold': 3, 'length_threshold': 4, 'min_sl': 20, 'stat': 'mean', 'min_bval': None, 'max_bval': None, 'filter_b': True, 'b0_threshold': 50, 'robust_tensor_fitting': False, 'csd_response': None, 'csd_sh_order': None, 'csd_lambda_': 1, 'csd_tau': 0.1, 'gtol': 0.01, 'brain_mask_definition': None, 'bundle_info': None, 'reg_template_spec': 'mni_T1', 'mapping_definition': None, 'reg_subject_spec': 'power_map', 'profile_weights': 'gauss', 'scalars': ['dti_fa', 'dti_md'], 'import_tract': None, 'sbv_lims_bundles': [None, None], 'volume_opacity_bundles': 0.3, 'n_points_bundles': 40, 'sbv_lims_indiv': [None, None], 'volume_opacity_indiv': 0.3, 'n_points_indiv': 40, 'viz_backend_spec': 'plotly_no_gif', 'virtual_frame_buffer': False, 'omp_nthreads': 8}
11-mask_file = <undefined>
12-n_procs = 8
13-tck_file = <undefined>
14-
15-Traceback (most recent call last):
16-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
17-    result["result"] = node.run(updatehash=updatehash)
18-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
19-    result = self._run_interface(execute=True)
20-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
21-    return self._run_command(execute)
22-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
23-    raise NodeExecutionError(msg)
24:nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
25-
26-Traceback:
27-	Traceback (most recent call last):
28-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 340, in csd_params
29-	    csdf = csd_fit_model(
30-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 67, in _fit
31-	    return _model(gtab, data, response, sh_order, csd_fa_thr).fit(
32-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 56, in _model
33:	    raise CsdNanResponseError
34:	AFQ.models.csd.CsdNanResponseError
35-
36-	The above exception was the direct cause of the following exception:
37-
38-	Traceback (most recent call last):
39-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
40-	    runtime = self._run_interface(runtime)
41-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
42-	    myafq.export_all()
43-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
44-	    export_all_helper(self, xforms, indiv, viz)
45-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
46-	    api_afq_object.export("template_xform")
47-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
48-	    return self.wf_dict[section][attr_name]
49-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
50-	    self._run_node(self.plan.efferents[k])
51-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
52-	    if not found: res = node(self)
53-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
54-	    args.append(opts[name])
55-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
56-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
57-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
58-	    val = val()
59-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
60-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
61-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
62-	    return vs[-1][k]
63-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
64-	    self._run_node(self.plan.efferents[k])
65-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
66-	    if not found: res = node(self)
67-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
68-	    args.append(opts[name])
69-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
70-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
71-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
72-	    val = val()
73-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
74-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
75-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
76-	    return vs[-1][k]
77-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
78-	    self._run_node(self.plan.efferents[k])
79-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
80-	    if not found: res = node(self)
81-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
82-	    result = self.function(*args)
83-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 212, in get_reg_subject
84-	    reg_subject_spec = data_imap[filename_dict[reg_subject_spec]]
85-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
86-	    self._run_node(self.plan.efferents[k])
87-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
88-	    if not found: res = node(self)
89-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
90-	    args.append(opts[name])
91-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
92-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
93-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
94-	    val = val()
95-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
96-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
97-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
98-	    return vs[-1][k]
99-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
100-	    self._run_node(self.plan.efferents[k])
101-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
102-	    if not found: res = node(self)
103-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
104-	    result = self.function(*args)
105-	  File "<string>", line 2, in wrapper_has_args_func
106-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 146, in wrapper_as_file
107-	    gen, meta = func(*args[:og_arg_count], **kwargs)
108-	  File "<string>", line 2, in wrapper_has_args_func
109-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 216, in wrapper_as_img
110-	    data, meta = func(*args[:og_arg_count], **kwargs)
111-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 347, in csd_params
112:	    raise CsdNanResponseError(
113:	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
114-	<class 'nibabel.nifti1.Nifti1Image'>
115-	data shape (80, 98, 85, 145)
116-	affine:
117-	[[ -2.   0.   0.  79.]
118-	 [  0.  -2.   0.  80.]
119-	 [  0.   0.   2. -79.]
120-	 [  0.   0.   0.   1.]]
121-	metadata:
122-	<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
123-	sizeof_hdr      : 348
124-	data_type       : b''
125-	db_name         : b''
126-	extents         : 0
127-	session_error   : 0
128-	regular         : b''
129-	dim_info        : 0
130-	dim             : [  4  80  98  85 145   1   1   1]
131-	intent_p1       : 0.0
132-	intent_p2       : 0.0
133-	intent_p3       : 0.0
134-	intent_code     : none
135-	datatype        : float64
136-	bitpix          : 64
137-	slice_start     : 0
138-	pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
139-	vox_offset      : 0.0
140-	scl_slope       : nan
141-	scl_inter       : nan
142-	slice_end       : 0
143-	slice_code      : unknown
144-	xyzt_units      : 0
145-	cal_max         : 0.0
146-	cal_min         : 0.0
147-	slice_duration  : 0.0
148-	toffset         : 0.0
149-	glmax           : 0
150-	glmin           : 0
151-	descrip         : b''
152-	aux_file        : b''
153-	qform_code      : unknown
154-	sform_code      : aligned
155-	quatern_b       : 0.0
156-	quatern_c       : 0.0
157-	quatern_d       : 1.0
158-	qoffset_x       : 79.0
159-	qoffset_y       : 80.0
160-	qoffset_z       : -79.0
161-	srow_x          : [-2.  0.  0. 79.]
162-	srow_y          : [ 0. -2.  0. 80.]
163-	srow_z          : [  0.   0.   2. -79.]
164-	intent_name     : b''
165-	magic           : b'n+1'
166-	.
167-

### /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-093725_f5672d85-c46a-4a6e-9351-58b101ad5625/crash-20260704-095512-tug87422-run_afq-d849ec09-0bba-48b1-8097-f610ba1ea514.txt
1:Node: qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_csd-fa50.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq
2:Working directory: /scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_csd-fa50/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq
3-
4-Node inputs:
5-
6-bval_file = <undefined>
7-bvec_file = <undefined>
8-dwi_file = <undefined>
9-itk_file = <undefined>
10-kwargs = {'directions': 'prob', 'max_angle': 30.0, 'sphere': None, 'seed_mask': None, 'seed_threshold': 0, 'n_seeds': 1, 'random_seeds': False, 'rng_seed': None, 'stop_mask': None, 'stop_threshold': 0, 'step_size': 0.5, 'odf_model': 'CSD', 'tracker': 'local', 'nb_points': False, 'nb_streamlines': False, 'clip_edges': False, 'parallel_segmentation': {'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'}, 'prob_threshold': 0, 'dist_to_waypoint': None, 'rng': None, 'return_idx': False, 'filter_by_endpoints': True, 'dist_to_atlas': 4, 'save_intermediates': None, 'n_points': 100, 'clean_rounds': 5, 'distance_threshold': 3, 'length_threshold': 4, 'min_sl': 20, 'stat': 'mean', 'min_bval': None, 'max_bval': None, 'filter_b': True, 'b0_threshold': 50, 'robust_tensor_fitting': False, 'csd_response': None, 'csd_sh_order': None, 'csd_lambda_': 1, 'csd_tau': 0.1, 'csd_fa_thr': 0.5, 'gtol': 0.01, 'brain_mask_definition': None, 'bundle_info': None, 'reg_template_spec': 'mni_T1', 'mapping_definition': None, 'reg_subject_spec': 'power_map', 'profile_weights': 'gauss', 'scalars': ['dti_fa', 'dti_md'], 'import_tract': None, 'sbv_lims_bundles': [None, None], 'volume_opacity_bundles': 0.3, 'n_points_bundles': 40, 'sbv_lims_indiv': [None, None], 'volume_opacity_indiv': 0.3, 'n_points_indiv': 40, 'viz_backend_spec': 'plotly_no_gif', 'virtual_frame_buffer': False, 'omp_nthreads': 8}
11-mask_file = <undefined>
12-n_procs = 8
13-tck_file = <undefined>
14-
15-Traceback (most recent call last):
16-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
17-    result["result"] = node.run(updatehash=updatehash)
18-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
19-    result = self._run_interface(execute=True)
20-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
21-    return self._run_command(execute)
22-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
23-    raise NodeExecutionError(msg)
24:nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
25-
26-Traceback:
27-	Traceback (most recent call last):
28-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 340, in csd_params
29-	    csdf = csd_fit_model(
30-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 67, in _fit
31-	    return _model(gtab, data, response, sh_order, csd_fa_thr).fit(
32-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/models/csd.py", line 56, in _model
33:	    raise CsdNanResponseError
34:	AFQ.models.csd.CsdNanResponseError
35-
36-	The above exception was the direct cause of the following exception:
37-
38-	Traceback (most recent call last):
39-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
40-	    runtime = self._run_interface(runtime)
41-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
42-	    myafq.export_all()
43-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
44-	    export_all_helper(self, xforms, indiv, viz)
45-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
46-	    api_afq_object.export("template_xform")
47-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
48-	    return self.wf_dict[section][attr_name]
49-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
50-	    self._run_node(self.plan.efferents[k])
51-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
52-	    if not found: res = node(self)
53-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
54-	    args.append(opts[name])
55-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
56-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
57-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
58-	    val = val()
59-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
60-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
61-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
62-	    return vs[-1][k]
63-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
64-	    self._run_node(self.plan.efferents[k])
65-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
66-	    if not found: res = node(self)
67-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
68-	    args.append(opts[name])
69-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
70-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
71-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
72-	    val = val()
73-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
74-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
75-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
76-	    return vs[-1][k]
77-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
78-	    self._run_node(self.plan.efferents[k])
79-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
80-	    if not found: res = node(self)
81-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
82-	    result = self.function(*args)
83-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 212, in get_reg_subject
84-	    reg_subject_spec = data_imap[filename_dict[reg_subject_spec]]
85-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
86-	    self._run_node(self.plan.efferents[k])
87-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
88-	    if not found: res = node(self)
89-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
90-	    args.append(opts[name])
91-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
92-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
93-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
94-	    val = val()
95-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
96-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
97-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
98-	    return vs[-1][k]
99-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
100-	    self._run_node(self.plan.efferents[k])
101-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
102-	    if not found: res = node(self)
103-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
104-	    result = self.function(*args)
105-	  File "<string>", line 2, in wrapper_has_args_func
106-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 146, in wrapper_as_file
107-	    gen, meta = func(*args[:og_arg_count], **kwargs)
108-	  File "<string>", line 2, in wrapper_has_args_func
109-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/decorators.py", line 216, in wrapper_as_img
110-	    data, meta = func(*args[:og_arg_count], **kwargs)
111-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 347, in csd_params
112:	    raise CsdNanResponseError(
113:	AFQ.models.csd.CsdNanResponseError: Could not compute CSD response function for file: 
114-	<class 'nibabel.nifti1.Nifti1Image'>
115-	data shape (80, 98, 85, 145)
116-	affine:
117-	[[ -2.   0.   0.  79.]
118-	 [  0.  -2.   0.  80.]
119-	 [  0.   0.   2. -79.]
120-	 [  0.   0.   0.   1.]]
121-	metadata:
122-	<class 'nibabel.nifti1.Nifti1Header'> object, endian='<'
123-	sizeof_hdr      : 348
124-	data_type       : b''
125-	db_name         : b''
126-	extents         : 0
127-	session_error   : 0
128-	regular         : b''
129-	dim_info        : 0
130-	dim             : [  4  80  98  85 145   1   1   1]
131-	intent_p1       : 0.0
132-	intent_p2       : 0.0
133-	intent_p3       : 0.0
134-	intent_code     : none
135-	datatype        : float64
136-	bitpix          : 64
137-	slice_start     : 0
138-	pixdim          : [1. 2. 2. 2. 1. 1. 1. 1.]
139-	vox_offset      : 0.0
140-	scl_slope       : nan
141-	scl_inter       : nan
142-	slice_end       : 0
143-	slice_code      : unknown
144-	xyzt_units      : 0
145-	cal_max         : 0.0
146-	cal_min         : 0.0
147-	slice_duration  : 0.0
148-	toffset         : 0.0
149-	glmax           : 0
150-	glmin           : 0
151-	descrip         : b''
152-	aux_file        : b''
153-	qform_code      : unknown
154-	sform_code      : aligned
155-	quatern_b       : 0.0
156-	quatern_c       : 0.0
157-	quatern_d       : 1.0
158-	qoffset_x       : 79.0
159-	qoffset_y       : 80.0
160-	qoffset_z       : -79.0
161-	srow_x          : [-2.  0.  0. 79.]
162-	srow_y          : [ 0. -2.  0. 80.]
163-	srow_z          : [  0.   0.   2. -79.]
164-	intent_name     : b''
165-	magic           : b'n+1'
166-	.
167-

### /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-104927_fd0a8ec3-115b-40a4-b363-d7fdbe1def32/crash-20260704-110713-tug87422-run_afq-29c9eb60-533b-45aa-ae1d-022f8228b2df.txt
1:Node: qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq
2:Working directory: /scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq
3-
4-Node inputs:
5-
6-bval_file = <undefined>
7-bvec_file = <undefined>
8-dwi_file = <undefined>
9-itk_file = <undefined>
10-kwargs = {'directions': 'prob', 'max_angle': 30.0, 'sphere': None, 'seed_mask': None, 'seed_threshold': 0, 'n_seeds': 1, 'random_seeds': False, 'rng_seed': None, 'stop_mask': None, 'stop_threshold': 0, 'step_size': 0.5, 'odf_model': 'DTI', 'tracker': 'local', 'nb_points': False, 'nb_streamlines': False, 'clip_edges': False, 'parallel_segmentation': {'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'}, 'prob_threshold': 0, 'dist_to_waypoint': None, 'rng': None, 'return_idx': False, 'filter_by_endpoints': True, 'dist_to_atlas': 4, 'save_intermediates': None, 'n_points': 100, 'clean_rounds': 5, 'distance_threshold': 3, 'length_threshold': 4, 'min_sl': 20, 'stat': 'mean', 'min_bval': None, 'max_bval': None, 'filter_b': True, 'b0_threshold': 50, 'robust_tensor_fitting': False, 'gtol': 0.01, 'brain_mask_definition': None, 'bundle_info': None, 'reg_template_spec': 'mni_T1', 'mapping_definition': None, 'reg_subject_spec': 'dti_fa', 'profile_weights': 'gauss', 'scalars': ['dti_fa', 'dti_md'], 'import_tract': None, 'sbv_lims_bundles': [None, None], 'volume_opacity_bundles': 0.3, 'n_points_bundles': 40, 'sbv_lims_indiv': [None, None], 'volume_opacity_indiv': 0.3, 'n_points_indiv': 40, 'viz_backend_spec': 'plotly_no_gif', 'virtual_frame_buffer': False, 'omp_nthreads': 8}
11-mask_file = <undefined>
12-n_procs = 8
13-tck_file = <undefined>
14-
15-Traceback (most recent call last):
16-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
17-    result["result"] = node.run(updatehash=updatehash)
18-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
19-    result = self._run_interface(execute=True)
20-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
21-    return self._run_command(execute)
22-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
23-    raise NodeExecutionError(msg)
24:nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
25-
26-Traceback:
27-	Traceback (most recent call last):
28-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 101, in load
29-	    stat_result = os.stat(filename)
30-	FileNotFoundError: [Errno 2] No such file or directory: 'dti_fa'
31-
32-	During handling of the above exception, another exception occurred:
33-
34-	Traceback (most recent call last):
35-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
36-	    runtime = self._run_interface(runtime)
37-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 113, in _run_interface
38-	    myafq.export_all()
39-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 201, in export_all
40-	    export_all_helper(self, xforms, indiv, viz)
41-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/utils.py", line 121, in export_all_helper
42-	    api_afq_object.export("template_xform")
43-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 155, in export
44-	    return self.wf_dict[section][attr_name]
45-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
46-	    self._run_node(self.plan.efferents[k])
47-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
48-	    if not found: res = node(self)
49-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
50-	    args.append(opts[name])
51-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
52-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
53-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
54-	    val = val()
55-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
56-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
57-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
58-	    return vs[-1][k]
59-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
60-	    self._run_node(self.plan.efferents[k])
61-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
62-	    if not found: res = node(self)
63-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 90, in __call__
64-	    args.append(opts[name])
65-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 888, in __getitem__
66-	    return self._examine_val(k, ps.PMap.__getitem__(self, k))
67-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 884, in _examine_val
68-	    val = val()
69-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1163, in <lambda>
70-	    def curry_choice(k, args): return lambda:choose_fn(k, args)
71-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/util.py", line 1132, in _choose_last
72-	    return vs[-1][k]
73-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 470, in __getitem__
74-	    self._run_node(self.plan.efferents[k])
75-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 534, in _run_node
76-	    if not found: res = node(self)
77-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/pimms/calculation.py", line 91, in __call__
78-	    result = self.function(*args)
79-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/mapping.py", line 214, in get_reg_subject
80-	    img = nib.load(reg_subject_spec)
81-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nibabel/loadsave.py", line 103, in load
82-	    raise FileNotFoundError(f"No such file or no access: '{filename}'")
83-	FileNotFoundError: No such file or no access: 'dti_fa'
84-

### /ZPOOL/data/projects/rf1-dwi/derivatives/qsirecon-tractometry/sub-10317/log/20260704-112044_7d8b95be-00d7-447c-92cc-a031a3d1855a/crash-20260704-113802-tug87422-run_afq-5a6de6a4-6480-4f56-b389-bac8c9803a9c.txt
1:Node: qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq
2:Working directory: /scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq
3-
4-Node inputs:
5-
6-bval_file = <undefined>
7-bvec_file = <undefined>
8-dwi_file = <undefined>
9-itk_file = <undefined>
10-kwargs = {'directions': 'prob', 'max_angle': 30.0, 'sphere': None, 'seed_mask': None, 'seed_threshold': 0, 'n_seeds': 1, 'random_seeds': False, 'rng_seed': None, 'stop_mask': None, 'stop_threshold': 0, 'step_size': 0.5, 'odf_model': 'DTI', 'tracker': 'local', 'nb_points': False, 'nb_streamlines': False, 'clip_edges': False, 'parallel_segmentation': {'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'}, 'prob_threshold': 0, 'dist_to_waypoint': None, 'rng': None, 'return_idx': False, 'filter_by_endpoints': True, 'dist_to_atlas': 4, 'save_intermediates': None, 'n_points': 100, 'clean_rounds': 5, 'distance_threshold': 3, 'length_threshold': 4, 'min_sl': 20, 'stat': 'mean', 'min_bval': None, 'max_bval': None, 'filter_b': True, 'b0_threshold': 50, 'robust_tensor_fitting': False, 'gtol': 0.01, 'brain_mask_definition': None, 'bundle_info': None, 'reg_template_spec': 'mni_T1', 'mapping_definition': None, 'reg_subject_spec': 'power_map', 'profile_weights': 'gauss', 'scalars': [], 'import_tract': None, 'sbv_lims_bundles': [None, None], 'volume_opacity_bundles': 0.3, 'n_points_bundles': 40, 'sbv_lims_indiv': [None, None], 'volume_opacity_indiv': 0.3, 'n_points_indiv': 40, 'viz_backend_spec': 'plotly_no_gif', 'virtual_frame_buffer': False, 'omp_nthreads': 8}
11-mask_file = <undefined>
12-n_procs = 8
13-tck_file = <undefined>
14-
15-Traceback (most recent call last):
16-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/plugins/multiproc.py", line 66, in run_node
17-    result["result"] = node.run(updatehash=updatehash)
18-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 525, in run
19-    result = self._run_interface(execute=True)
20-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 643, in _run_interface
21-    return self._run_command(execute)
22-  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 769, in _run_command
23-    raise NodeExecutionError(msg)
24:nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
25-
26-Traceback:
27-	Traceback (most recent call last):
28-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
29-	    runtime = self._run_interface(runtime)
30-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 101, in _run_interface
31-	    myafq = ParticipantAFQ(
32-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 99, in __init__
33-	    self.make_workflow()
34-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 118, in make_workflow
35-	    "data": get_data_plan(self.kwargs),
36-	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 1166, in get_data_plan
37-	    kwargs["scalars"][0], (str, Definition))):
38-	IndexError: list index out of range
39-

## Crash Context
Root: /ZPOOL/data/scratch/tug87422/qsirecon-tractometry-sub-10953
Status: missing
Crash files: 0

COMMAND EXIT: 0
```
