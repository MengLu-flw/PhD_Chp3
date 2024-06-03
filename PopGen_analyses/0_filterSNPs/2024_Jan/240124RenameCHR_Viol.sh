#!/bin/bash
#SBATCH --job-name="Viol_CHRrename"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/array_out/Viol_CHRrename_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/array_out/Viol_CHRrename_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=2G
#SBATCH --array=1-10%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
listDIR=/home/mlu/scratch/4_Chp3/Diversity/pixy/Viola
wDIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola
cd $wDIR

#prepare files
# ls /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/*filtered*vcf.gz > VCFlist.txt
# head -n 1 VCFlist.txt
# time bcftools query -l /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/Viol_CHR01_filtered.vcf.gz > Viol_popfile.txt


##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $listDIR/VCFlist.txt)
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $listDIR/chromList.txt) ### This is a list containing chromosome names

#prepare renaming file
#while IFS=$'\t' read -r name old new;
#do
#echo "$old $new" > "$name"_name_conv.txt
#done < ./allCHROM_name.txt


##-1- Rename complex chromosome names

time bcftools annotate --rename-chrs "$CHROMO"_name_conv.txt "$VCF" | bgzip > Viol"$CHROMO"_filtered.vcf.gz

time tabix -p vcf Viol"$CHROMO"_filtered.vcf.gz

