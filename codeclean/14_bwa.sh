#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J BWA-01_28_04_2022
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

# run bwa
# raw RNA and my pacbio assembled genome (the contig.fasta file)
# sam files are taking much space, thus convert into bam files
# use trim-paired RNA data 
# same nr (same individual) but 1 and 2, fwd and rev, use together, with genome, for one bam file
# so 3 bam files per environment, 2 environments (serum, BH), thus 6 bam files total
# can use course-folder proj/uppmax.......genomeanalysis../nobackup/work, put sam files here
# bwa mem rnafile1 rnafile2 rnafile3 | samtools -sort -o outfile1 outfile2 outfile3
# name outfiles the same as infiles (same individual)

# create variables for the pathes of input and output
my_assembled_genome=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/Efacium_g_assembly_08-04-2022-try01.contigs.fasta
raw_rna_serum=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/transcriptomics_data/RNA-Seq_Serum
raw_rna_bh=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/transcriptomics_data/RNA-Seq_BH
out_rna_serum=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/06_RNA_Seq_Alignment/bwa/RNA_serum
out_rna_bh=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/06_RNA_Seq_Alignment/bwa/RNA_BH

bwa index $my_assembled_genome

bwa mem $my_assembled_genome \
$raw_rna_serum/trim_paired_ERR1797969_pass_1.fastq.gz \
$raw_rna_serum/trim_paired_ERR1797969_pass_2.fastq.gz | samtools sort -o $out_rna_serum/ERR1797969.bam

bwa mem $my_assembled_genome \
$raw_rna_serum/trim_paired_ERR1797970_pass_1.fastq.gz \
$raw_rna_serum/trim_paired_ERR1797970_pass_2.fastq.gz | samtools sort -o $out_rna_serum/ERR1797970.bam

bwa mem $my_assembled_genome \
$raw_rna_serum/trim_paired_ERR1797971_pass_1.fastq.gz \
$raw_rna_serum/trim_paired_ERR1797971_pass_2.fastq.gz | samtools sort -o $out_rna_serum/ERR1797971.bam


bwa mem $my_assembled_genome \
$raw_rna_bh/trim_paired_ERR1797972_pass_1.fastq.gz \
$raw_rna_bh/trim_paired_ERR1797972_pass_2.fastq.gz | samtools sort -o $out_rna_bh/ERR1797972.bam

bwa mem $my_assembled_genome \
$raw_rna_bh/trim_paired_ERR1797973_pass_1.fastq.gz \
$raw_rna_bh/trim_paired_ERR1797973_pass_2.fastq.gz | samtools sort -o $out_rna_bh/ERR1797973.bam

bwa mem $my_assembled_genome \
$raw_rna_bh/trim_paired_ERR1797974_pass_1.fastq.gz \
$raw_rna_bh/trim_paired_ERR1797974_pass_2.fastq.gz | samtools sort -o $out_rna_bh/ERR1797974.bam


