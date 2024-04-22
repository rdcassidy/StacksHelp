#load RADstackshelpR package
library(RADstackshelpR)

#optimize_m function will generate summary stats on your 5 iterative runs
#input can be full path to each file, or just the file name if the vcf files are in your working directory
m.out<-optimize_m(m3="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Alcynodig_m3/populations.snps.vcf",
                  m4="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Alcynodig_m4/populations.snps.vcf",
                  m5="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Alcynodig_m5/populations.snps.vcf",
                  m6="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Alcynodig_m6/populations.snps.vcf",
                  m7="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Alcynodig_m7/populations.snps.vcf")

#Assigning the output of this function to the variable 'm.out' should generate a list containing five objects of class 'data.frame' with the following characteristics: 'depth' showing depth per sample for each m value, 'snp' showing the number of non-missing SNPs retained in each sample at each m value, 'loci' showing the number of non-missing loci retained in each sample at each m value, 'snp.R80' showing the total number of SNPs retained at an 80% completeness cutoff, and 'loci.R80' showing the total number of polymorphic loci retained at an 80% completeness cutoff.

#Use this output list as input for this function, to visualize the effect of varying m on the depth of each sample
vis_depth(output = m.out)
#> [1] "Visualize how different values of m affect average depth in each sample"
#> Picking joint bandwidth of 9.53
#> 
#> #visualize the effect of varying m on the number of SNPs retained
vis_snps(output = m.out, stacks_param = "m")
#> Visualize how different values of m affect number of SNPs retained.
#> Density plot shows the distribution of the number of SNPs retained in each sample,
#> while the asterisk denotes the total number of SNPs retained at an 80% completeness cutoff.
#> Picking joint bandwidth of 7190
#> 
#> 
#> #visualize the effect of varying m on the number of loci retained
vis_loci(output = m.out, stacks_param = "m")
#> Visualize how different values of m affect number of polymorphic loci retained.
#> Density plot shows the distribution of the number of loci retained in each sample,
#> while the asterisk denotes the total number of loci retained at an 80% completeness cutoff. The optimal value is denoted by red color.
#> Picking joint bandwidth of 3420


#> #optimize_bigM function will generate summary stats on your 8 iterative runs
M.out<-optimize_bigM(M1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M1/populations.snps.vcf",
                     M2="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M2/populations.snps.vcf",
                     M3="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M3/populations.snps.vcf",
                     M4="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M4/populations.snps.vcf",
                     M5="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M5/populations.snps.vcf",
                     M6="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M6/populations.snps.vcf",
                     M7="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M7/populations.snps.vcf",
                     M8="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Alcysp_nodig_M8/populations.snps.vcf")

#Assigning the output of this function to the variable 'M.out' should generate a list containing four objects of class 'data.frame' with the following characteristics: 'snp' showing the number of non-missing SNPs retained in each sample at each m value, 'loci' showing the number of non-missing loci retained in each sample at each m value, 'snp.R80' showing the total number of SNPs retained at an 80% completeness cutoff, and 'loci.R80' showing the total number of polymorphic loci retained at an 80% completeness cutoff.

