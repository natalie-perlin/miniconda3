# Installation of miniconda3, miniconda3 module for Lmod module environment (Lua-based), and conda environements (e.g., workflow_tools, regional_workflow)

1. Clone this repository into a location where the miniconda3 package to be placed:
   ```
   git clone https://github.com/NOAA-EPIC/miniconda3.git
   cd miniconda3
   ```
   
2. Find a right installer script in **https://repo.anaconda.com/miniconda** for your system architecture and python version (python/3.9 used in this example); e.g., `Miniconda3-py39_4.12.0-Linux-x86_64.sh`. The installer could be downloaded in advance, e.g.,
   ```
   URL="https://repo.anaconda.com/miniconda"
   installer=Miniconda3-py39_4.12.0-Linux-x86_64.sh
   wget -nv $URL/$installer
   ```
   
3. Specify a correct name of the installer in a wrapper script **miniconda3_install.sh**, e.g.,
          `installer="Miniconda3-py39_4.12.0-Linux-x86_64.sh"`

4. Verify that a modulefile **miniconda3template.lua** template is present in a directory from which the runscript is lauched. Edit the `local prefix` variable in the modulefile template to specify the installation path; if the installation directory is /lustre/minconda3, the variable `local prefix` is set as following in the `miniconda3template.lua`:
  ```
  local prefix = pathJoin("/lustre/",pkgName)
  ```
  where the variable `pkgName` expands to `miniconda3`.

5. Run the installation script wrapper, with optional arguments:
    (1) installation directory,  (2) conda version 
   E.g,: `./miniconda3_install.sh /lustre/miniconda3  4.12.0 `
   If the arguments are not specified, a default installation directory is `/lustre/miniconda3`, and default conda version is `4.12.0`
   
6. Create a **regional_workflow** environment with the packages needed to run the UFS-SRW
   App and to use graphic packages for plotting. Packages to be installed are listed
   in `regional_workflow.yaml` file that is expected to be present in the same 
   directory as the installation script  **miniconda3_regional_workflow_env.sh**.   
   Launch it and provide optional arguments similar to Step 5, e.g.:
   `./miniconda3_regional_workflow_env.sh  /lustre/miniconda3  4.12.0 `

7. Create a **workflow_toos** environment with the packages for the updated UFS-SRW
   Packages to be installed are listed
   in `workflow_tools.yaml` file that is expected to be present in the same 
   directory as the installation script  **miniconda3_workflow_tools_env.sh**.   
   Launch it and provide optional arguments similar to Steps 5-6, e.g.:
   `./miniconda3_workflow_tools_env.sh  /lustre/miniconda3  4.12.0 `

8. Create a **regional_workflow_cmaq** environment with the packages for UFS-SRW
   and for Air Quality Management module (Online-CMAQ).
   Packages to be installed are listed
   in `regional_workflow_cmaq.yaml` file that is expected to be present in the same 
   directory as the installation script  **miniconda3_regional_workflow_cmaq_env.sh**.   
   Launch it and provide optional arguments similar to Steps 5-7, e.g.:
   `./miniconda3_regional_workflow_cmaq_env.sh /lustre/miniconda3  4.12.0 `
