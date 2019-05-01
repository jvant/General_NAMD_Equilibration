#!/bin/bash

#Usage: bash jobpip.sh

#first job
jobid=$(sbatch  1t21.1.sh  | cut -f 4 -d' ')
echo $jobid

#Dependent Jobs
for i in {2..15}
do
    jobid=`sbatch -d afterany:$jobid 1t21.$i.sh | cut -f 4 -d' '`
    echo $jobid
done
