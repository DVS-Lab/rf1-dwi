# Run Record: qsirecon-tractometry-smoke-one-dti-powermap-scalars

- Timestamp: 20260704-142245
- Branch: codex/linux2-qsiprep-test
- Commit: 441a416
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-142245_qsirecon-tractometry-smoke-one-dti-powermap-scalars.log`
- Command exit: 1
- Check exit: none
- Summary: COMMAND FAILED: exit 1; no check command was provided.

## Command

```bash
bash run_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 --overwrite --recon-spec /base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-powermap-scalars.yaml 
```

## Error Lines

```text
	    if not found: res = node(self)
	    if not found: res = node(self)
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
```

## Log Tail

```text
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


260704-14:40:12,936 nipype.workflow INFO:
	 [Node] Finished "tck_sift2", elapsed time 31.95167s.

COMMAND EXIT: 1
```
