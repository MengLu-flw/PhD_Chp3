#!/bin/bash
#SBATCH --job-name="popLDdecay_whole"
#SBATCH --output="/home/mlu/scratch/4_Chp3/LDdecay/Slurm/popLDdecay_whole_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/LDdecay/Slurm/popLDdecay_whole_%A-%a.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --array=1-10
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-1- define variables
wDIR=/home/mlu/scratch/4_Chp3/LDdecay
appDIR=/home/mlu/scratch/apps/PopLDdecay
vcfDIR=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species
cd $wDIR

##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
NAME=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/name_list.txt)


##-3- Run popLDdecay with default settings
time $appDIR/PopLDdecay -InVCF $vcfDIR/240405_"$NAME"_MACfiltered.vcf.gz -OutStat "$NAME"_LDdecay.stat.gz
time perl $appDIR/bin/Plot_OnePop.pl -inFile "$NAME"_LDdecay.stat.gz -output "$NAME".out -keepR
