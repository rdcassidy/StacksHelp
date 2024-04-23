#!/bin/sh
#designate all sample ID's to a single variable called 'files', each sample should be in the directory, and the filename should match this designation except for the extension, e.g., 'sample_2' = 'sample_2.fq.gz'
files="Leptsarm-AmAnar-M05
Leptsarm-Mor-M89
Leptsarm-Roji-M63"

#set absolute path variables for Processed reads (radtags output), output location (Stacks/Taxaname),
#and popmap. Be careful about starting/ending the path on a /. It should be exactly the same as the example below in this sense.

Taxa='Leptsarm' ####this taxa name needs to exactly match the Taxa variable from the opt_M script
Popmap='/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/PopMaps/Popmap_Leptsarm_subset.txt' #same as opt_M
Stacks='/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/Stacks' #same as opt_M
OptM='4' ## THIS SHOULD BE THE OPTIMAL VALUE OF 'M' ACCORDING TO THE R SCRIPT YOU JUST RAN
Processed='/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/Processed' #same as opt_M

###IMPORTANT: In this loop, you need to change the numbers in {3..5} to be equal to M - 1 and M + 1. 
### For example, if you M = 5 from your optimization runs, below you should replace {3..5} with {4..6}
for i in {3..5}   
do
#create a directory to hold this unique iteration:
mkdir $Stacks/${Taxa}_n$i
#copy ustacks output from the previous, optimal run of M.
cp ${Stacks}/${Taxa}_M${OptM}/*.tsv $Stacks/${Taxa}_n$i
## Run cstacks to compile stacks between samples. Popmap is a file in working directory called 'pipeline_popmap.txt
cstacks -n $i -M $Popmap -P $Stacks/${Taxa}_n$i
## Run sstacks. Match all samples supplied in the population map against the catalog.
sstacks -P $Stacks/${Taxa}_n$i -M $Popmap
## Run tsv2bam to transpose the data so it is stored by locus, instead of by sample.
tsv2bam -P $Stacks/${Taxa}_n$i -M $Popmap -R $Processed/
## Run gstacks: build a paired-end contig from the metapopulation data (if paired-reads provided),
## align reads per sample, call variant sites in the population, genotypes in each individual.
gstacks -P $Stacks/${Taxa}_n$i -M $Popmap -t 32
## Run populations completely unfiltered and output unfiltered vcf, for input to the RADstackshelpR package
populations -P $Stacks/${Taxa}_n$i -M $Popmap --vcf -t 32
done