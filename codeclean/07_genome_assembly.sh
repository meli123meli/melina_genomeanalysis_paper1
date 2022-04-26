#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J g_assembly01_08_04_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# run canu for assembly
# after d is the folder to save the output in
# the last folder path is from where we get the input data
canu \
 -d /home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/01_genome_assembly/02_canu/ \
 -p Efacium_g_assembly_08-04-2022-try01 \
 genomeSize=3m \
 useGrid=false maxMemory=10g corThreads=2 \
 -pacbio-raw /home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/genomics_data/PacBio/*.fastq.gz


