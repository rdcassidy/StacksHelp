#!/bin/bash

Processed_Reads="/mbl/share/workspaces/groups/riesgo/Sergi/Emuelleri/Processed"
Alignments="/mbl/share/workspaces/groups/riesgo/Sergi/Emuelleri/Genome_Alignment"
Index_dir="/mbl/share/workspaces/groups/riesgo/Sergi/Emuelleri/Genome_Alignment"
Index_name="Emu_index"

mkdir $Alignments/Aligned_RADs
mkdir $Alignments/Alignment_logs
cd $Processed_Reads

for file in *.1.fq; do
        samplename=$(basename $file .1.fq)
        echo "Aligning paired ends ${samplename}.1.fq and ${samplename}.2.fq"
        (bowtie2 -x $Index_dir/$Index_name -1 $Processed_Reads/${samplename}.1.fq -2 $Processed_Reads/${samplename}.2.fq --local -S ${samplename}_alignment.sam -p 70) 2>${samplename}.log
        samtools view -bS ${samplename}_alignment.sam -o ${samplename}_alignment.gacu.bam
        rm ${samplename}_alignment.sam
        mv ${samplename}_alignment.gacu.bam $Alignments/Aligned_RADs
        mv ${samplename}.log $Alignments/Alignment_logs
done
