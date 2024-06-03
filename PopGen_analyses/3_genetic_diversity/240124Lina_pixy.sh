#!/bin/bash
#SBATCH --job-name="Lina_pixy"
#SBATCH --output="/home/mlu/scratch/4_Chp3/Diversity/pixy/Linaria/array_out/Linaria_pixy_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/Diversity/pixy/Linaria/array_out/Linaria_pixy_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=2G
#SBATCH --array=1-6%3
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
wDIR=/home/mlu/scratch/4_Chp3/Diversity/pixy/Linaria

inDIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Linaria


cd $wDIR

##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/VCFlist.txt)
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/chromList.txt) ### This is a list containing chromosome names



##-1- Run pixy VCF
source activate /mnt/shared/scratch/mlu/apps/conda/envs/pixy

pixy --stats pi fst dxy \
--vcf "$VCF" \
--populations $wDIR/Lina_popfile.txt \
--window_size 20000 \
--n_cores 4 \
--output_prefix Lina"$CHROMO"
