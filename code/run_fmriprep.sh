#!/bin/bash

# ensure paths are correct
maindir=~/work/rf1-dwi #this should be the only line that has to change if the rest of the script is set up correctly
scriptdir=$maindir/code

mapfile -t myArray < ${scriptdir}/sublist.txt

# make array based on what actually needs to be run
for sub in ${myArray[@]}; do
	surf=${maindir}/derivatives/fmriprep/${sub}/anat/${sub}_hemi-R_space-fsLR_desc-msmsulc_sphere.surf.gii
	html=${maindir}/derivatives/fmriprep/${sub}.html
	if [ ! -e $surf ] || [ ! -e $html ]; then
		missingSubs+=( $sub )
	fi
done

ntasks=4
counter=0
while [ $counter -lt ${#missingSubs[@]} ]; do
	subjects=${missingSubs[@]:$counter:$ntasks}
	echo $subjects
	let counter=$counter+$ntasks
	qsub -v subjects="${subjects[@]}" fmriprep.qsub
done
