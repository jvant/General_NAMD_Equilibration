#!/bin/bash

#Usage: bash jobpip.sh

#first job
jobid=$(sbatch  4l3c.16.sh  | cut -f 4 -d' ')
echo $jobid

#Dependent Jobs
for i in {17..30}
do
    jobid=`sbatch -d afterany:$jobid 4l3c.$i.sh | cut -f 4 -d' '`
    echo $jobid
done
