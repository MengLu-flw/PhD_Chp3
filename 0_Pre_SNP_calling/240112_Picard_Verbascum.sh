#!/bin/bash
#SBATCH --job-name="Verbascum_picard"
#SBATCH --output="/home/mlu/scratch/1_VCFs/2_precalling_bam/Verbascum/Verba_picard_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/2_precalling_bam/Verbascum/Verba_picard_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=24G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-1- define variables

INDIR=/home/mlu/scratch/1_VCFs/1_aligned_bam/Verbascum #directory for the input bam files
OUTDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Verbascum #directory for the output bam files

LISTDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Verbascum #directory to find sample name list


/home/mlu/scratch/1_VCFs/1_aligned_bam/Verbascum/ML061_EKDN230035867-1A.bam

##-2- Picard sorting, remove duplicates, naming ReadGroup using a while loop

while IFS=$'\t' read -r bam name

do

time picard -Xmx22G SortSam \
      I=$INDIR/"$bam"_sort.bam \
      O=$OUTDIR/"$bam"_st.bam \
      SORT_ORDER=coordinate


time picard -Xmx22G MarkDuplicates \
      I=$OUTDIR/"$bam"_st.bam \
      O=$OUTDIR/"$bam"_dedup.bam \
      REMOVE_DUPLICATES=TRUE \
      M=$OUTDIR/"$bam"_dedup_metrics.txt

time picard -Xmx22G AddOrReplaceReadGroups \
      I=$OUTDIR/"$bam"_dedup.bam \
      O=$OUTDIR/"$bam"_dedup_RG.bam \
      RGID="$name" \
      RGLB="$bam" \
      RGPL=illumina \
      RGPU=unit1 \
      RGSM="$name" \
      CREATE_INDEX=True

done < $LISTDIR/"Verb_name.txt"