#use this function to visualize the effect of varying 'M' on the number of SNPs retained
vis_snps(output = M.out, stacks_param = "M")
#> Visualize how different values of M affect number of SNPs retained.
#> Density plot shows the distribution of the number of SNPs retained in each sample,
#> while the asterisk denotes the total number of SNPs retained at an 80% completeness cutoff.
#> Picking joint bandwidth of 6090
#visualize the effect of varying 'M' on the number of polymorphic loci retained
vis_loci(output = M.out, stacks_param = "M")
#> Visualize how different values of M affect number of polymorphic loci retained.
#> Density plot shows the distribution of the number of loci retained in each sample,
#> while the asterisk denotes the total number of loci retained at an 80% completeness cutoff. The optimal value is denoted by red color.
#> Picking joint bandwidth of 2920
#> 
#> #optimize n
n.out<-optimize_n(nequalsMminus1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Alcysp_nodig_n2/populations.snps.vcf",
                  nequalsM="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Alcysp_nodig_n3/populations.snps.vcf",
                  nequalsMplus1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Alcysp_nodig_n4/populations.snps.vcf")

##Assigning the output of this function to the variable 'n.out' should generate a single object of class 'data.frame' showing the number of SNPs and loci retained across filtering levels for each value of n.

#visualize the effect of varying n on the number of SNPs retained
vis_snps(output = n.out, stacks_param = "n")
#> Visualize how different values of n affect number of SNPs retained.
#> Density plot shows the distribution of the number of SNPs retained in each sample,
#> while the asterisk denotes the total number of SNPs retained at an 80% completeness cutoff.
#> Picking joint bandwidth of 7420
#visualize the effect of varying n on the number of polymorphic loci retained
vis_loci(output = n.out, stacks_param = "n")
#> Visualize how different values of n affect number of polymorphic loci retained.
#> Density plot shows the distribution of the number of loci retained in each sample,
#> while the asterisk denotes the total number of loci retained at an 80% completeness cutoff. The optimal value is denoted by red color.
#> Picking joint bandwidth of 3230
#> 
#> #load gridExtra package to combine ggplot visualizations
library(gridExtra)

#combine all of these prior visulizations in a single list
gl<-list()
gl[[1]]<-vis_depth(output = m.out)
#> [1] "Visualize how different values of m affect average depth in each sample"
gl[[2]]<-vis_snps(output = m.out, stacks_param = "m")
#> Visualize how different values of m affect number of SNPs retained.
#> Density plot shows the distribution of the number of SNPs retained in each sample,
#> while the asterisk denotes the total number of SNPs retained at an 80% completeness cutoff.
gl[[3]]<-vis_loci(output = m.out, stacks_param = "m")
#> Visualize how different values of m affect number of polymorphic loci retained.
#> Density plot shows the distribution of the number of loci retained in each sample,
#> while the asterisk denotes the total number of loci retained at an 80% completeness cutoff. The optimal value is denoted by red color.
gl[[4]]<-vis_snps(output = M.out, stacks_param = "M")
#> Visualize how different values of M affect number of SNPs retained.
#> Density plot shows the distribution of the number of SNPs retained in each sample,
#> while the asterisk denotes the total number of SNPs retained at an 80% completeness cutoff.
gl[[5]]<-vis_loci(output = M.out, stacks_param = "M")
#> Visualize how different values of M affect number of polymorphic loci retained.
#> Density plot shows the distribution of the number of loci retained in each sample,
#> while the asterisk denotes the total number of loci retained at an 80% completeness cutoff. The optimal value is denoted by red color.
gl[[6]]<-vis_snps(output = n.out, stacks_param = "n")
#> Visualize how different values of n affect number of SNPs retained.
#> Density plot shows the distribution of the number of SNPs retained in each sample,
#> while the asterisk denotes the total number of SNPs retained at an 80% completeness cutoff.
gl[[7]]<-vis_loci(output = n.out, stacks_param = "n")
#> Visualize how different values of n affect number of polymorphic loci retained.
#> Density plot shows the distribution of the number of loci retained in each sample,
#> while the asterisk denotes the total number of loci retained at an 80% completeness cutoff. The optimal value is denoted by red color.

#visualize each item of the list as part of a single grid
grid.arrange(grobs = gl, widths = c(1,1,1,1,1,1),
             layout_matrix = rbind(c(1,1,2,2,3,3),
                                   c(4,4,4,5,5,5),
                                   c(6,6,6,7,7,7))
)
#> Picking joint bandwidth of 9.53
#> Picking joint bandwidth of 7190
#> Picking joint bandwidth of 3420
#> Picking joint bandwidth of 6090
#> Picking joint bandwidth of 2920
#> Picking joint bandwidth of 7420
#> Picking joint bandwidth of 3230

