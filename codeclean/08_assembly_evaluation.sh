#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_4
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 07:00:00
#SBATCH -J assembly_evaluation_01_19_04_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# run assembly evaluation of pacbio data 
# they come from the run 08-04-2022 in the 02_canu folder
# here with quast
# first input is the contig file from my assembly
# o for output file directory
# r for reference genome path


quast.py \
 /home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/Efacium_g_assembly_08-04-2022-try01.contigs.fasta \
 -o /home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/02_assembly_evaluation/quast/ \
 -r /home/melinam/genome_analysis/melina_genomeanalysis_paper1/code/GCF_009734005.1_ASM973400v2_genomic.fna.gz





