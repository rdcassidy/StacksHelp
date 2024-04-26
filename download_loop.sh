#!/bin/sh

STACKS="/mbl/share/workspaces/groups/riesgo/Sergi/Emuelleri/Stacks" ### directory to the output folders from optimization (probably stacks)
Param='M' #parameter of outputs as it is put in the folder names (m, M or N)
Downloads="/mbl/share/workspaces/groups/riesgo/Sergi/Emuelleri/Downloads" #path to folder where you will store downloads. make this if you don't have it already
files="Emue_Subset1
Emue_Subset2
Emue_Subset3
Emue_Subset4
Emue_Subset5"
#names of the taxa/populations. for example, for the output folder Pgrayi_m3, put Pgrayi.

for sample in $files; do
    for folder in "${STACKS}/${sample}_${Param}"*; do
        cp "$folder"/populations.snps.vcf "${Downloads}/"
        echo "Copying populations.snps.vcf file from ${sample}_${Param}*"
        mv "${Downloads}/populations.snps.vcf" "${Downloads}/$(basename "$folder").vcf"
        echo "renaming populations.snps.vcf file to $(basename "$folder").vcf"
    done
done
