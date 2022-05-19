#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH --reservation=uppmax2022-2-5_12
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J htseq-01_16_05_2022
#SBATCH --mail-type=ALL
#SBATCH --mail-user melinatonimarie.martin.0595@student.uu.se

set -x
cat $0
echo QOS = $SLURM_JOB_QOS
echo JOB = $SLURM_JOBID

# Load modules
module load bioinfo-tools
module load samtools
module load htseq
module list


# run htseq for differential expression analysis
# gff file from PacBio annotation
# input files are in bam format
# -t and -i is found in my annotation file
# -s we have fwd and rev

outf=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/07_diff_expr_analysis/htseq_tn
bwa=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/06_RNA_Seq_Alignment/bwa
gff_genome=/home/melinam/genome_analysis/melina_genomeanalysis_paper1/analyses/03_genome_annotation/prokka/g_annotation_21_04_2022_try01.gff

#for x in $bwa/RNA_BH/*.bam;do echo "${x##*/}" > test2.txt;done

# index for bam files

for x in $bwa/Tn-Seq_BHI/*.bam;do samtools index $x;done

for x in $bwa/Tn-Seq_HSerum/*.bam;do samtools index $x;done

for x in $bwa/Tn-Seq_Serum/*.bam;do samtools index $x;done



for x in $bwa/Tn-Seq_BHI/*.bam;do htseq-count $x $gff_genome -f bam -r pos -t CDS -i ID -s no > $outf/BHI_Tn/"${x##*/}".txt;done

for x in $bwa/Tn-Seq_HSerum/*.bam;do htseq-count $x $gff_genome -f bam -r pos -t CDS -i ID -s no > $outf/Hserum_Tn/"${x##*/}";done

for x in $bwa/Tn-Seq_Serum/*.bam;do htseq-count $x $gff_genome -f bam -r pos -t CDS -i ID -s no > $outf/Serum_Tn/"${x##*/}";done





