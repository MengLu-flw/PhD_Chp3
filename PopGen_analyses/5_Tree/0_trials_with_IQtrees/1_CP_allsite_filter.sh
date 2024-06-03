#!/bin/bash
#SBATCH --job-name="cp_filter"
#SBATCH --output="/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_cp/Slurm/cp_filter_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_cp/Slurm/cp_filter_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=1G
#SBATCH --array=1-4
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk



##-1- define variables

OUTDIR=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_cp #directory for the output bam files

cd $OUTDIR


##-2- Set up array job input

echo $SLURM_ARRAY_TASK_ID
rawVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/rawVCF_name.txt)   ### This is a list containing all main chromosome names
newVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/filteredVCF_name.txt)   ### This is a list containing all path to ref. genomes


##-3- Run vcftools in arrary
time vcftools --gzvcf "$rawVCF".vcf.gz --minGQ 30 --minDP 10 --max-missing 0.9 --keep-INFO-all --recode --stdout > "$newVCF".vcf
#you don't need --min-alleles 2 here because you need to keep the invariant sites

time bgzip "$newVCF".vcf


