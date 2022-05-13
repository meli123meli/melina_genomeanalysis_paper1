#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_6
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J FastQC-bef-01_27_04_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

set -x
cat $0
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

# Load modules
module load bioinfo-tools
module load FastQC
module list

# perform quality control of Illumina DNA before trimming
# o is my output directory
fastqc /home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/genomics_data/Illumina/* \
 -o /home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/05_Reads_Pre-Processing/01_FastQC_bef/

