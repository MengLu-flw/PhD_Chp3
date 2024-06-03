#!/bin/bash
#SBATCH --job-name="Viol_pixy"
#SBATCH --output="/home/mlu/scratch/4_Chp3/Diversity/pixy/Viola/array_out/Viola_pixy_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/Diversity/pixy/Viola/array_out/Viola_pixy_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=2G
#SBATCH --array=1-10%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
wDIR=/home/mlu/scratch/4_Chp3/Diversity/pixy/Viola
cd $wDIR

#prepare files
# ls /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/*filtered*vcf.gz > VCFlist.txt
# head -n 1 VCFlist.txt
# time bcftools query -l /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/Viol_CHR01_filtered.vcf.gz > Viol_popfile.txt



##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/VCFlist.txt)
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/chromList.txt) ### This is a list containing chromosome names



##-1- Run pixy VCF
source activate /mnt/shared/scratch/mlu/apps/conda/envs/pixy

pixy --stats pi fst dxy \
--vcf "$VCF" \
--populations $wDIR/Viol_popfile.txt \
--window_size 20000 \
--n_cores 4 \
--output_prefix Viol"$CHROMO"



#--------------- ---------- ---------- ---------- ---------- ------------------------- ---------- ---------- 
#--------------- ---------- ---------- ---------- ---------- ------------------------- ---------- ---------- 

pixy --stats pi fst dxy \
--vcf /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/Viol_CHR01_filtered.vcf.gz \
--populations /home/mlu/scratch/4_Chp3/Diversity/pixy/Viola/Viol_popfile.txt \
--window_size 20000 \
--n_cores 4 \
--output_prefix ViolCHR01

#--------------- ---------- ---------- ---------- ---------- ------------------------- ---------- ---------- 
time bcftools query -f '%CHROM' /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/Viol_CHR01_filtered.vcf.gz|uniq

time bcftools query -f '%CHROM' /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Geum/Geum_CHR01_filtered.vcf.gz|uniq
time bcftools query -f '%CHROM' /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Linaria/Lina_CHR01_filtered.vcf.gz|uniq


#--------------- ---------- ---------- ---------- ---------- ------------------------- ---------- ---------- 




