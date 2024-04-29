#load RADstackshelpR package
library(RADstackshelpR)

#optimize_m function will generate summary stats on your 5 iterative runs
#input can be full path to each file, or just the file name if the vcf files are in your working directory
m.out<-optimize_m(m3="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Pgrayi_m3/populations.snps.vcf",
                  m4="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Pgrayi_m4/populations.snps.vcf",
                  m5="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Pgrayi_m5/populations.snps.vcf",
                  m6="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Pgrayi_m6/populations.snps.vcf",
                  m7="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/Pgrayi_m7/populations.snps.vcf")

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
#>
#>
#> #optimize_bigM function will generate summary stats on your 8 iterative runs
M.out<-optimize_bigM(M1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M1/populations.snps.vcf",
                     M2="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M2/populations.snps.vcf",
                     M3="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M3/populations.snps.vcf",
                     M4="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M4/populations.snps.vcf",
                     M5="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M5/populations.snps.vcf",
                     M6="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M6/populations.snps.vcf",
                     M7="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M7/populations.snps.vcf",
                     M8="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/M_params/Pgrayi_M8/populations.snps.vcf")

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
n.out<-optimize_n(nequalsMminus1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  nequalsM="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n6/populations.snps.vcf",
                  nequalsMplus1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n7/populations.snps.vcf")

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




#####END OF ORIGINAL R SCRIPT. Below is an edited version that allows graphing of 8 values of n.
###This can be used as an example of how to quickly edit any of the functions to allow more
###or fewer variables. All you have to do is
###1) look at the the original function (highlight and CTRL + double click)
###2) copy it to the R script and give it a new name
###3) change the variables (n1=NULL,n2=NULL,n3=NULL,n4=NULL,n5=NULL,n6=NULL,n7=NULL,n8=NULL) to match the numbers that you want.


my_n_opt <- function(n1=NULL,n2=NULL,n3=NULL,n4=NULL,n5=NULL,n6=NULL,n7=NULL,n8=NULL){
  #initialize empty snp.df
  snp.df<- data.frame(var=character(), snps=numeric())
  #initialize empty loci.df
  loci.df<- data.frame(var=character(), loci=numeric())
  #initialize empty snp.80.df
  snp.80.df<- data.frame(var=character(), snps.80=numeric())
  #initialize empty loci.80.df
  loci.80.df<- data.frame(var=character(), loci.80=numeric())
  #set vector of m identifiers
  ms<-c("n1","n2","n3","n4","n5","n6","n7","n8")
  #start on first position in vector of m identifiers
  j=1

  #open for loop for each m identifier
  for(x in list(n1,n2,n3,n4,n5,n6,n7,n8)){
    #open if else statement, if no m of given value, move j up to next m identifier, else calculate snps/loci retained
    if(is.null(x)){j=j+1} else{
      ##read in vcfR
      invisible(utils::capture.output(vcf.r<- vcfR::read.vcfR(x))) #read in all data
      #initialize vectors to hold filt level, snps retained, poly loci retained
      snps<- vector("numeric", length = ncol(vcf.r@gt)-1)
      poly.loci<- vector("numeric", length = ncol(vcf.r@gt)-1)
      ###rep m identifier, times = number of samples in the vcf
      m<- rep(ms[j], times = ncol(vcf.r@gt)-1)
      ##run loop to fill up vectors with a value for each filter level
      k=1
      for (i in 2:ncol(vcf.r@gt)){
        #calculate the number of non-missing SNPs present in the given sample
        snps[k]<-sum(is.na(vcf.r@gt[,i]) == FALSE)
        #calculate number of polymorphic loci present in the given sample
        poly.loci[k]<-length(unique(vcf.r@fix[,1][is.na(vcf.r@gt[,i]) == FALSE]))
        k=k+1
        #close for loop
      }
      #append each to existing df
      snp.df<- rbind(snp.df, as.data.frame(cbind(m, snps)))
      loci.df<- rbind(loci.df, as.data.frame(cbind(m, poly.loci)))

      #calculate the number of loci and SNPs retained in the 80% complete dataset for the given m value
      snps.80<-nrow(vcf.r@gt[(rowSums(is.na(vcf.r@gt))/ncol(vcf.r@gt) <= .2),])
      #calculate number of polymorphic loci retained at this cutoff
      poly.loci.80<-length(unique(vcf.r@fix[,1][(rowSums(is.na(vcf.r@gt))/ncol(vcf.r@gt) <= .2)]))
      #append each to existing df
      snp.80.df<- rbind(snp.80.df, as.data.frame(cbind(ms[j], snps.80)))
      loci.80.df<- rbind(loci.80.df, as.data.frame(cbind(ms[j], poly.loci.80)))

      #set j for the next m identifier for next time we go through this loop
      j=j+1
      #close if else statement
    }
    #close for loop
  }

  #fix colnames
  colnames(snp.80.df)<-c("var","snps.80")
  colnames(loci.80.df)<-c("var","poly.loci.80")
  colnames(snp.df)<-c("var","snps")
  colnames(loci.df)<-c("var","poly.loci")

  #return the depth and snp/loci dataframes in case you want to do your own visualizations
  out <- list()
  out$snp<-snp.df
  out$loci<-loci.df
  out$snp.R80<-snp.80.df
  out$loci.R80<-loci.80.df
  return(out)
  #close function
}

n.out<-my_n_opt(n1="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n2="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n3="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n4="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n5="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n6="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n7="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n5/populations.snps.vcf",
                  n8="C:/Users/Usuario/Dropbox/Robert-Cassidy/Librerias Cnidarios/STACKS/Parameter_optimization/n_params/Pgrayi_n6/populations.snps.vcf")

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
