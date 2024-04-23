# StacksHelp
This is a version of a bash loop from the Stacks Manual and RadStacksHelpR that can be used to automatically run iterations of the Stacks pipeline to easily optimize parameters, and in this case has been modified to work with PAIRED END data.

Each bash script is for a different parameter. First, you should run the "m" script to iterate through values of m, then use the RadStacksHelpR "m" script to visualize the optimum value. Next, run the "M" script using the optimum value of m that you've just obtained. Then repeat the same process for "n". To keep things in order, it is best to keep one R script for each species/population subset that you are optimizing. The example listed here contains the RADStacksHelpR scripts for all parameters of one species.

For the bash scripts, the only things that you should change are 
1) the name of the individuals you want to include in your subset
2) the name of your taxon; 
3) path to the subset popmap; 
4) path to the processed rad tags; 
5) path to the output Stacks folder. 

For each parameter optimization run, in order to easily download all .vcf files using just one authentification key, use the "download_snps.sh" script to automatically name and collected the output vcfs in a downloads folder (must be premade). Below is the step-by-step guide for an example usage for the "m" parameter.


  1. Before starting the process for all subsets, I first recommend making sure you have the following folders ordered correctly.

    1- Stacks -- should have this from before
    2- Processed -- should have this from before
    3- Downloads -- Make this so you can more easily download files from the server 
    4- Params -- this can be a convenient place to store the parameter optmization scripts
 
 2. Download opt_m_final.sh and edit it in R studio or on the server in nano. The only edits should be to the header:
     a.files=   these should only include the names of the individuals in your subset
     b. Popmap - path to the popmap OR if you are using a subset, it should be the path to the subset of the
     c. Taxa - this will be the name of the folder, and it must be a name unique to this subset. For example, if you have two different subsets of Phakellia robustus, this could be something like "Prob1". For this subset, its easiest to use the same name for the M and n runs.
     d. Path to the stacks folder -- this should presumably be the same for all subsets across the m, M, and n runs.
     e. Path to processed radtags -- this should presumably be the same for all subsets across the m, M, and n runs.

Notes: be extra, extra careful with files paths and with making sure that the popmaps match the individuals. 

3. Once you have this saved in the server as a .sh file (for example, in Params/opt_m_species1.sh), enter the server terminal and type:
     bash path/to/opt_m_species1
If this doesn't work then try again with the following two commands: 
     dos2unix path/to/opt_m_species1
     bash path/to/opt_m_species1

4. Upload the download.snps.sh file and edit the paths so that they are correct for the following folders:
      1.  Downloads='path/to/Downloads'
      2.  Taxa='same_name_as_in_other_script'
      3.  Param='m'

5. In order to easily move all of the output 'population.snps.vcf' from your optimizatoin runs, now run the command: 
    bash Path/to/download.snps.sh

6. Use a wildcard ( * ) to download all appropriate files from download folder. If your computer doesn't let you from the server using a wildcard, try installing Ubuntu and doing it through there.

7. Use the R script (example is on this github) to analyze the optimal parameters for "m" (you only need to enter your paths to the downloaded .vcf files you just downloaded and run the first couple commands).
8. Open the opt_M.sh file and repeat the same process. **But with the value for " -m " set to the optimal value**

It is best to use the same R script for all m, M, and n parameters for a subset. Once you have finished all the runs, you can then combine them into one graphic to put in your notes.
       




