#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_12
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J BWA-01_16_05_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

set -x
cat $0
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

# Load modules
module load bioinfo-tools
module load bwa
module load samtools
module list

# run bwa on transposon data
# pacbio assembled genome (the contig.fasta file)
# sam files are taking much space, thus convert into bam files
# 3 environments (BHI, Hserum and Serum), thus 9 bam files total
# name outfiles the same as infiles (same individual)

# create variables for the pathes of input and output
my_assembled_genome=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/Efacium_g_assembly_08-04-2022-try01.contigs.fasta
BHI=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/transcriptomics_data/Tn-Seq_BHI
Hse=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/transcriptomics_data/Tn-Seq_HSerum
Ser=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/transcriptomics_data/Tn-Seq_Serum

out_BHI=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/06_RNA_Seq_Alignment/bwa/Tn-Seq_BHI
out_Hse=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/06_RNA_Seq_Alignment/bwa/Tn-Seq_HSerum
out_Ser=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/06_RNA_Seq_Alignment/bwa/Tn-Seq_Serum

# the index should be already have been created previously
# bwa index $my_assembled_genome

bwa mem $my_assembled_genome \
$BHI/trim_ERR1801012_pass.fastq.gz | samtools sort -o $out_BHI/ERR1801012.bam

bwa mem $my_assembled_genome \
$BHI/trim_ERR1801013_pass.fastq.gz | samtools sort -o $out_BHI/ERR1801013.bam

bwa mem $my_assembled_genome \
$BHI/trim_ERR1801014_pass.fastq.gz | samtools sort -o $out_BHI/ERR1801014.bam


bwa mem $my_assembled_genome \
$Hse/trim_ERR1801009_pass.fastq.gz | samtools sort -o $out_Hse/ERR1801009.bam

bwa mem $my_assembled_genome \
$Hse/trim_ERR1801010_pass.fastq.gz | samtools sort -o $out_Hse/ERR1801010.bam

bwa mem $my_assembled_genome \
$Hse/trim_ERR1801011_pass.fastq.gz | samtools sort -o $out_Hse/ERR1801011.bam


bwa mem $my_assembled_genome \
$Ser/trim_ERR1801006_pass.fastq.gz | samtools sort -o $out_Ser/ERR1801006.bam

bwa mem $my_assembled_genome \
$Ser/trim_ERR1801007_pass.fastq.gz | samtools sort -o $out_Ser/ERR1801007.bam

bwa mem $my_assembled_genome \
$Ser/trim_ERR1801008_pass.fastq.gz | samtools sort -o $out_Ser/ERR1801008.bam


