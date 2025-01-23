#!/bin/bash
#SBATCH --job-name="popLDdecay_masked_v2"
#SBATCH --output="/mnt/destiny/sandbox/rbge_mlu/Chp3/1_LDdecay/Slurm/popLDdecay_masked_v2_%A-%a.out"
#SBATCH --error="/mnt/destiny/sandbox/rbge_mlu/Chp3/1_LDdecay/Slurm/popLDdecay_masked_v2_%A-%a.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --array=1-12
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##- Define variables and working dir
wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp3/1_LDdecay/mask_v2

appDIR=/home/mlu/scratch/apps/PopLDdecay
vcfDIR=/mnt/destiny/sandbox/rbge_mlu/0_VCFs/Species_SNP
cd $wDIR


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
NAME=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $vcfDIR/SubGroup.txt)


##-3- Run popLDdecay with default settings
time $appDIR/PopLDdecay -InVCF $vcfDIR/"$NAME"_NOmiss_masked.vcf.gz -MaxDist 1000 -OutStat "$NAME"_LDdecay.stat.gz
time perl $appDIR/bin/Plot_OnePop.pl -inFile "$NAME"_LDdecay.stat.gz -output "$NAME".out -keepR
