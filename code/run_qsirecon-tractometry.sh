#!/bin/bash

# ensure paths are correct
maindir=~/work/rf1-dwi #this should be the only line that has to change if the rest of the script is set up correctly
scriptdir=$maindir/code

mapfile -t myArray < ${scriptdir}/sublist.txt

# make array based on what actually needs to be run
for sub in ${myArray[@]}; do
	dwi=${maindir}/derivatives/qsirecon-tmp/qsirecon-NODDI/${sub}/dwi/${sub}_space-T1w_desc-preproc_model-noddi_mdp-od_dwimap.nii.gz
	html=${maindir}/derivatives/qsirecon-tmp/qsirecon/${sub}.html
	if [ ! -e $dwi ] || [ ! -e $html ]; then
		missingSubs+=( $sub )
	fi
done

ntasks=4
counter=0
while [ $counter -lt ${#missingSubs[@]} ]; do
	subjects=${missingSubs[@]:$counter:$ntasks}
	echo $subjects
	let counter=$counter+$ntasks
	qsub -v subjects="${subjects[@]}" qsirecon-tractometry.qsub
done
