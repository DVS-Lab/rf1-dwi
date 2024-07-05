#!/bin/bash

# ensure paths are correct
maindir=~/work/rf1-dwi #this should be the only line that has to change if the rest of the script is set up correctly
scriptdir=$maindir/code

mapfile -t myArray < ${scriptdir}/sublist.txt

ntasks=12
counter=0
while [ $counter -lt ${#myArray[@]} ]; do
	subjects=${myArray[@]:$counter:$ntasks}
	echo $subjects
	let counter=$counter+$ntasks
	qsub -v subjects="${subjects[@]}" qsirecon-noddi.qsub
done
