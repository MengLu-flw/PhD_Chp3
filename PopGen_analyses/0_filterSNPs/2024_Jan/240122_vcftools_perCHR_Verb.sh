#!/bin/bash
#SBATCH --job-name="SNPfilterCHR_Verb"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum/array_out/SNPfilterCHR_Verb_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum/array_out/SNPfilterCHR_Verb_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=4G
#SBATCH --array=1-18%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-1- Define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum

working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum #directory for the VCF files


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Verb_output.txt) ### This is a list containing output names
orgVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Verb_input.txt) ### This is a list containing all VCFs with absolute paths


##-3- Run vcftools in arrary
time vcftools --gzvcf "$CHROMO".vcf.gz --minGQ 30 --max-missing 1 --remove-indels --max-alleles 2 --keep-INFO-all --recode --stdout > "$CHROMO"_filtered.vcf
#you don't need --min-alleles 2 here because you need to keep the invariant sites

time bgzip "$CHROMO"_filtered.vcf


##-4- Stats
echo "$CHROMO"_original > SiteCount_Verb"$CHROMO".txt
time bcftools view -H "$orgVCF" | wc -l >> SiteCount_Verb"$CHROMO".txt

echo "$CHROMO"_input >> SiteCount_Verb"$CHROMO".txt
time bcftools view -H "$CHROMO".vcf.gz | wc -l >> SiteCount_Verb"$CHROMO".txt

echo "$CHROMO"_filtered >> SiteCount_Verb"$CHROMO".txt
time bcftools view -H "$CHROMO"_filtered.vcf.gz | wc -l >> SiteCount_Verb"$CHROMO".txt

cat SiteCount_Verb* > SiteCount_VerbALL.txt
rm SiteCount_VerbVerb*


