#!/bin/bash

#Usage: bash jobpip.sh

#first job
jobid=$(sbatch  5nmk.16.sh  | cut -f 4 -d' ')
echo $jobid

#Dependent Jobs
for i in {17..30}
do
    jobid=`sbatch -d afterany:$jobid 5nmk.$i.sh | cut -f 4 -d' '`
    echo $jobid
done
