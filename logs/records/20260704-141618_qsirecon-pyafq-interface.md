# Run Record: qsirecon-pyafq-interface

- Timestamp: 20260704-141618
- Branch: codex/linux2-qsiprep-test
- Commit: 0879fec
- Host: CLA19787.tu.temple.edu
- User: tug87422
- Working directory: `/ZPOOL/data/projects/rf1-dwi/code`
- Raw log: `/ZPOOL/data/projects/rf1-dwi/logs/runs/20260704-141618_qsirecon-pyafq-interface.log`
- Command exit: 0
- Check exit: none
- Summary: COMMAND COMPLETED: no check command provided.

## Command

```bash
bash debug_qsirecon_pyafq_interface.sh 
```

## Full Log

```text
RUN START: 20260704-141618
PROJECT_ROOT: /ZPOOL/data/projects/rf1-dwi
GIT: codex/linux2-qsiprep-test 0879fec
HOST: CLA19787.tu.temple.edu
USER: tug87422
PWD: /ZPOOL/data/projects/rf1-dwi/code
COMMAND: bash debug_qsirecon_pyafq_interface.sh 

QSIRecon PyAFQ interface diagnostic
Host: CLA19787.tu.temple.edu
User: tug87422
Container runtime: singularity
QSIRecon image: /ZPOOL/data/tools/qsirecon-26.0.0.sif

WARNING:py.warnings:WARNING: 'enablePackrat' deprecated - use 'enable_packrat'
WARNING:py.warnings:WARNING: 'enablePackrat' deprecated - use 'enable_packrat'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'parseString' deprecated - use 'parse_string'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: 'resetCache' deprecated - use 'reset_cache'
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.
WARNING:py.warnings:WARNING: distutils Version classes are deprecated. Use packaging.version instead.

## Versions and Paths
Python executable: /app/.pixi/envs/qsirecon/bin/python
Python version: 3.10.19 | packaged by conda-forge | (main, Jan 26 2026, 23:45:08) [GCC 14.3.0]
QSIRecon distribution: qsirecon 26.0.0
QSIRecon __version__: 26.0.0
QSIRecon package: /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/__init__.py
PyAFQ distribution: pyAFQ 2.0
AFQ __version__: 2.0
AFQ package: /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/__init__.py
QSIRecon PyAFQ interface: /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/interfaces/pyafq.py
AFQ.tasks.data: /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/AFQ/tasks/data.py

## qsirecon.interfaces.pyafq source
# emacs: -*- mode: python; py-indent-offset: 4; indent-tabs-mode: nil -*-
# vi: set ft=python sts=4 ts=4 sw=4 et:
"""
Interface for running a PyAFQ workflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"""

import os
import os.path as op

from AFQ.api.participant import ParticipantAFQ
from AFQ.definitions.image import ImageFile

# from AFQ.definitions.mapping import ItkMap
from nipype import logging
from nipype.interfaces.base import (
    BaseInterfaceInputSpec,
    File,
    SimpleInterface,
    TraitedSpec,
    isdefined,
    traits,
)
from nipype.utils.filemanip import fname_presuffix

LOGGER = logging.getLogger('nipype.interface')


class PyAFQInputSpec(BaseInterfaceInputSpec):
    bval_file = File(exists=True, mandatory=True)
    bvec_file = File(exists=True, mandatory=True)
    dwi_file = File(exists=True, mandatory=True)
    mask_file = File(exists=True, mandatory=True)
    itk_file = File(exists=True, mandatory=True)
    kwargs = traits.Dict(exists=True, mandatory=True)
    tck_file = traits.Either(None, File(exists=True))
    n_procs = traits.Int(1, usedefault=True)


class PyAFQOutputSpec(TraitedSpec):
    afq_dir = traits.Directory()


class PyAFQRecon(SimpleInterface):
    input_spec = PyAFQInputSpec
    output_spec = PyAFQOutputSpec

    def _run_interface(self, runtime):

        # shim the expected inputs
        shim_dir = op.join(runtime.cwd, 'study/subject')
        os.makedirs(shim_dir)
        bval_file = fname_presuffix(self.inputs.bval_file, newpath=shim_dir)
        bvec_file = fname_presuffix(self.inputs.bvec_file, newpath=shim_dir)
        dwi_file = fname_presuffix(self.inputs.dwi_file, newpath=shim_dir)
        mask_file = fname_presuffix(self.inputs.mask_file, newpath=shim_dir)
        itk_file = fname_presuffix(self.inputs.itk_file, newpath=shim_dir)
        os.symlink(self.inputs.bval_file, bval_file)
        os.symlink(self.inputs.bvec_file, bvec_file)
        os.symlink(self.inputs.dwi_file, dwi_file)
        os.symlink(self.inputs.mask_file, mask_file)
        os.symlink(self.inputs.itk_file, itk_file)

        kwargs = self.inputs.kwargs

        if self.inputs.tck_file and isdefined(self.inputs.tck_file):
            tck_file = fname_presuffix(self.inputs.tck_file, newpath=shim_dir)
            os.symlink(self.inputs.tck_file, tck_file)
        else:
            tck_file = None
        brain_mask_definition = ImageFile(path=mask_file)
        # itk_map = ItkMap(warp_path=itk_file)

        if tck_file is None:
            tck_file = kwargs['import_tract']
        kwargs.pop('import_tract', None)
        if brain_mask_definition is None:
            brain_mask_definition = kwargs['brain_mask_definition']
        kwargs.pop('brain_mask_definition', None)

        # if "parallel_segmentation" in kwargs:
        #     if (
        #         "n_jobs" not in kwargs["parallel_segmentation"]
        #         or kwargs["parallel_segmentation"]["n_jobs"] == -1
        #     ):
        #         kwargs["parallel_segmentation"]["n_jobs"] = self.inputs.kwargs["omp_nthreads"]
        # else:
        #     kwargs["parallel_segmentation"] = {}
        #     kwargs["parallel_segmentation"]["n_jobs"] = self.inputs.kwargs["omp_nthreads"]

        if self.inputs.n_procs > 1:
            kwargs['parallel_segmentation']['n_jobs'] = self.inputs.n_procs
        else:
            kwargs['parallel_segmentation'] = {}
            kwargs['parallel_segmentation']['n_jobs'] = self.inputs.n_procs

        output_dir = shim_dir + '/PYAFQ/'
        os.makedirs(output_dir, exist_ok=True)
        myafq = ParticipantAFQ(
            dwi_file,
            bval_file,
            bvec_file,
            output_dir,
            import_tract=tck_file,
            brain_mask_definition=brain_mask_definition,
            # mapping_definition=itk_map,
            **kwargs,
        )

        if 'export' not in kwargs or kwargs['export'] == 'all':
            myafq.export_all()
        else:
            myafq.export(kwargs['export'])

        self._results['afq_dir'] = output_dir

        return runtime

QSIRecon PyAFQ workflow builder: /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/workflows/recon/pyafq.py

## qsirecon.workflows.recon.pyafq source
"""
PyAFQ tractometry and visualization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"""

import AFQ
import AFQ.utils.bin as afb
import nipype.interfaces.utility as niu
import nipype.pipeline.engine as pe

from ... import config
from ...interfaces.bids import ReconDerivativesDataSink
from ...interfaces.interchange import recon_workflow_input_fields
from ...interfaces.pyafq import PyAFQRecon
from ...utils.bids import clean_datasinks


def _parse_qsirecon_params_dict(params_dict):
    arg_dict = afb.func_dict_to_arg_dict()
    kwargs = {}

    special_args = {
        'CLEANING': 'clean_params',
        'SEGMENTATION': 'segmentation_params',
        'TRACTOGRAPHY': 'tracking_params',
    }

    for section, args in arg_dict.items():
        if section == 'AFQ_desc':
            continue
        for arg, arg_info in args.items():
            if arg in special_args.keys():
                kwargs[special_args[arg]] = {}
                for actual_arg in arg_info.keys():
                    if actual_arg in params_dict:
                        kwargs[special_args[arg]][actual_arg] = afb.toml_to_val(
                            params_dict[actual_arg]
                        )
            else:
                if arg in params_dict:
                    kwargs[arg] = afb.toml_to_val(params_dict[arg])

    for ignore_param in afb.qsi_prep_ignore_params:
        kwargs.pop(ignore_param, None)

    return kwargs


def init_pyafq_wf(inputs_dict, name='afq', qsirecon_suffix='', params={}):
    """Run PyAFQ on some qsirecon outputs

    Inputs

        *qsirecon outputs*

    Outputs
        profiles_csv
            CSV file containing the tract profiles generated by pyAFQ.

    """
    workflow = pe.Workflow(name=name)
    suffix_str = f' (outputs written to qsirecon-{qsirecon_suffix})' if qsirecon_suffix else ''
    workflow.__desc__ = (
        f'\n\n#### PyAFQ{suffix_str}\n\n'
        f'PyAFQ run on version {AFQ.__version__} with the following configuration: '
    )

    inputnode = pe.Node(
        niu.IdentityInterface(fields=recon_workflow_input_fields + ['tck_file']), name='inputnode'
    )
    outputnode = pe.Node(
        niu.IdentityInterface(fields=['afq_dir', 'recon_scalars']), name='outputnode'
    )
    outputnode.inputs.recon_scalars = []
    omp_nthreads = config.nipype.omp_nthreads
    kwargs = _parse_qsirecon_params_dict(params)
    kwargs['omp_nthreads'] = config.nipype.omp_nthreads

    workflow.__desc__ += f'{kwargs!s}.'

    run_afq = pe.Node(
        PyAFQRecon(kwargs=kwargs, n_procs=omp_nthreads), name='run_afq', n_procs=omp_nthreads
    )

    if params.get('use_external_tracking', False):
        workflow.connect([(inputnode, run_afq, [('tck_file', 'tck_file')])])

    workflow.connect([
        (inputnode, run_afq, [
            ('dwi_file', 'dwi_file'),
            ('bval_file', 'bval_file'),
            ('bvec_file', 'bvec_file'),
            ('dwi_mask', 'mask_file'),
            ('template_to_acpc_xfm', 'itk_file'),
        ]),
        (run_afq, outputnode, [('afq_dir', 'afq_dir')]),
    ])  # fmt:skip

    if qsirecon_suffix:
        # Save the output in the outputs directory
        ds_afq = pe.Node(
            ReconDerivativesDataSink(
                qsirecon_suffix=qsirecon_suffix,
                extension='.nii.gz',
                use_ext=False,
                dismiss_entities=['desc'],
            ),
            name='ds_' + name,
            run_without_submitting=True,
        )
        workflow.connect(run_afq, 'afq_dir', ds_afq, 'in_file')

    return clean_datasinks(workflow, qsirecon_suffix)


## AFQ.tasks.data.get_data_plan source
def get_data_plan(kwargs):
    if "scalars" in kwargs and not (
        isinstance(kwargs["scalars"], list) and isinstance(
            kwargs["scalars"][0], (str, Definition))):
        raise TypeError(
            "scalars must be a list of "
            "strings/scalar definitions")

    data_tasks = with_name([
        get_data_gtab, b0, b0_mask, brain_mask,
        dti_fit, dki_fit, fwdti_fit, anisotropic_power_map,
        csd_anisotropic_index,
        dti_fa, dti_lt, dti_cfa, dti_pdd, dti_md, dki_kt, dki_lt, dki_fa,
        gq, gq_pmap, gq_ai, opdt_params, opdt_pmap, opdt_ai,
        csa_params, csa_pmap, csa_ai,
        fwdti_fa, fwdti_md, fwdti_fwf,
        msdki_fit, msdki_params, msdki_msd, msdki_msk,
        dki_md, dki_awf, dki_mk, dki_kfa, dki_ga, dki_rd,
        dti_ga, dti_rd, dti_ad,
        dki_ad, dki_rk, dki_ak, dti_params, dki_params, fwdti_params,
        rumba_fit, rumba_params, rumba_model,
        rumba_f_csf, rumba_f_gm, rumba_f_wm,
        csd_params, get_bundle_dict])

    if "scalars" not in kwargs:
        bvals, _ = read_bvals_bvecs(kwargs["bval_file"], kwargs["bvec_file"])
        if len(dpg.unique_bvals_magnitude(bvals)) > 2:
            kwargs["scalars"] = [
                "dki_fa", "dki_md",
                "dki_kfa", "dki_mk"]
        else:
            kwargs["scalars"] = [
                "dti_fa", "dti_md"]
    else:
        scalars = []
        for scalar in kwargs["scalars"]:
            if isinstance(scalar, str):
                scalars.append(scalar.lower())
            else:
                scalars.append(scalar)
        kwargs["scalars"] = scalars

    bm_def = kwargs.get(
        "brain_mask_definition", None)
    if bm_def is not None:
        if not isinstance(bm_def, Definition):
            raise TypeError(
                "brain_mask_definition must be a Definition")
        data_tasks["brain_mask_res"] = pimms.calc("brain_mask")(
            as_file(
                suffix=(
                    f'_desc-{str_to_desc(bm_def.get_name())}'
                    '_mask.nii.gz'),
                subfolder="models")(bm_def.get_image_getter("data")))

    return pimms.plan(**data_tasks)


## AFQ.utils.bin.toml_to_val source
def toml_to_val(t):
    if isinstance(t, str) and len(t) < 1:
        return None
    elif isinstance(t, list):
        ls = []
        for e in t:
            ls.append(toml_to_val(e))
        return ls
    elif isinstance(t, str) and t[0] == '[':
        return eval(t)
    elif isinstance(t, str) and t[0] == '{':
        return eval(t)  # interpret as dictionary
    elif isinstance(t, str) and (
            "Image" in t or "Map" in t or "Dict" in t or "_bd(" in t):
        try:
            definition_or_dict = eval(t)
        except NameError:
            return t
        if isinstance(definition_or_dict, Definition):
            return definition_or_dict
        elif isinstance(definition_or_dict, BundleDict):
            return definition_or_dict
        else:
            return t
    else:
        return t


## AFQ.utils.bin.toml_to_val examples
"['dti_fa', 'dti_md']" -> ['dti_fa', 'dti_md'] (list)
'[]' -> [] (list)
'dti_fa' -> 'dti_fa' (str)
"{'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'}" -> {'n_jobs': -1, 'engine': 'joblib', 'backend': 'loky'} (dict)

## Scalar Format Inference From Installed Source
- Installed PyAFQ indexes kwargs['scalars'][0], so an empty scalars list is invalid.
- Installed PyAFQ expects scalars to be a list when the scalars key is provided.
- The first scalar entry is checked against string or Definition-like scalar definitions.
- Treat these notes as direct source-derived diagnostics, not a replacement for a test run.

## QSIRecon YAML Specs Under pipeline/data Paths
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/io_spec.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/amico_noddi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/brainsuite_3dshore.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/csdsi_3dshore.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dipy_dki.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dipy_mapmri.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dsistudio_autotrack.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dsistudio_gqi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/mrtrix_anat.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/mrtrix_dwi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/reorient_fslstd.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/ss3t_fod_autotrack.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/tortoise.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/TORTOISE.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/abcd_recon.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/amico_noddi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/csdsi_3dshore.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dipy_3dshore.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dipy_dki.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dipy_mapmri.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dsi_studio_autotrack.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dsi_studio_gqi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/hbcd_scalar_maps.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_ACT-fast.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_ACT-hsvs.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_noACT.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_noACT_apply.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_noACT_estimate.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_pyafq_tractometry.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_singleshell_ss3t_ACT-fast.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_singleshell_ss3t_ACT-hsvs.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_singleshell_ss3t_noACT.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/multishell_scalarfest.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/pyafq_tractometry.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/reorient_fslstd.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/ss3t_fod_autotrack.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/test_scalar_maps.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/test_workflow.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/amico_noddi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/brainsuite_3dshore.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/dipy_dki.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/dipy_mapmri.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/dsistudio_gqi.yaml
/app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/tortoise.yaml

## Candidate Built-In Specs Mentioning DTI, DKI, MAPMRI, PyAFQ, Tractometry, or Scalars

### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/brainsuite_3dshore.yaml
alpha_image:
    metadata:
        Description: alpha used when fitting in each voxel
cnr_image:
    metadata:
        Description: Contrast to noise ratio for 3dSHORE fit
lapnorm_file:
    bids:
        model: 3dSHORE
        param: lapnorm
    metadata:
        Description: Laplacian norm from regularized MAPMRI (MAPL)
mapcoeffs_file:
    bids:
        model: 3dSHORE
        param: mapcoeffs
    metadata:
        Description: MAPMRI coefficients
msd_file:
    bids:
        model: 3dSHORE
        param: MSD
    metadata:
        Description: mean square displacement from MAPMRI
ng_file:
    bids:
        model: 3dSHORE
        param: NG
    metadata:
        Description: Non-Gaussianity from MAPMRI
ngpar_file:
    bids:
        model: 3dSHORE
        param: NGpar
    metadata:
        Description: Non-Gaussianity parallel from MAPMRI
ngperp_file:
    bids:
        model: 3dSHORE
        param: NGperp
    metadata:
        Description: Non-Gaussianity perpendicular from MAPMRI
qiv_file:
    bids:
        model: 3dSHORE
        param: QIV
    metadata:
        Description: q-space inverse variance from MAPMRI
r2_image:
    metadata:
        Description: r^2 of the 3dSHORE fit
regularization_image:
    metadata:
        Description: regularization of the 3dSHORE fit
rtap_file:
    bids:
        model: 3dSHORE
        param: RTAP
    metadata:
        Description: Return to axis probability from MAPMRI
rtop_file:
    bids:
        model: 3dSHORE
        param: RTOP
    metadata:
        Description: Return to origin probability from MAPMRI
rtpp_file:
    bids:
        model: 3dSHORE
        param: RTPP
    metadata:
        Description: Return to plane probability from MAPMRI


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/csdsi_3dshore.yaml
scalarstats:
    bids:
        suffix: scalarstats
        extension: tsv
    metadata:
        Description: |
            MAPMRI scalars summarized within WM bundles. The name of the method
            used to create the bundles is specified after ``bundles-``.


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dipy_dki.yaml
scalarstats:
    bids:
        suffix: scalarstats
        extension: tsv
    metadata:
        Description: |
            DKI scalars summarized within WM bundles. The name of the method
            used to create the bundles is specified after ``bundles-``.


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dipy_mapmri.yaml
scalarstats:
    bids:
        suffix: scalarstats
        extension: tsv
    metadata:
        Description: |
            MAPMRI scalars summarized within WM bundles. The name of the method
            used to create the bundles is specified after ``bundles-``.
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/dsistudio_autotrack.yaml
bundles:
    bids:
        suffix: streamlines
        extension: tck.gz
    metadata:
        Description: |
            One tck.gz per bundle. The bundle represented by this file is
            specified in the ``bundle-`` tag.

tdistats:
    bids:
        bundles: DSIStudio
        suffix: tdistats
        extension: tsv
    metadata:
        Description: Statistics on streamline density in voxels

scalarstats:
    bids:
        bundles: DSIStudio
        suffix: scalarstats
        extension: csv
    metadata:
        Description: |
            Statistics on scalars produced by this workflow

fibgz:
    bids:
        space: ACPC|T1w
        suffix: dwimap
        extension: fib.gz
    metadata:
        Description: |
            DSI Studio fib format containing the GQI ODFs used for
            AutoTrack.

mapping:
    bids:
        space: ACPC|T1w
        suffix: dwimap
        extension: map.gz
    metadata:
        Description: Mapping file produced by DSI Studio.


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/reorient_fslstd.yaml
scalarstats:
    bids:
        bundles: "*"
        suffix: scalarstats
        extension: tsv
    metadata:
        Description: |
            MAPMRI scalars summarized within WM bundles. The name of the method
            used to create the bundles is specified after ``bundles-``.
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/ss3t_fod_autotrack.yaml
bundles:
    bids:
        suffix: streamlines
        model: ss3t
        extension: tck.gz
    metadata:
        Description: |
            One tck.gz per bundle. The bundle represented by this file is
            specified in the ``bundle-`` tag. Bundles were tracked using the
            SS3t FODs.

tdistats:
    bids:
        bundles: DSIStudio
        suffix: tdistats
        extension: tsv
    metadata:
        Description: Statistics on streamline density in voxels.

scalarstats:
    bids:
        bundles: DSIStudio
        suffix: scalarstats
        extension: csv
    metadata:
        Description: |
            Statistics on scalars produced by this workflow.

gqi_fibgz:
    bids:
        space: ACPC|T1w
        model: gqi
        suffix: dwimap
        extension: fib.gz
    metadata:
        Description: |
            DSI Studio fib format containing the GQI ODFs used for
            AutoTrack registration.

fibgz:
    bids:
        space: ACPC|T1w
        model: ss3t
        suffix: dwimap
        extension: fib.gz
    metadata:
        Description: |
            DSI Studio fib format containing the SS3T FODs used for
            AutoTrack.

mapping:
    bids:
        space: ACPC|T1w
        model: ss3t
        suffix: dwimap
        extension: map.gz
    metadata:
        Description: |
            Mapping file produced by DSI Studio. Here the model entity
            specifies ss3t so that DSI Studio associates the mapping
            with the model-ss3t fib.gz file. Be aware that this mapping
            was created using the model-gqi fib.gz file.


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/nonscalars/tortoise.yaml
scalarstats:
    bids:
        suffix: scalarstats
        extension: tsv
    metadata:
        Description: |
            TORTOISE scalars (tensors and MAPMRI) summarized within WM bundles.
            The name of the method used to create the bundles is specified after ``bundles-``.


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/TORTOISE.yaml
anatomical: []
name: tortoise_recon
nodes:
-   action: estimate
    input: qsirecon
    name: tortoise_dtmapmri
    parameters:
        big_delta: null
        estimate_mapmri:
            map_order: 4
        estimate_tensor:
            bval_cutoff: 2400
            write_cs: true
        estimate_tensor_separately: true
        small_delta: null
    qsirecon_suffix: TORTOISE
    software: TORTOISE
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/abcd_recon.yaml
name: ABCD_Recon
nodes:
# NODDI with WM parameters
-   action: fit_noddi
    input: qsirecon
    name: fit_noddi_wm
    parameters:
        dIso: 0.003
        dPar: 0.0017
        isExvivo: false
    qsirecon_suffix: wmNODDI
    software: AMICO
# NODDI with GM parameters
-   action: fit_noddi
    input: qsirecon
    name: fit_noddi_gm
    parameters:
        dIso: 0.003
        dPar: 0.0011
        isExvivo: false
    qsirecon_suffix: gmNODDI
    software: AMICO
# DIPY diffusion kurtosis modeling
-   action: DKI_reconstruction
    input: qsirecon
    name: dipy_dki
    parameters:
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: DIPYDKI
    software: Dipy
# TORTOISE MAPMRI w/ small b-val tensor fit
-   action: estimate
    input: qsirecon
    name: tortoise_dtmapmri
    parameters:
        big_delta: null
        estimate_mapmri:
            map_order: 4
        estimate_tensor:
            bval_cutoff: 1200
            write_cs: true
        estimate_tensor_separately: true
        small_delta: null
    qsirecon_suffix: TORTOISE_model-MAPMRI
    software: TORTOISE
# Fit the GQI model to the data
-   action: reconstruction
    input: qsirecon
    name: dsistudio_gqi
    parameters:
        method: gqi
    qsirecon_suffix: DSIStudioGQI
    software: DSI Studio
# Get 3D images of DSI Studio's scalar maps
-   action: export
    input: dsistudio_gqi
    name: gqi_scalars
    qsirecon_suffix: DSIStudioGQI
    software: DSI Studio
 # Perform the registration using the GQI-based QA+ISO
-   action: autotrack_registration
    input: dsistudio_gqi
    name: autotrack_gqi_registration
    # qsirecon_suffix: Don't include here - the map.gz is saved in autotrack
    software: DSI Studio
# Do MSMT on all shells
-   action: csd
    software: MRTrix3
    input: qsirecon
    name: msmt_csd
    parameters:
        fod:
            algorithm: msmt_csd
            max_sh:
            - 8
            - 8
            - 8
        mtnormalize: true
        response:
            algorithm: dhollander
    qsirecon_suffix: MSMTAutoTrack
# Merge the FOD fib file and the map file
-   action: fod_fib_merge
    name: create_fod_fib_msmt
    # to include the fib file AND the map file
    input: autotrack_gqi_registration
    csd_input: msmt_csd
    # outputs include the FOD fib file and the map file is passed through
    qsirecon_suffix: MSMTAutoTrack
    parameters:
        model: msmt
# Execute AutoTrack
-   action: autotrack
    input: create_fod_fib_msmt
    name: autotrack_fod_msmt
    parameters:
        tolerance: 22,26,30
        track_id: Association,Projection,Commissure,Cerebellum
        track_voxel_ratio: 2.0
        yield_rate: 1.0e-06
        model: msmt
    qsirecon_suffix: MSMTAutoTrack
    software: DSI Studio
# Map scalars to bundles
-   action: bundle_map
    input: autotrack_fod_msmt
    name: bundle_means
    scalars_from:
    - fit_noddi_wm
    - dipy_dki
    - tortoise_dtmapmri
    - gqi_scalars
    software: qsirecon
# Map scalars to MNI
-   action: template_map
    input: qsirecon
    name: template_map
    parameters:
        interpolation: NearestNeighbor
    scalars_from:
    - fit_noddi_wm
    - fit_noddi_gm
    - dipy_dki
    - tortoise_dtmapmri
    - gqi_scalars
    software: qsirecon


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dipy_dki.yaml
description: Reconstruct dwis using Dipy, then convert to mrtrix and dsi studio formats
name: dipy_dki_recon
nodes:
-   action: DKI_reconstruction
    input: qsirecon
    name: dki_recon
    parameters:
        # Calculate MSDKI metrics
        msdki: false
        # Calculate microstructural metrics
        wmti: false
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: DKI
    software: Dipy
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dipy_mapmri.yaml
description: Reconstruct dwis using Dipy, then convert to mrtrix and dsi studio formats
name: dipy_mapmri
nodes:
-   action: MAPMRI_reconstruction
    input: qsirecon
    name: mapmri_recon
    parameters:
        anisotropic_scaling: false
        big_delta: null
        bval_threshold: 2000
        dti_scale_estimation: false
        laplacian_regularization: true
        laplacian_weighting: 0.2
        radial_order: 6
        small_delta: null
        write_fibgz: true
        write_mif: true
    qsirecon_suffix: DIPYMAPMRI
    software: Dipy
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/dsi_studio_gqi.yaml
name: dsistudio_pipeline
nodes:
-   action: reconstruction
    input: qsirecon
    name: dsistudio_gqi
    parameters:
        method: gqi
    qsirecon_suffix: DSIStudio
    software: DSI Studio
-   action: export
    input: dsistudio_gqi
    name: scalar_export
    qsirecon_suffix: DSIStudio
    software: DSI Studio
-   action: tractography
    input: dsistudio_gqi
    name: tractography
    parameters:
        fiber_count: 5000000
        max_length: 250
        min_length: 30
        smoothing: 0.0
        step_size: 1.0
        turning_angle: 35
    software: DSI Studio
-   action: connectivity
    input: tractography
    name: streamline_connectivity
    parameters:
        connectivity_type: pass,end
        connectivity_value: count,ncount,mean_length,gfa
    qsirecon_suffix: DSIStudio
    software: DSI Studio
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/hbcd_scalar_maps.yaml
anatomical: []
name: hbcd_postproc_beta
description: |
    hbcd_postproc_beta is the pipeline used by the HEALthy Brain and Child Development Study
    to process diffusion MRI data [@cieslak2025diffusion].
space: T1w
nodes:

-   action: DKI_reconstruction
    input: qsirecon
    name: dipy_dki
    parameters:
        # Calculate MSDKI metrics
        msdki: false
        # Calculate microstructural metrics
        wmti: false
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: DIPYDKI
    software: Dipy

-   action: estimate
    input: qsirecon
    name: tortoise_dtmapmri
    parameters:
        big_delta: null
        estimate_mapmri:
            map_order: 4
        estimate_tensor:
            bval_cutoff: 1200
            write_cs: true
        estimate_tensor_separately: true
        small_delta: null
    qsirecon_suffix: TORTOISE_model-MAPMRI
    software: TORTOISE

-   action: estimate
    input: qsirecon
    name: tortoise_fullshell_tensor
    parameters:
        big_delta: null
        estimate_tensor:
            bval_cutoff: 4000
            write_cs: true
        estimate_tensor_separately: true
        small_delta: null
    qsirecon_suffix: TORTOISE_model-tensor
    software: TORTOISE

-   action: reconstruction
    input: qsirecon
    name: dsistudio_gqi
    parameters:
        method: gqi
    qsirecon_suffix: DSIStudio
    software: DSI Studio

-   action: autotrack
    input: dsistudio_gqi
    name: autotrackgqi
    parameters:
        dsi_studio_version: chen
        tolerance: 22,26,30
        track_id: Association,Projection,Commissure,Cerebellum
        track_voxel_ratio: 2.0
        yield_rate: 1.0e-06
    qsirecon_suffix: DSIStudio
    software: DSI Studio

-   action: export
    input: dsistudio_gqi
    name: gqi_scalars
    qsirecon_suffix: DSIStudio
    software: DSI Studio

-   action: bundle_map
    input: autotrackgqi
    name: bundle_means
    scalars_from:
    - gqi_scalars
    - dipy_dki
    - tortoise_fullshell_tensor
    - tortoise_dtmapmri
    software: qsirecon

-   action: template_map
    input: qsirecon
    name: template_map
    parameters:
        interpolation: NearestNeighbor
    scalars_from:
    - gqi_scalars
    - dipy_dki
    - tortoise_fullshell_tensor
    - tortoise_dtmapmri
    software: qsirecon



### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/mrtrix_multishell_msmt_pyafq_tractometry.yaml
description: Use pyAFQ to perform the Tractometry pipeline, with tractography from
    qsirecon
name: mrtrix_multishell_msmt_pyafq_tractometry
nodes:
-   action: csd
    input: qsirecon
    name: msmt_csd
    parameters:
        fod:
            algorithm: msmt_csd
            max_sh:
            - 8
            - 8
            - 8
        mtnormalize: true
        response:
            algorithm: dhollander
    qsirecon_suffix: MRtrix3
    software: MRTrix3
-   action: tractography
    input: msmt_csd
    name: track_ifod2
    parameters:
        sift2: {}
        tckgen:
            algorithm: iFOD2
            max_length: 250
            min_length: 30
            power: 0.33
            select: 1000000.0
        use_5tt: false
        use_sift2: true
    qsirecon_suffix: MRtrix3
    software: MRTrix3
-   action: pyafq_tractometry
    input: track_ifod2
    name: pyafq_tractometry
    parameters:
        b0_threshold: 50
        brain_mask_definition: ''
        bundle_info: null
        clean_rounds: 5
        clip_edges: false
        csd_lambda_: 1
        csd_response: ''
        csd_sh_order: ''
        csd_tau: 0.1
        directions: prob
        dist_to_atlas: 4
        dist_to_waypoint: ''
        distance_threshold: 3
        export: all
        filter_b: true
        filter_by_endpoints: true
        greater_than: 50
        gtol: 0.01
        import_tract: ''
        length_threshold: 4
        mapping_definition: ''
        max_angle: 30.0
        max_bval: ''
        max_length: 250
        min_bval: ''
        min_length: 50
        min_sl: 20
        model_clust_thr: 1.25
        n_points: 100
        n_points_bundles: 40
        n_points_indiv: 40
        n_seeds: 1
        nb_points: false
        nb_streamlines: false
        odf_model: CSD
        parallel_segmentation: '{''n_jobs'': -1, ''engine'': ''joblib'', ''backend'':
            ''loky''}'
        presegment_bundle_dict: null
        presegment_kwargs: '{}'
        prob_threshold: 0
        profile_weights: gauss
        progressive: true
        pruning_thr: 12
        random_seeds: false
        reduction_thr: 25
        refine: false
        reg_algo: ''
        reg_subject_spec: power_map
        reg_template_spec: mni_T1
        return_idx: false
        rm_small_clusters: 50
        rng: ''
        rng_seed: ''
        robust_tensor_fitting: false
        roi_dist_tie_break: false
        save_intermediates: ''
        sbv_lims_bundles: '[None, None]'
        sbv_lims_indiv: '[None, None]'
        scalars: '[''dti_fa'', ''dti_md'']'
        seed_mask: ''
        seed_threshold: 0
        seg_algo: AFQ
        sphere: ''
        stat: mean
        step_size: 0.5
        stop_mask: ''
        stop_threshold: 0
        tracker: local
        use_external_tracking: true
        virtual_frame_buffer: false
        viz_backend_spec: plotly_no_gif
        volume_opacity_bundles: 0.3
        volume_opacity_indiv: 0.3
    qsirecon_suffix: PYAFQ
    software: pyAFQ
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/multishell_scalarfest.yaml
anatomical: []
name: multishell_scalarfest
nodes:
-   action: csd
    input: qsirecon
    name: msmt_csd
    parameters:
        fod:
            algorithm: msmt_csd
            max_sh:
            - 8
            - 8
            - 8
        mtnormalize: true
        response:
            algorithm: dhollander
    qsirecon_suffix: msmtcsd
    software: MRTrix3
-   action: fit_noddi
    input: qsirecon
    name: fit_noddi
    parameters:
        dIso: 0.003
        dPar: 0.0017
        isExvivo: false
    qsirecon_suffix: wmNODDI
    software: AMICO
-   action: fit_noddi
    input: qsirecon
    name: fit_noddi_gm
    parameters:
        dIso: 0.003
        dPar: 0.0011
        isExvivo: false
    qsirecon_suffix: gmNODDI
    software: AMICO
-   action: steinhardt_order_parameters
    input: msmt_csd
    name: calc_sops
    parameters:
        order: 8
    qsirecon_suffix: SOP
-   action: MAPMRI_reconstruction
    input: qsirecon
    name: mapmri_recon
    parameters:
        anisotropic_scaling: false
        big_delta: null
        bval_threshold: 2000
        dti_scale_estimation: false
        laplacian_regularization: true
        laplacian_weighting: 0.2
        radial_order: 6
        small_delta: null
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: MAPMRI
    software: Dipy
-   action: DKI_reconstruction
    input: qsirecon
    name: dki_recon
    parameters:
        # Calculate MSDKI metrics
        msdki: false
        # Calculate microstructural metrics
        wmti: false
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: DKI
    software: Dipy
-   action: 3dSHORE_reconstruction
    input: qsirecon
    name: csdsi_3dshore
    parameters:
        big_delta: null
        extrapolate_scheme: HCP
        lambdaL: 1.0e-08
        lambdaN: 1.0e-08
        radial_order: 8
        regularization: L2
        small_delta: null
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: DIPY3dSHORE
    software: Dipy
-   action: csd
    input: csdsi_3dshore
    name: msmt_csd_fromcs
    parameters:
        fod:
            algorithm: msmt_csd
            max_sh:
            - 8
            - 8
            - 8
        mtnormalize: true
        response:
            algorithm: dhollander
    qsirecon_suffix: csmsmtcsd
    software: MRTrix3
-   action: reconstruction
    input: qsirecon
    name: dsistudio_gqi
    parameters:
        method: gqi
    qsirecon_suffix: DSIStudio
    software: DSI Studio
-   action: export
    input: dsistudio_gqi
    name: scalar_export
    qsirecon_suffix: DSIStudio
    software: DSI Studio
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/pyafq_tractometry.yaml
description: Use pyAFQ to perform the full Tractometry pipeline
name: pyafq_tractometry
nodes:
-   action: pyafq_tractometry
    input: qsirecon
    name: pyafq_tractometry
    parameters:
        b0_threshold: 50
        brain_mask_definition: ''
        bundle_info: null
        clean_rounds: 5
        clip_edges: false
        csd_lambda_: 1
        csd_response: ''
        csd_sh_order: ''
        csd_tau: 0.1
        directions: prob
        dist_to_atlas: 4
        dist_to_waypoint: ''
        distance_threshold: 3
        export: all
        filter_b: true
        filter_by_endpoints: true
        greater_than: 50
        gtol: 0.01
        import_tract: ''
        length_threshold: 4
        mapping_definition: ''
        max_angle: 30.0
        max_bval: ''
        max_length: 250
        min_bval: ''
        min_length: 50
        min_sl: 20
        model_clust_thr: 1.25
        n_points: 100
        n_points_bundles: 40
        n_points_indiv: 40
        n_seeds: 1
        nb_points: false
        nb_streamlines: false
        odf_model: CSD
        parallel_segmentation: '{''n_jobs'': -1, ''engine'': ''joblib'', ''backend'':
            ''loky''}'
        presegment_bundle_dict: null
        presegment_kwargs: '{}'
        prob_threshold: 0
        profile_weights: gauss
        progressive: true
        pruning_thr: 12
        random_seeds: false
        reduction_thr: 25
        refine: false
        reg_algo: ''
        reg_subject_spec: power_map
        reg_template_spec: mni_T1
        return_idx: false
        rm_small_clusters: 50
        rng: ''
        rng_seed: ''
        robust_tensor_fitting: false
        roi_dist_tie_break: false
        save_intermediates: ''
        sbv_lims_bundles: '[None, None]'
        sbv_lims_indiv: '[None, None]'
        scalars: '[''dti_fa'', ''dti_md'']'
        seed_mask: ''
        seed_threshold: 0
        seg_algo: AFQ
        sphere: ''
        stat: mean
        step_size: 0.5
        stop_mask: ''
        stop_threshold: 0
        tracker: local
        use_external_tracking: false
        virtual_frame_buffer: false
        viz_backend_spec: plotly_no_gif
        volume_opacity_bundles: 0.3
        volume_opacity_indiv: 0.3
    qsirecon_suffix: PYAFQ
    software: pyAFQ
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/ss3t_fod_autotrack.yaml
name: FODAutoTrack
nodes:

    # Fit the actual GQI model to the data
-   action: reconstruction
    input: qsirecon
    name: dsistudio_gqi
    parameters:
        method: gqi
    qsirecon_suffix: SS3TAutoTrack
    software: DSI Studio

    # Get 3D images of DSI Studio's scalar maps
-   action: export
    input: dsistudio_gqi
    name: gqi_scalars
    qsirecon_suffix: SS3TAutoTrack
    software: DSI Studio

    # Perform the registration using the GQI-based QA+ISO
-   action: autotrack_registration
    input: dsistudio_gqi
    name: autotrack_gqi_registration
    # qsirecon_suffix: Don't include here - the map.gz is saved in autotrack
    software: DSI Studio

    # Select just one shell + b=0 for autotrack
-   action: select_gradients
    input: qsirecon
    name: select_single_shell
    parameters:
        requested_shells:
            - 0
            - highest
        bval_distance_cutoff: 100

    # Do SS3T on the single-shell data
-   action: csd
    software: MRTrix3
    input: select_single_shell
    name: ss3t_csd
    parameters:
        fod:
            algorithm: ss3t
        mtnormalize: true
        response:
            algorithm: dhollander
    qsirecon_suffix: SS3TAutoTrack

-   action: fod_fib_merge
    name: create_fod_fib
    # to include the fib file AND the map file
    input: autotrack_gqi_registration
    csd_input: ss3t_csd
    # outputs include the FOD fib file and the map file is passed through
    qsirecon_suffix: SS3TAutoTrack
    parameters:
        model: ss3t

-   action: autotrack
    input: create_fod_fib
    name: autotrack_fod
    parameters:
        tolerance: 22,26,30
        track_id: Association,Projection,Commissure,Cerebellum,CranialNerve
        track_voxel_ratio: 2.0
        yield_rate: 1.0e-06
        model: ss3t
    qsirecon_suffix: SS3TAutoTrack
    software: DSI Studio

# Uncomment to map scalar maps to template space
# -   action: template_map
#     input: qsirecon
#     name: template_map
#     parameters:
#         interpolation: NearestNeighbor
#     scalars_from:
#     - gqi_scalars
#     software: qsirecon


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/pipelines/test_scalar_maps.yaml
anatomical: []
name: bundle_scalar_map
nodes:
-   action: DKI_reconstruction
    input: qsirecon
    name: dipy_dki
    parameters:
        # Calculate MSDKI metrics
        msdki: false
        # Calculate microstructural metrics
        wmti: false
        write_fibgz: false
        write_mif: false
    qsirecon_suffix: DIPYDKI
    software: Dipy
-   action: reconstruction
    input: qsirecon
    name: dsistudio_gqi
    parameters:
        method: gqi
    qsirecon_suffix: DSIStudio
    software: DSI Studio
-   action: autotrack
    input: dsistudio_gqi
    name: autotrackgqi
    parameters:
        tolerance: 22,26,30
        track_id: Fasciculus,Cingulum,Aslant,Corticos,Thalamic_R,Reticular,Optic,Fornix,Corpus
        track_voxel_ratio: 2.0
        yield_rate: 1.0e-06
    qsirecon_suffix: DSIStudio
    software: DSI Studio
-   action: export
    input: dsistudio_gqi
    name: gqi_scalars
    qsirecon_suffix: DSIStudio
    software: DSI Studio
-   action: bundle_map
    input: autotrackgqi
    name: bundle_means
    scalars_from:
    - gqi_scalars
    - dipy_dki
    software: qsirecon
-   action: template_map
    input: qsirecon
    name: template_map
    parameters:
        interpolation: NearestNeighbor
    scalars_from:
    - dipy_dki
    - gqi_scalars
    software: qsirecon
-   action: parcellate_scalars
    input: qsirecon
    name: parcellate_scalars
    scalars_from:
    - dipy_dki
    - gqi_scalars
    software: qsirecon
space: T1w


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/brainsuite_3dshore.yaml
alpha_image:
    bids:
        model: 3dshore
        param: alpha
    metadata:
        Description: alpha used when fitting in each voxel
cnr_image:
    bids:
        model: 3dshore
        param: CNR
    metadata:
        Description: Contrast to noise ratio for 3dshore fit
lapnorm_file:
    bids:
        model: 3dshore
        param: lapnorm
    metadata:
        Description: Laplacian norm from regularized MAPMRI (MAPL)
mapcoeffs_file:
    bids:
        model: 3dshore
        param: mapcoeffs
    metadata:
        Description: MAPMRI coefficients
msd_file:
    bids:
        model: 3dshore
        param: msd
    metadata:
        Description: mean square displacement from MAPMRI
ng_file:
    bids:
        model: 3dshore
        param: ng
    metadata:
        Description: Non-Gaussianity from MAPMRI
ngpar_file:
    bids:
        model: 3dshore
        param: ngpar
    metadata:
        Description: Non-Gaussianity parallel from MAPMRI
ngperp_file:
    bids:
        model: 3dshore
        param: ngperp
    metadata:
        Description: Non-Gaussianity perpendicular from MAPMRI
qiv_file:
    bids:
        model: 3dshore
        param: qiv
    metadata:
        Description: q-space inverse variance from MAPMRI
r2_image:
    bids:
        model: 3dshore
        param: r2
    metadata:
        Description: r^2 of the 3dshore fit
regularization_image:
    bids:
        model: 3dshore
        param: regularization
    metadata:
        Description: regularization of the 3dshore fit
rtap_file:
    bids:
        model: 3dshore
        param: rtap
    metadata:
        Description: Return to axis probability from MAPMRI
rtop_file:
    bids:
        model: 3dshore
        param: rtop
    metadata:
        Description: Return to origin probability from MAPMRI
rtpp_file:
    bids:
        model: 3dshore
        param: rtpp
    metadata:
        Description: Return to plane probability from MAPMRI


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/dipy_dki.yaml
dki_ad:
    bids:
        model: dki
        param: ad
    metadata:
        Description: DKI axial diffusivity
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
        Units: mm^2/s
dki_ak:
    bids:
        model: dki
        param: ak
    metadata:
        Description: DKI axial kurtosis
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
dki_fa:
    bids:
        model: dki
        param: fa
    metadata:
        Description: DKI fractional anisotropy
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
dki_kfa:
    bids:
        model: dki
        param: kfa
    metadata:
        Description: DKI kurtosis fractional anisotropy
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
dki_linearity:
    bids:
        model: dki
        param: linearity
    metadata:
        Description: DKI linearity
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
dki_md:
    bids:
        model: dki
        param: md
    metadata:
        Description: DKI mean diffusivity
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
        Units: mm^2/s
dki_mk:
    bids:
        model: dki
        param: mk
    metadata:
        Description: DKI mean kurtosis
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
dki_mkt:
    bids:
        model: dki
        param: mkt
    metadata:
        Description: DKI mean of the kurtosis tensor
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/23589312/
dki_planarity:
    bids:
        model: dki
        param: planarity
    metadata:
        Description: DKI planarity
dki_rd:
    bids:
        model: dki
        param: rd
    metadata:
        Description: DKI radial diffusivity
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
        Units: mm^2/s
dki_rk:
    bids:
        model: dki
        param: rk
    metadata:
        Description: DKI radial kurtosis
        Model:
            Description: Diffusion Kurtosis Imaging (DKI)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21337412/
dki_sphericity:
    bids:
        model: dki
        param: sphericity
    metadata:
        Description: DKI sphericity
dkimicro_ad:
    bids:
        model: dkimicro
        param: ad
    metadata:
        Description: DKI Microstructural Axial Diffusivity
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
dkimicro_ade:
    bids:
        model: dkimicro
        param: ade
    metadata:
        Description: DKI Microstructural Axial Diffusivity of the Extra-Cellular Compartment
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
dkimicro_ak:
    bids:
        model: dkimicro
        param: ak
    metadata:
        Description: DKI Microstructural Axial Kurtosis
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
dkimicro_awf:
    bids:
        model: dkimicro
        param: awf
    metadata:
        Description: DKI axonal water fraction
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
dkimicro_axonald:
    bids:
        model: dkimicro
        param: axonald
    metadata:
        Description: DKI Microstructural Axonal Diffusivity
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
dkimicro_kfa:
    bids:
        model: dkimicro
        param: kfa
    metadata:
        Description: DKI Microstructural Kurtosis Fractional Anisotropy
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
dkimicro_md:
    bids:
        model: dkimicro
        param: md
    metadata:
        Description: DKI Microstructural Mean Diffusivity
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
dkimicro_rd:
    bids:
        model: dkimicro
        param: rd
    metadata:
        Description: DKI Microstructural Radial Diffusivity
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
dkimicro_rde:
    bids:
        model: dkimicro
        param: rde
    metadata:
        Description: DKI radial diffusivity of the extra-cellular compartment
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
dkimicro_tortuosity:
    bids:
        model: dkimicro
        param: tortuosity
    metadata:
        Description: DKI Microstructural Tortuosity
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
dkimicro_trace:
    bids:
        model: dkimicro
        param: trace
    metadata:
        Description: DKI Microstructural Trace
        Model:
            Description: Diffusion Kurtosis Microstructural Imaging (DKI-MICRO)
            URL: https://pubmed.ncbi.nlm.nih.gov/34349631/
        ParameterURL: https://pubmed.ncbi.nlm.nih.gov/21699989/
        Units: mm^2/s
msdki_msd:
    bids:
        model: msdki
        param: msd
    metadata:
        Description: MSDKI Mean Signal Diffusivity
msdki_msk:
    bids:
        model: msdki
        param: msk
    metadata:
        Description: MSDKI Mean Signal Kurtosis
msdki_di:
    bids:
        model: msdki
        param: di
    metadata:
        Description: MSDKI intrinsic diffusivity from the mean signal diffusional kurtosis parameters assuming the 2-compartmental spherical mean technique model.
msdki_awf:
    bids:
        model: msdki
        param: awf
    metadata:
        Description: MSDKI Axonal Water Fraction from the mean signal diffusional kurtosis parameters assuming the 2-compartmental spherical mean technique model.
msdki_mfa:
    bids:
        model: msdki
        param: mfa
    metadata:
        Description: MSDKI Microscopic Fractional Anisotropy from the mean signal diffusional kurtosis parameters assuming the 2-compartmental spherical mean technique model.


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/dipy_mapmri.yaml
lapnorm:
    bids:
        model: mapmri
        param: lapnorm
    metadata:
        Description: Laplacian norm from regularized MAPMRI (MAPL)
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
mapcoeffs:
    bids:
        model: mapmri
        param: mapcoeffs
    metadata:
        Description: MAPMRI coefficients
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
msd:
    bids:
        model: mapmri
        param: msd
    metadata:
        Description: Mean square displacement from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
ng:
    bids:
        model: mapmri
        param: ng
    metadata:
        Description: Non-Gaussianity from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
ngpar:
    bids:
        model: mapmri
        param: ngpar
    metadata:
        Description: Non-Gaussianity parallel from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
ngperp:
    bids:
        model: mapmri
        param: ngperp
    metadata:
        Description: Non-Gaussianity perpendicular from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
qiv:
    bids:
        model: mapmri
        param: qiv
    metadata:
        Description: q-space inverse variance from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
rtap:
    bids:
        model: mapmri
        param: rtap
    metadata:
        Description: Return to axis probability from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
rtop:
    bids:
        model: mapmri
        param: rtop
    metadata:
        Description: Return to origin probability from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
rtpp:
    bids:
        model: mapmri
        param: rtpp
    metadata:
        Description: Return to plane probability from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/dsistudio_gqi.yaml
ad_file:
    bids:
        model: tensor
        param: ad
    metadata:
        Description: Axial Diffusivity from a tensor fit. The first eigenvalue of the tensor.
        Units: μm^2/ms
dti_fa_file:
    bids:
        model: tensor
        param: fa
    metadata:
        Description: Fractional Anisotropy from a tensor fit
gfa_file:
    bids:
        model: gqi
        param: gfa
    metadata:
        Description: Generalized Fractional Anisotropy from a GQI fit
ha_file:
    bids:
        model: tensor
        param: ha
    metadata:
        Description: Helix Angle from a tensor fit
iso_file:
    bids:
        model: gqi
        param: iso
    metadata:
        Description: Isotropic Diffusion from a GQI fit
md_file:
    bids:
        model: tensor
        param: md
    metadata:
        Description: Mean Diffusivity from a tensor fit. The mean of the three eigenvalues.
        Units: μm^2/ms
nrdi02L_file:
    bids:
        model: gqi
        param: nrdi02L
    metadata:
        Description: Non-restricted Diffusion Imaging from a GQI fit. The total amount of non-restricted diffusion regardless of orientation at a 0.2 diffusion sampling length ratio.
nrdi04L_file:
    bids:
        model: gqi
        param: nrdi04L
    metadata:
        Description: Non-restricted Diffusion Imaging from a GQI fit. The total amount of non-restricted diffusion regardless of orientation at a 0.4 diffusion sampling length ratio.
nrdi06L_file:
    bids:
        model: gqi
        param: nrdi06L
    metadata:
        Description: Non-restricted Diffusion Imaging from a GQI fit. The total amount of non-restricted diffusion regardless of orientation at a 0.6 diffusion sampling length ratio.
qa_file:
    bids:
        model: gqi
        param: qa
    metadata:
        Description: Quantitative Anisotropy from a GQI fit
rd1_file:
    bids:
        model: tensor
        param: rd1
    metadata:
        Description: Lambda 2 (second eigenvalue) from a tensor fit.
        Units: μm^2/ms
rd2_file:
    bids:
        model: tensor
        param: rd2
    metadata:
        Description: Lambda 3 (third eigenvalue) from a tensor fit.
        Units: μm^2/ms
rd_file:
    bids:
        model: tensor
        param: rd
    metadata:
        Description: Radial Diffusivity from a tensor fit. The mean of the second and third eigenvalues (rd1 and rd2).
        Units: μm^2/ms
rdi_file:
    bids:
        model: gqi
        param: rdi
    metadata:
        Description: Restricted Diffusion Imaging from a GQI fit. Indexes the the total amount of restricted diffusion regardless of orientation.
txx_file:
    bids:
        model: tensor
        param: txx
    metadata:
        Description: Tensor fit txx
txy_file:
    bids:
        model: tensor
        param: txy
    metadata:
        Description: Tensor fit txy
txz_file:
    bids:
        model: tensor
        param: txz
    metadata:
        Description: Tensor fit txz
tyy_file:
    bids:
        model: tensor
        param: tyy
    metadata:
        Description: Tensor fit tyy
tyz_file:
    bids:
        model: tensor
        param: tyz
    metadata:
        Description: Tensor fit tyz
tzz_file:
    bids:
        model: tensor
        param: tzz
    metadata:
        Description: Tensor fit tzz


### /app/.pixi/envs/qsirecon/lib/python3.10/site-packages/qsirecon/data/scalars/tortoise.yaml
ad_file:
    bids:
        model: tensor
        param: ad
    metadata:
        Description: Axial Diffusivity from a tensor fit
am_file:
    bids:
        model: tensor
        param: am
    metadata:
        Description: A0 from a tensor fit
fa_file:
    bids:
        model: tensor
        param: fa
    metadata:
        Description: Fractional Anisotropy from a tensor fit
li_file:
    bids:
        model: tensor
        param: li
    metadata:
        Description: LI from a tensor fit
md:
    bids:
        model: tensor
        param: md
    metadata:
        Description: Mean Diffusivity from a tensor fit
        Model:
            Description: Custom Python code implementing the formula (ad + (2 * rd)) / 3
ng_file:
    bids:
        model: mapmri
        param: ng
    metadata:
        Description: Non-Gaussianity from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
ngpar_file:
    bids:
        model: mapmri
        param: ngpar
    metadata:
        Description: Non-Gaussianity parallel from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
ngperp_file:
    bids:
        model: mapmri
        param: ngperp
    metadata:
        Description: Non-Gaussianity perpendicular from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
pa_file:
    bids:
        model: mapmri
        param: pa
    metadata:
        Description: PA from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
path_file:
    bids:
        model: mapmri
        param: path
    metadata:
        Description: Path from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
rd_file:
    bids:
        model: tensor
        param: rd
    metadata:
        Description: Radial Diffusivity from a tensor fit
rtap_file:
    bids:
        model: mapmri
        param: rtap
    metadata:
        Description: Return to axis probability from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
rtop_file:
    bids:
        model: mapmri
        param: rtop
    metadata:
        Description: Return to origin probability from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016
rtpp_file:
    bids:
        model: mapmri
        param: rtpp
    metadata:
        Description: Return to plane probability from MAPMRI
        Model:
            Description: Mean Apparent Propagator MRI (MAPMRI) with Laplacian regularization
            URL: https://doi.org/10.1016/j.neuroimage.2013.04.016


COMMAND EXIT: 0
```
