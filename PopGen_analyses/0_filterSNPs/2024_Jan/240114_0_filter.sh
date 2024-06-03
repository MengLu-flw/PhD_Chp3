
ln -s /home/mlu/projects/rbge/mlu/4_gimble/Viola/gimble.vcf.gz /home/mlu/scratch/1_VCFs/4_filtered_SNPs/Viol_gimble.vcf.gz

ln -s /home/mlu/projects/rbge/mlu/4_gimble/Verbascum/gimble.vcf.gz /home/mlu/scratch/1_VCFs/4_filtered_SNPs/Verb_gimble.vcf.gz



#!/bin/bash
#SBATCH --job-name="filterSNP_mac"
#SBATCH --output="/home/mlu/scratch/1_VCFs/4_filtered_SNPs/Slurm/filterSNP_mac.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/4_filtered_SNPs/Slurm/filterSNP_mac.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=4G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

cd /home/mlu/scratch/1_VCFs/4_filtered_SNPs


time vcftools --gzvcf Viol_gimble.vcf.gz --minQ 30 --max-missing 1 --mac 2 --remove-indels --min-alleles 2 --max-alleles 2 --keep-INFO-all --recode --stdout > Viol_MACfiltered.vcf
time bgzip Viol_MACfiltered.vcf

echo Viol_MACfiltered.vcf.gz >> filtered_SNP_mac.txt
time bcftools view -H Viol_MACfiltered.vcf.gz | wc -l >> filtered_SNP_mac.txt




time vcftools --gzvcf Verb_gimble.vcf.gz --minQ 30 --max-missing 1 --mac 2 --remove-indels --min-alleles 2 --max-alleles 2 --keep-INFO-all --recode --stdout > Verb_MACfiltered.vcf
time bgzip Verb_MACfiltered.vcf

echo Verb_MACfiltered.vcf.gz >> filtered_SNP_mac.txt
time bcftools view -H Verb_MACfiltered.vcf.gz | wc -l >> filtered_SNP_mac.txt




