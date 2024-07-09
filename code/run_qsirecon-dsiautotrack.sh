#!/bin/bash

# ensure paths are correct
maindir=~/work/rf1-dwi #this should be the only line that has to change if the rest of the script is set up correctly
scriptdir=$maindir/code

mapfile -t myArray < ${scriptdir}/sublist.txt

# make array based on what actually needs to be run
for sub in ${myArray[@]}; do
	slines=${maindir}/derivatives/qsirecon-dsiautotrack/qsirecon-DSIStudio/${sub}/dwi/${sub}_space-T1w_desc-preproc_bundle-ProjectionBasalGanglia_FornixR_streamlines.tck
	html=${maindir}/derivatives/qsirecon-dsiautotrack/qsirecon/${sub}.html
	if [ ! -e $slines ] || [ ! -e $html ]; then
		missingSubs+=( $sub )
	fi
done

ntasks=15
counter=0
while [ $counter -lt ${#missingSubs[@]} ]; do
	subjects=${missingSubs[@]:$counter:$ntasks}
	echo $subjects
	let counter=$counter+$ntasks
	qsub -v subjects="${subjects[@]}" qsirecon-dsiautotrack.qsub
done
