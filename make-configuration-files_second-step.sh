#!/bin/bash

## Usage: bash make-configuration-files.sh

# 3 configuration files needed
# minimization-template.inp
# no-minimization-template.inp
# step1_template.inp

echo "what is the name of your PDB file w/o extention? E.g. <3flb-solv_ion>"
read struc
echo "what do you want to name your jobs?"
read name

cd ./namd_equilibration

# Minimize for 100 ps
cat step1_template.inp > step1_equilibration.inp
sed -i s/FILENAME/$struc/ step1_equilibration.inp

# Minimize for 10 ps each step then equilibrate for 10 ps each step
for i in {2..5}
do
    cat minimization-template.inp > step$i\_equilibration.inp
    sed -i s/"STEPNUM"/"$i"/ step$i\_equilibration.inp
    sed -i s/FILENAME/$struc/ step$i\_equilibration.inp
done

# Equilibrate for 100 ps each step
for i in {6..15}
do
    cat no-minimization-template.inp > step$i\_equilibration.inp
    sed -i s/"STEPNUM"/"$i"/ step$i\_equilibration.inp
    sed -i s/FILENAME/$struc/ step$i\_equilibration.inp
done

# Submission scripts
for i in {1..15}
do
    cat sbatch_template.sh > $name.$i.sh
    sed -i s/step1_equilibration/step$i\_equilibration/g $name.$i.sh
done

# make jobpip.sh script
cat jobpip_template.sh > jobpip.sh
sed -i s/NAME/$name/g jobpip.sh
