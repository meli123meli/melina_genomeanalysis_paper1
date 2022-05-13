#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J Trimmomatic-01_28_04_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

set -x
cat $0
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

# Load modules
module load bioinfo-tools
module load trimmomatic/0.36
module list

# trimmomatic, the order matters

# create variables
input_path=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/data/raw_data/genomics_data/Illumina
output_path=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/05_Reads_Pre-Processing/01_Trimmomatic


java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE \
$input_path/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
$input_path/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
$output_path/lane1_forward_paired.fq.gz \
$output_path/lane1_forward_unpaired.fq.gz \
$output_path/lane1_reverse_paired.fq.gz \
$output_path/lane1_reverse_unpaired.fq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


