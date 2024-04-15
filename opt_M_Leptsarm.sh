#!/bin/sh
#designate all sample ID's to a single variable called 'files', each sample should be in the directory, and the filename should match this designation except for the extension, e.g., 'sample_2' = 'sample_2.fq.gz'
files="Leptsarm-AmAnar-M05
Leptsarm-AmAnar-M273
Leptsarm-AmAnar-M292
Leptsarm-AmAnar-M349
Leptsarm-Mor-M89
Leptsarm-Roji-M63"

#set absolute path variables for Processed reads (radtags output), output location (Stacks/Taxaname), 
#and popmap. Be careful about starting/ending the path on a /. It should be exactly the same as the example below in this sense. 

Taxa='Leptsarm'
Popmap='/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/PopMaps/Popmap_Leptsarm_all.txt'
Processed='/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/Processed'
Stacks='/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/Stacks'

# Build loci de novo in each sample for the single-end reads only.
# -M — Maximum distance (in nucleotides) allowed between stacks (default 2).
# -m — Minimum depth of coverage required to create a stack (default 3).
#here, we will vary m from 3-7, and leave all other paramaters default

for i in {1..8}
do
#create a directory to hold this unique iteration:
mkdir $Stacks/${Taxa}_M$i
#run ustacks with m equal to the current iteration (3-7) for each sample
id=1
for sample in $files
do
    ustacks -t fastq -f $Processed/${sample}.1.fq -o $Stacks/${Taxa}_M$i -m 3 -M $i -i $id --name ${sample} -p 15 &
    let "id+=1"
done
wait

## Run cstacks to compile stacks between samples. Popmap is a file in working directory called 'pipeline_popmap.txt
cstacks -M $Popmap -P $Stacks/${Taxa}_M$i
## Run sstacks. Match all samples supplied in the population map against the catalog.
sstacks -P $Stacks/${Taxa}_M$i -M $Popmap
## Run tsv2bam to transpose the data so it is stored by locus, instead of by sample.
tsv2bam -P $Stacks/${Taxa}_M$i -M $Popmap -R $Processed/
## Run gstacks: build a paired-end contig from the metapopulation data (if paired-reads provided),
## align reads per sample, call variant sites in the population, genotypes in each individual.
gstacks -P $Stacks/${Taxa}_M$i -M $Popmap -t 15
## Run populations completely unfiltered and output unfiltered vcf, for input to the RADstackshelpR package
populations -P $Stacks/${Taxa}_M$i -M $Popmap --vcf -t 15
done
