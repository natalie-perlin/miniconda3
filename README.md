# Installation of miniconda3, miniconda3 module for Lmod module environment (Lua-based), and conda environements (e.g., workflow_tools, regional_workflow)

1. Find a right installer script to download from **URL="https://repo.anaconda.com/miniconda"**, or determine its correct name, e.g., `Miniconda3-py39_4.12.0-Linux-x86_64.sh`

2. Modify a wrapper script **miniconda3_install.sh**, if needed, to specify the installer script name to use or download from the URL (as in step 1).  
          e.g., `installer="Miniconda3-py39_4.12.0-Linux-x86_64.sh"`

3. Verify that a modulefile **miniconda3template.lua** template is present in a directory from which the runscript is lauched.

4. Run the installation script wrapper, with optional arguments:
    (1) installation directory,  (2) conda version 
   E.g,: `./miniconda3_install.sh /lustre/miniconda  4.12.0 `
   
5. Create a **regional_workflow** environment with the packages needed to run the UFS-SRW
   App and to use graphic packages for plotting. Packages to be installed are listed
   in `regional_workflow.yaml` file that is expected to be present in the same 
   directory as the installation script  **miniconda3_regional_workflow_env.sh**.   
   Launch it and provide optional arguments similar to Step 4, e.g.:
   `./miniconda3_regional_workflow_env.sh  /lustre/miniconda  4.12.0 `

6. Create a **workflow_toos** environment with the packages for the updated UFS-SRW
   Packages to be installed are listed
   in `workflow_tools.yaml` file that is expected to be present in the same 
   directory as the installation script  **miniconda3_workflow_tools_env.sh**.   
   Launch it and provide optional arguments similar to Steps 4-5, e.g.:
   `./miniconda3_workflow_tools_env.sh  /lustre/miniconda  4.12.0 `

7. Create a **regional_workflow_cmaq** environment with the packages for UFS-SRW
   and for Air Quality Management module (Online-CMAQ).
   Packages to be installed are listed
   in `regional_workflow_cmaq.yaml` file that is expected to be present in the same 
   directory as the installation script  **miniconda3_regional_workflow_cmaq_env.sh**.   
   Launch it and provide optional arguments similar to Steps 4-6, e.g.:
   `./miniconda3_regional_workflow_cmaq_env.sh /lustre/miniconda  4.12.0 `
