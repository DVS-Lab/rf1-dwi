#!/bin/bash

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
maindir="$(dirname "$scriptdir")"

# input data. update for cluster
inputdata=/ZPOOL/data/projects/rf1-sra-data/bids

sub=$1

# make derivatives folder if it doesn't exist.
if [ ! -d $maindir/derivatives ]; then
	mkdir -p $maindir/derivatives
fi

scratchdir=/ZPOOL/data/scratch/`whoami`
if [ ! -d $scratchdir ]; then
	mkdir -p $scratchdir
fi

TEMPLATEFLOW_DIR=/ZPOOL/data/tools/templateflow
export APPTAINERENV_TEMPLATEFLOW_HOME=/opt/templateflow

singularity run --cleanenv \
-B ${TEMPLATEFLOW_DIR}:/opt/templateflow \
-B $inputdata:/input \
-B $maindir:/base \
-B /ZPOOL/data/tools/licenses:/opts \
-B $scratchdir:/scratch \
/ZPOOL/data/tools/qsiprep-0.20.0.simg \
/input /base/derivatives/qsirecon-dsiautotrack \
participant --participant_label $sub \
--output-resolution 2 \
--recon_input /base/derivatives/qsiprep \
--recon_spec dsi_studio_autotrack \
--fs-license-file /opts/fs_license.txt \
-w /scratch

