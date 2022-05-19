# 19 Tn-Seq: Differential Expression Analysis with DESeq2

getwd()
setwd("D:/2021/MasterBioinformatik/2-2-GenomeAnalysis/project/presentation")

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("DESeq2", version = "3.10")

library("DESeq2")

# BHI and Serum

# partly from here https://www.biostars.org/p/343138/

path_BHI_Ser <- "D:/2021/MasterBioinformatik/2-2-GenomeAnalysis/project/presentation/Tn_all/BHI_Ser"
files_BHI_Ser <- grep("ERR180", list.files(path_BHI_Ser), value=TRUE)
files_BHI_Ser
cond_BHI_Ser <- c('serum','serum','serum', 'BHI', 'BHI', 'BHI')
table_BHI_Ser <- data.frame(sampleName = files_BHI_Ser,
                    fileName = files_BHI_Ser,
                    condition = cond_BHI_Ser)

ddsHTSEQ_BHI_Ser <- DESeqDataSetFromHTSeqCount(sampleTable=table_BHI_Ser,
                                       directory=path_BHI_Ser,
                                       design= ~ condition)

dds_BHI_Ser <- DESeq(ddsHTSEQ_BHI_Ser)

deseqresults_BHI_Ser <- results(dds_BHI_Ser)
deseqresults_BHI_Ser
summary(deseqresults_BHI_Ser)

# Serum is considered to be 0
head(deseqresults_BHI_Ser[order(-deseqresults_BHI_Ser$log2FoldChange),],5)
head(deseqresults_BHI_Ser[order(decreasing=TRUE,-deseqresults_BHI_Ser$log2FoldChange),],5)

# Diagnostic plots(3.6 https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf)
plotMA(deseqresults_BHI_Ser, ylim = c(-24, 24))



#############################################################################


# Serum and Hserum

# partly from here https://www.biostars.org/p/343138/

path_Ser_Hse <- "D:/2021/MasterBioinformatik/2-2-GenomeAnalysis/project/presentation/Tn_all/Ser_Hse"
files_Ser_Hse <- grep("ERR180", list.files(path_Ser_Hse), value=TRUE)
files_Ser_Hse
cond_Ser_Hse <- c('serum','serum','serum', 'Hse', 'Hse', 'Hse')
table_Ser_Hse <- data.frame(sampleName = files_Ser_Hse,
                            fileName = files_Ser_Hse,
                            condition = cond_Ser_Hse)

ddsHTSEQ_Ser_Hse <- DESeqDataSetFromHTSeqCount(sampleTable=table_Ser_Hse,
                                               directory=path_Ser_Hse,
                                               design= ~ condition)

dds_Ser_Hse <- DESeq(ddsHTSEQ_Ser_Hse)

deseqresults_Ser_Hse <- results(dds_Ser_Hse)
deseqresults_Ser_Hse
summary(deseqresults_Ser_Hse)

# Serum is considered to be 0
head(deseqresults_Ser_Hse[order(-deseqresults_Ser_Hse$log2FoldChange),],5)
head(deseqresults_Ser_Hse[order(decreasing=TRUE,-deseqresults_Ser_Hse$log2FoldChange),],5)

# Diagnostic plots(3.6 https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf)
plotMA(deseqresults_Ser_Hse, ylim = c(-24, 24))

