# General_NAMD_Equilibration
These scripts are meant to build, minimize and equilibrate as system

First step create the following directories
systems
put_pdbs_here

Second step place your pdbs which you want to equilibrate in put_pdbs_here directory.  Make sure these pdbs contain only what you wish to simulate and that their names start with a 4 digit alpha/numeric code.

Third step:  bash initiate_system_dirs.sh script

fourth step: bash the Build_wrapper_first-step.sh script

fith step bash make-configuration-files_second-step.sh

6th step: bash run_all_systems.sh script
