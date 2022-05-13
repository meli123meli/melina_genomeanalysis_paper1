#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J genome_annotation01_21_04_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

set -x
cat $0
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

# Load modules
module load bioinfo-tools
module load prokka
module list

# perform genome annotation with prokka
# first the contig file
# then path to folder for saving output
# forcecommand overwrites existing output folder
prokka /home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/Efacium_g_assembly_08-04-2022-try01.contigs.fasta \
 --outdir /home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/03_genome_annotation/prokka/ \
 --force --addgenes \
 --prefix g_annotation_21_04_2022_try01 \
 --genus Enterococcus --species faecium --strain E745 \





