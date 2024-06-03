#!/bin/bash
#SBATCH --job-name="SNPfilterCHR_Prim"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula/array_out/SNPfilterCHR_Prim_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula/array_out/SNPfilterCHR_Prim_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=4G
#SBATCH --array=1-11%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-1- Define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula

working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula #directory for the VCF files


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Prim_output.txt) ### This is a list containing output names
orgVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Prim_input.txt) ### This is a list containing all VCFs with absolute paths


##-3- Run vcftools in arrary
time vcftools --gzvcf "$CHROMO".vcf.gz --minGQ 30 --max-missing 1 --remove-indels --max-alleles 2 --keep-INFO-all --recode --stdout > "$CHROMO"_filtered.vcf
#you don't need --min-alleles 2 here because you need to keep the invariant sites

time bgzip "$CHROMO"_filtered.vcf


##-4- Stats
echo "$CHROMO"_original > SiteCount_Prim"$CHROMO".txt
time bcftools view -H "$orgVCF" | wc -l >> SiteCount_Prim"$CHROMO".txt

echo "$CHROMO"_input >> SiteCount_Prim"$CHROMO".txt
time bcftools view -H "$CHROMO".vcf.gz | wc -l >> SiteCount_Prim"$CHROMO".txt

echo "$CHROMO"_filtered >> SiteCount_Prim"$CHROMO".txt
time bcftools view -H "$CHROMO"_filtered.vcf.gz | wc -l >> SiteCount_Prim"$CHROMO".txt

cat SiteCount_Prim* > SiteCount_PrimALL.txt
rm SiteCount_PrimPrim*
