# 16 RNA: Differential Expression Analysis with DESeq2

getwd()
setwd("D:/2021/MasterBioinformatik/2-2-GenomeAnalysis/project/presentation")

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("DESeq2", version = "3.10")

library("DESeq2")

# partly from here https://www.biostars.org/p/343138/

path_both <- "D:/2021/MasterBioinformatik/2-2-GenomeAnalysis/project/presentation/RNA_both"
files_both <- grep("ERR1797", list.files(path_both), value=TRUE)
files_both
condition <- c('serum','serum','serum', 'BH', 'BH', 'BH')
table <- data.frame(sampleName = files_both,
                    fileName = files_both,
                    condition = condition)

ddsHTSEQ <- DESeqDataSetFromHTSeqCount(sampleTable=table,
                                       directory=path_both,
                                       design= ~ condition)

dds <- DESeq(ddsHTSEQ)

deseqresults <- results(dds)
deseqresults
summary(deseqresults)

# serum is considered to be 0
head(deseqresults[order(-deseqresults$log2FoldChange),],5)
head(deseqresults[order(decreasing=TRUE,-deseqresults$log2FoldChange),],5)

# Diagnostic plots(3.6 https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf)
plotMA(deseqresults, ylim = c(-10, 10))



