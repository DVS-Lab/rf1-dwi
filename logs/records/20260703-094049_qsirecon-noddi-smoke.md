# Run Record: qsirecon-noddi-smoke

- Timestamp: 20260703-094049
- Branch: codex/linux2-qsiprep-test
- Commit: 276d27c
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260703-094049_qsirecon-noddi-smoke.log`
- Command exit: 1
- Check exit: skipped
- Summary: CHECK SKIPPED: command failed, so post-run check was not launched.

## Command

```bash
bash run_qsirecon-noddi.sh --sublist ../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt --jobs 2 
```

## Check

```bash
bash check_qsirecon-noddi.sh --sublist ../logs/dwi-smoke-test/sublist-qsiprep-smoke.txt 
```

## Error Lines

```text
260703-09:41:49,918 nipype.workflow ERROR:
Traceback (most recent call last):
    raise NodeExecutionError(msg)
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node recon_noddi.
Traceback:
	Traceback (most recent call last):
	  File "/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/amico/util.py", line 47, in ERROR
ERROR:nipype.workflow:Saving crash info to /base/derivatives/qsirecon-noddi/sub-10953/log/20260703-094054_10320cec-105e-43c6-880d-5f22be476c32/crash-20260703-094149-tug87422-recon_noddi-5a344731-8185-4aaa-a29a-418331c48ab5.txt
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
INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort
CHECK SKIPPED: command failed, so post-run check was not launched.
```

## Log Tail

```text
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


260703-09:41:49,928 nipype.workflow CRITICAL:
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


260703-09:41:49,929 nipype.workflow CRITICAL:
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


INFO:    Cleanup error: while stopping driver for /var/lib/apptainer/mnt/session/final: fuse-overlayfs exited: fuse: reading device: Software caused connection abort

COMMAND EXIT: 1

CHECK SKIPPED: command failed, so post-run check was not launched.
```
