#!/usr/bin/env bash

# This script extracts the NODDI estimates from three ROIs. 
# It first converts the ROI to T1 space, and then it takes the average within each file.
# Output is sent to a csv file in derivatives.

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
maindir="$(dirname "$scriptdir")"


mapfile -t myArray < ${scriptdir}/sublist.txt
for sub in ${myArray[@]}; do
	
	# make output directory
	mainoutput=${maindir}/derivatives/noddi-masks
	mkdir -p $mainoutput
	
	
	csvfile=${maindir}/derivatives/noddi-summary.csv
	rm -rf $csvfile
	touch $csvfile
	echo "subject,od-leftHipp,od-rightHipp,od-pcc,icvf-leftHipp,icvf-rightHipp,icvf-pcc,isovf-leftHipp,isovf-rightHipp,isovf-pcc" >> $csvfile
	
	od=${maindir}/derivatives/qsirecon-noddi/qsirecon-NODDI/${sub}/dwi/${sub}_space-T1w_desc-preproc_model-noddi_mdp-od_dwimap.nii.gz
	icvf=${maindir}/derivatives/qsirecon-noddi/qsirecon-NODDI/${sub}/dwi/${sub}_space-T1w_desc-preproc_model-noddi_mdp-icvf_dwimap.nii.gz
	isovf=${maindir}/derivatives/qsirecon-noddi/qsirecon-NODDI/${sub}/dwi/${sub}_space-T1w_desc-preproc_model-noddi_mdp-isovf_dwimap.nii.gz
		
	qsiprepdir=${maindir}/derivatives/qsiprep
	for roi in leftHipp rightHipp PCC; do
	
		# need to re-run fmriprep as space-MNI152NLin6Asym? 
		antsApplyTransforms \
		-i ${maindir}/masks/atlas-HarvOx_roi-${roi}_2mm.nii.gz \
		-r $od \
		-t ${qsiprepdir}/${sub}/anat/${sub}_from-MNI152NLin2009cAsym_to-T1w_mode-image_xfm.h5 \
		-t [${qsiprepdir}/${sub}/anat/${sub}_from-orig_to-T1w_mode-image_xfm.txt,1] \
		-n Linear \
		-o ${mainoutput}/${sub}_roi-${roi}_2mm.nii.gz
		
		 # Threshold and binarize the generated masks for both runs
		 fslmaths ${mainoutput}/${sub}_roi-${roi}_2mm.nii.gz -thr 0.5 -bin ${mainoutput}/${sub}_roi-${roi}_2mm.nii.gz
	 
	 done
	 
	odleftHipp=`fslstats $od -k ${mainoutput}/${sub}_roi-leftHipp_2mm.nii.gz -m`
	odrightHipp=`fslstats $od -k ${mainoutput}/${sub}_roi-rightHipp_2mm.nii.gz -m`
	odpcc=`fslstats $od -k ${mainoutput}/${sub}_roi-PCC_2mm.nii.gz -m`
	icvfleftHipp=`fslstats $icvf -k ${mainoutput}/${sub}_roi-leftHipp_2mm.nii.gz -m`
	icvfrightHipp=`fslstats $icvf -k ${mainoutput}/${sub}_roi-rightHipp_2mm.nii.gz -m`
	icvfpcc=`fslstats $icvf -k ${mainoutput}/${sub}_roi-PCC_2mm.nii.gz -m`
	isovfleftHipp=`fslstats $isovf -k ${mainoutput}/${sub}_roi-leftHipp_2mm.nii.gz -m`
	isovfrightHipp=`fslstats $isovf -k ${mainoutput}/${sub}_roi-rightHipp_2mm.nii.gz -m`
	isovfpcc=`fslstats $isovf -k ${mainoutput}/${sub}_roi-PCC_2mm.nii.gz -m`
	
	echo "$sub,$odleftHipp,$odrightHipp,$odpcc,$icvfleftHipp,$icvfrightHipp,$icvfpcc,$isovfleftHipp,$isovfrightHipp,$isovfpcc" >> $csvfile

done
