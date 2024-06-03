### ---------------------------------------------------------------------------------- ###
## See if Fis value is the same when you only extract the VCF of one single sample
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="1_vcftools_F_PerSample"
#SBATCH --output="/mnt/shared/scratch/mlu/4_Chp3/Inbreeding/test/Slurm/1_vcftools_F_PerSample.%A-%a.out"
#SBATCH --error="/mnt/shared/scratch/mlu/4_Chp3/Inbreeding/test/Slurm/1_vcftools_F_PerSample.%A-%a.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=medium
#SBATCH --mem=1G
#SBATCH --array=1-25%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

wDIR=/mnt/shared/scratch/mlu/4_Chp3/Inbreeding/test
cd $wDIR

##- Set up array job
echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/VCFname.txt)

##- Run command
# F per sample
time vcftools --gzvcf $wDIR/"$VCF".vcf.gz --het --out "$VCF"_vcftools
# Missingness per sample
time vcftools --gzvcf $wDIR/"$VCF".vcf.gz --missing-indv --out "$VCF"_vcftools


# V_odorata_ML176
# V_odorata_ML003
# V_hirta_ML243A
# V_hirta_ML153
# V_thapsus_ML140
# V_thapsus_ML105
# V_thapsus_ML061
# V_nigrum_ML174
# V_nigrum_ML312
# V_nigrum_ML092
# P_vulgaris_ML278
# P_vulgaris_ML024
# P_vulgaris_ML001
# P_veris_ML270
# P_veris_ML019
# P_veris_ML005
# L_vulgaris_ML236A
# L_vulgaris_ML139
# L_repens_ML234A
# L_repens_ML085
# G_urbanum_ML283
# G_urbanum_ML104
# G_urbanum_ML033
# G_rivale_ML277
# G_rivale_ML027
