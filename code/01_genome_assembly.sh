#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH --reservation=uppmax2022-2-5_2
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 05:00:00
#SBATCH -J genome_assembly1
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se
# Load modules
module load bioinfo-tools
module load canu
# Your commands
# after -d is the folder to save the output in
# the last folder path is from where we get the input data
canu -d /home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/01_genome_assembly/01_canu/ -p g_assembly_out genomeSize=3m -pacbio-raw /home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/genomics_data/PacBio/*.fastq.gz


