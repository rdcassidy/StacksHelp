#!/bin/bash


workdir="path/to/working/directory"
inpath="PATH/to/REFMAP/OUTPUT"
outpath="PATH/TO/FILTERING"
r_value="0.8"
Popmap_onegroup="popmap/without/separation"
Popmap_multigroup="popmap/separated/populations"
Taxa="Emuelleri"

mkdir ${workdir}/filtered_min_maf
mkdir ${workdir}/filtered_HWE
mkdir ${workdir}/filtered_HWE_2
mkdir ${workdir}/filtered_Ho
mkdir ${workdir}/filtered_final_data

#filter SNPs below minimum allele frequency of 0.05
populations -P ${inpath} -r ${r_value} --write-single-snp -M ${Popmap_onegroup} -O ${workdir}/filtered_min_maf --genepop --vcf --structure --radpainter --fasta-loci --min-maf 0.05

#create whitelist of SNPs >0.05 min allele freq using the sumstats output
grep -v "#" ${workdir}/filtered_min_maf/populations.sumstats.tsv | awk '{OFS="\t"; print $1}' > whitelist_${Taxa}_1_min_maf-list.txt

echo "Filtered min-maf, created whitelist"

#run populations to identify calculate HWE for the populations (using popmap with multiple populations)
populations -P ${inpath} --write-single-snp -M ${Popmap_multigroup} -O ${workdir}/filtered_HWE --genepop --vcf --structure --radpainter --fasta-loci --hwe -W whitelist_${Taxa}_1_min_maf-list.txt

#run this oneliner to create a blacklist of the variable sites departing HWE in two or more populations
#how it works: 1) takes only columns 1 and 20 of population.sumstats.tsv 2)counts the number of populations for each variable site ID below 0.05 3) selects and prints to blacklist.txt only those with 2 or more counts < 0.05

grep -v "#" ${workdir}/filtered_HWE/populations.sumstats.tsv | awk '$20<0.05 {OFS="\t"; print $1}' | sort | uniq -d > blacklist_${Taxa}_HWE.txt

echo "Filtered HWE populations under selection (>two pops with HWE<0.05) using separated populations"
#run populations again...looking at HWE for SNPs not under selection (using only ONE OR MULTIPLE populations? <<CHECK THIS)??
populations -P ${inpath} --write-single-snp -M ${Popmap_multigroup} -O ${workdir}/filtered_HWE_2 --genepop --vcf --structure --radpainter --fasta-loci -W whitelist_${Taxa}_1_min_maf-list.txt -B blacklist_${Taxa}_HWE.txt

##now make a whitelist of... filtered min-maf + HWE ... but isn't this just the opposite of the last blacklist?? or is this a recalculated HWE ignoring the SNPs under selection??
grep -v "#" ${workdir}/filtered_HWE_2/populations.sumstats.tsv | awk '{OFS="\t"; print $1}' > whitelist_${Taxa}_min_maf_HWE.txt

echo "recalculated HWE  using only SNPs that are NOT under selection, and created whitelist of said SNPs (post HWE and min-maf filtration) ???"
##looking now at Ho with populations NOT separated
populations -P ${inpath} --write-single-snp -M ${Popmap_onegroup} -O ${workdir}/filtered_Ho --hwe -W whitelist_${Taxa}_min_maf_HWE.txt

##In order to extract the list of loci with Ho (observed heterozygosity) > 0.5 (48 SNPs in total). That is, this creates a blacklist of SNPs with > 0.5 heterozygosity:

grep -v "#" ${workdir}/filtered_Ho/populations.sumstats.tsv | awk '$10>0.5 {OFS="\t"; print $1}' > blacklist_${Taxa}_Ho.txt

echo "ran populations using min-maf and HWE-filtered SNPs (??) and created blacklist of SNPs with Ho > 0.5 "

##now we run populations with the final whitelist + Ho blacklist. BUT WITH WHICH POPMAP?? PROBABLY ALL TOGETHER??
populations -P ${inpath} --write-single-snp -M ${Popmap_multigroup} -O  ${workdir}/filtered_final_data --genepop --vcf --structure --radpainter --fasta-loci --hwe -W whitelist_${Taxa}_min_maf_HWE.txt -B blacklist_${Taxa}_Ho.txt

echo "Stacks populations filtering complete: produced dataset filtered to remove SNPs outside min-maf, HWE, and Ho parameters. Ready for BLAST, I guess?"
