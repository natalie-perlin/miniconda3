#!/bin/bash
# Initialize Lmod:
echo $LMOD_PKG 
ENV=$LMOD_PKG/init/profile
source $ENV
export BASH_ENV=$LMOD_PKG/init/bash
#
set -x
name="miniconda3"
version="4.12.0"
PREFIX0=${1:-"/lustre/$name"}
PREFIX="${PREFIX0}/${version}"
URL="https://repo.anaconda.com/miniconda"
installer="Miniconda3-py39_4.12.0-Linux-x86_64.sh"
[[ -f "$installer" ]] || wget -nv $URL/$installer
# The PREFIX below is the target installation, try local directory first
[[ -d $PREFIX ]] && echo "Directory $PREFIX exists"
bash $installer -b -p $PREFIX -s
export CONDA_ROOT=$PREFIX
export CONDARC=$CONDA_ROOT/.condarc
export CONDA_ENVS_DIRS=$CONDA_ROOT/envs
export CONDA_PKGS_DIRS=$CONDA_ROOT/pkgs
echo "sourcing conda.sh"
PS1=
source $PREFIX/etc/profile.d/conda.sh
echo "disabling conda auto updates"
conda config --system --set auto_update_conda False
echo "install $version of miniconda3, installer = $installer"
conda install -yq conda=$version
# You may need to install ncurses from conda-forge
# to prevent warnings or errors about "no version information available"
# from Linux dynamic linker
conda install -c conda-forge -y ncurses
# Add git-lfs package to the base conda environment
conda install -y git-lfs
# The above steps only install base miniconda3 environment
# A modulefile for miniconda3 still needs to be created, using a template
# Verify that the lua module template is present 
#  A template miniconda3template.lua - needs to have a correct path for 
#  the "prefix" variable, which is likely $PREFIX0 without "/miniconda3"
# 
# Create a directory for the modulefiles, $MODULEFILES
# Copy and rename the template modulefile (miniconda3template.lua) to the new modulefile:
#   cp -v ${TEMPLATES}/miniconda3template.lua ${MODULEFILES}/miniconda3/{version}.lua
TEMPLATES=$PWD
MODULEFILES="${PREFIX0}/modulefiles"
[[ -d "${MODULEFILES}/miniconda3" ]] || mkdir -p ${MODULEFILES}/miniconda3/
if [[ -f "${TEMPLATES}/miniconda3template.lua" ]]; then
  sed "s|local prefix.*|local prefix=\"$PREFIX0\"|" ${TEMPLATES}/miniconda3template.lua  >  ${MODULEFILES}/miniconda3/${version}.lua
fi  
echo "Finished installation of $name, version $version"
