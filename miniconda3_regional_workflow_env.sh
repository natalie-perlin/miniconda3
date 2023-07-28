#!/bin/bash
# Initialize Lmod:
echo $LMOD_PKG
ENV=$LMOD_PKG/init/profile
source $ENV
export BASH_ENV=$LMOD_PKG/init/bash
#
PREFIX0=${1:-"/lustre/miniconda3"}
version=${2:-"4.12.0"}
MODULEFILES="${PREFIX0}/modulefiles"
module use $MODULEFILES
module avail miniconda3
module load  miniconda3/$version
#
# Create and install regional_workflow environment
ENV_NAME="regional_workflow"
conda env list
conda env create --name $ENV_NAME --file=${ENV_NAME}.yaml 
#
conda activate $ENV_NAME
conda list # verify the packages installed
#
env_recipes="${PREFIX0}/environments"
[[ -d "$env_recipes" ]] || mkdir -p $env_recipes
conda list --export > $env_recipes/${ENV_NAME}.txt
conda list --explicit > $env_recipes/${ENV_NAME}.explicit.txt
conda env export > $env_recipes/${ENV_NAME}.yaml
#
conda deactivate
echo "Installed the packages for $ENV_NAME environment!"
exit 0
