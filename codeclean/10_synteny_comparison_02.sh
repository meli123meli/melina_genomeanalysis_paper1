#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_6
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J synteny_comparison02_27_04_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

set -x
cat $0
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

# Load modules
module load bioinfo-tools
module load blast
module list

# perform synteny comparison with blast
# compare aligned annotated genome with reference genome from NCBI
# query is my contig fasta file, the assembled genome
# db is the reference genome
# out is the path to the output folder
# outfmt is for the format 

# I skip this step as the database is already generated from the run 10_synteny_comparison.sh
#makeblastdb -in /home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/GCF_009734005.1_ASM973400v2_genomic.fna -dbtype nucl	

blastn -db /home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/GCF_009734005.1_ASM973400v2_genomic.fna \
 -query /home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/Efacium_g_assembly_08-04-2022-try01.contigs.fasta \
 -outfmt 6 \
 -out /home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/04_synteny_comparison/01_blastn/10_synteny_blast_27-04-2022_02.out 


