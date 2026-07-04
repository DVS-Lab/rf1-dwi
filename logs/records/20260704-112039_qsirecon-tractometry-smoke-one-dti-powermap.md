# Run Record: qsirecon-tractometry-smoke-one-dti-powermap

- Timestamp: 20260704-112039
- Branch: codex/linux2-qsiprep-test
- Commit: 4d42eba
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-112039_qsirecon-tractometry-smoke-one-dti-powermap.log`
- Command exit: 1
- Check exit: 0
- Summary: No CHECK PASSED/FAILED line found.

## Command

```bash
bash run_qsirecon-tractometry.sh --sublist ../logs/dwi-smoke-test/sublist-qsirecon-one.txt --jobs 1 --overwrite --recon-spec /base/code/recon_specs/mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.yaml 
```

## Error Lines

```text
WARNING optional MNI-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5
WARNING optional orig-to-T1w transform not found: /ZPOOL/data/projects/rf1-dwi/derivatives/qsiprep/sub-10317/**/anat/*from-orig_to-T1w_mode-image_xfm.txt
           * BIDS dataset path: /base/derivatives/qsiprep.
           * BIDS dataset path: /base/derivatives/qsiprep.
	 [Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
WARNING:nipype.workflow:[Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
260704-11:38:02,611 nipype.workflow ERROR:
	 Node run_afq failed to run on host CLA19787.tu.temple.edu.
ERROR:nipype.workflow:Node run_afq failed to run on host CLA19787.tu.temple.edu.
260704-11:38:02,615 nipype.workflow ERROR:
Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	IndexError: list index out of range
ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-112044_7d8b95be-00d7-447c-92cc-a031a3d1855a/crash-20260704-113802-tug87422-run_afq-5a6de6a4-6480-4f56-b389-bac8c9803a9c.txt
Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	IndexError: list index out of range
	 QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	IndexError: list index out of range
CRITICAL:nipype.workflow:QSIRecon failed: Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node run_afq.
Traceback:
	Traceback (most recent call last):
	IndexError: list index out of range
```

## Log Tail

```text
	 Storing result file without outputs
WARNING:nipype.workflow:Storing result file without outputs
260704-11:38:01,948 nipype.workflow WARNING:
	 [Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
WARNING:nipype.workflow:[Node] Error on "qsirecon_26_0_wf.sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map.sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf.pyafq_tractometry.run_afq" (/scratch/qsirecon_26_0_wf/sub-10317_mrtrix_multishell_msmt_pyafq_tractometry_dti-power-map/sub_10317_ses_01_space_ACPC_desc_preproc_recon_wf/pyafq_tractometry/run_afq)
260704-11:38:02,611 nipype.workflow ERROR:
	 Node run_afq failed to run on host CLA19787.tu.temple.edu.
ERROR:nipype.workflow:Node run_afq failed to run on host CLA19787.tu.temple.edu.
260704-11:38:02,615 nipype.workflow ERROR:
	 Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-112044_7d8b95be-00d7-447c-92cc-a031a3d1855a/crash-20260704-113802-tug87422-run_afq-5a6de6a4-6480-4f56-b389-bac8c9803a9c.txt
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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 101, in _run_interface
	    myafq = ParticipantAFQ(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 99, in __init__
	    self.make_workflow()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 118, in make_workflow
	    "data": get_data_plan(self.kwargs),
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 1166, in get_data_plan
	    kwargs["scalars"][0], (str, Definition))):
	IndexError: list index out of range


ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-tractometry/sub-10317/log/20260704-112044_7d8b95be-00d7-447c-92cc-a031a3d1855a/crash-20260704-113802-tug87422-run_afq-5a6de6a4-6480-4f56-b389-bac8c9803a9c.txt
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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 101, in _run_interface
	    myafq = ParticipantAFQ(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 99, in __init__
	    self.make_workflow()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 118, in make_workflow
	    "data": get_data_plan(self.kwargs),
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 1166, in get_data_plan
	    kwargs["scalars"][0], (str, Definition))):
	IndexError: list index out of range


260704-11:38:02,629 nipype.workflow CRITICAL:
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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 101, in _run_interface
	    myafq = ParticipantAFQ(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 99, in __init__
	    self.make_workflow()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 118, in make_workflow
	    "data": get_data_plan(self.kwargs),
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 1166, in get_data_plan
	    kwargs["scalars"][0], (str, Definition))):
	IndexError: list index out of range


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
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 401, in run
	    runtime = self._run_interface(runtime)
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py", line 101, in _run_interface
	    myafq = ParticipantAFQ(
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 99, in __init__
	    self.make_workflow()
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/api/participant.py", line 118, in make_workflow
	    "data": get_data_plan(self.kwargs),
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py", line 1166, in get_data_plan
	    kwargs["scalars"][0], (str, Definition))):
	IndexError: list index out of range


260704-11:38:05,185 nipype.workflow INFO:
	 [Node] Finished "tck_sift2", elapsed time 31.958104s.

COMMAND EXIT: 1
```
