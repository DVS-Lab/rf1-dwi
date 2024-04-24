#!/bin/bash
#PBS -l walltime=48:00:00
#PBS -N qsirecon-all
#PBS -q normal
#PBS -m ae
#PBS -M david.v.smith@temple.edu
#PBS -l nodes=1:ppn=28

# load modules and go to workdir
module load fsl/6.0.2
source $FSLDIR/etc/fslconf/fsl.sh
module load singularity/3.8.5
cd $PBS_O_WORKDIR

# ensure paths are correct
maindir=~/work/rf1-data-hpc #this should be the only line that has to change if the rest of the script is set up correctly
scriptdir=$maindir/code
bidsdir=$maindir/bids
logdir=$maindir/logs
mkdir -p $logdir

# runs recon on all three specs below. any conflicts on scratch? probably best to run separately
# mrtrix_multishell_msmt_ACT-hsvs amico_noddi mrtrix_multishell_msmt_pyafq_tractometry 

rm -f $logdir/cmd_qsirecon_${PBS_JOBID}.txt
touch $logdir/cmd_qsirecon_${PBS_JOBID}.txt

# make derivatives folder if it doesn't exist.
# let's keep this out of bids for now
if [ ! -d $maindir/derivatives ]; then
	mkdir -p $maindir/derivatives
fi

scratchdir=~/scratch/qsirecon
if [ ! -d $scratchdir ]; then
	mkdir -p $scratchdir
fi

TEMPLATEFLOW_DIR=~/work/tools/templateflow
MPLCONFIGDIR_DIR=~/work/mplconfigdir
export SINGULARITYENV_TEMPLATEFLOW_HOME=/opt/templateflow
export SINGULARITYENV_MPLCONFIGDIR=/opt/mplconfigdir

# # need to change this to a more targetted list of subjects
# for sub in `ls -1d $bidsdir/sub-*`; do
# 	sub=${sub:(-5)}

sub=10656

echo singularity run --cleanenv \
-B ${TEMPLATEFLOW_DIR}:/opt/templateflow \
-B ${MPLCONFIGDIR_DIR}:/opt/mplconfigdir \
-B $maindir:/base \
-B ~/work/tools/licenses:/opts \
-B $scratchdir:/scratch \
~/work/tools/qsiprep-0.18.0.sif \
/base/bids /base/derivatives \
participant --participant_label $sub \
--output-resolution 2 \
--recon_input /base/derivatives/qsiprep \
--recon_spec amico_noddi \
--freesurfer-input /base/derivatives/fmriprep/sourcedata/freesurfer \
--fs-license-file /opts/fs_license.txt \
--notrack \
--nthreads 9 \
-w /scratch >> $logdir/cmd_qsirecon_${PBS_JOBID}.txt

echo singularity run --cleanenv \
-B ${TEMPLATEFLOW_DIR}:/opt/templateflow \
-B ${MPLCONFIGDIR_DIR}:/opt/mplconfigdir \
-B $maindir:/base \
-B ~/work/tools/licenses:/opts \
-B $scratchdir:/scratch \
~/work/tools/qsiprep-0.18.0.sif \
/base/bids /base/derivatives \
participant --participant_label $sub \
--output-resolution 2 \
--recon_input /base/derivatives/qsiprep \
--recon_spec mrtrix_multishell_msmt_ACT-hsvs \
--freesurfer-input /base/derivatives/fmriprep/sourcedata/freesurfer \
--fs-license-file /opts/fs_license.txt \
--notrack \
--nthreads 9 \
-w /scratch >> $logdir/cmd_qsirecon_${PBS_JOBID}.txt

echo singularity run --cleanenv \
-B ${TEMPLATEFLOW_DIR}:/opt/templateflow \
-B ${MPLCONFIGDIR_DIR}:/opt/mplconfigdir \
-B $maindir:/base \
-B ~/work/tools/licenses:/opts \
-B $scratchdir:/scratch \
~/work/tools/qsiprep-0.18.0.sif \
/base/bids /base/derivatives \
participant --participant_label $sub \
--output-resolution 2 \
--recon_input /base/derivatives/qsiprep \
--recon_spec mrtrix_multishell_msmt_pyafq_tractometry \
--freesurfer-input /base/derivatives/fmriprep/sourcedata/freesurfer \
--fs-license-file /opts/fs_license.txt \
--notrack \
--nthreads 9 \
-w /scratch >> $logdir/cmd_qsirecon_${PBS_JOBID}.txt
# done


torque-launch -p $logdir/chk_qsirecon_${PBS_JOBID}.txt $logdir/cmd_qsirecon_${PBS_JOBID}.txt