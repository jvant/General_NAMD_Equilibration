#!/bin/bash

echo "Enter pdb file name below.  Make sure the pdb is in the System_prep directory.  E.g. <1111.pdb>"
read FILE

cd ./System_prep
pwd
echo " "
echo "Building System :}"
echo " "
vmd -dispdev text -e build_system.pgn -args $FILE
