#!/bin/bash

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#for sub in `cat ${scriptdir}/sublist_all.txt` ; do
#for sub in 10617 10644 10647 10657; do
for sub in 10486; do
#for sub in ; do

	script=${scriptdir}/prepdata.sh
	NCORES=20
	while [ $(ps -ef | grep -v grep | grep $script | wc -l) -ge $NCORES ]; do
		sleep 5s
	done
   bash $script $sub &
	sleep 5s
	
done
