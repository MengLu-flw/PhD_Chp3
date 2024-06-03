#!/bin/bash
#SBATCH --job-name="Lina_gimbleprepCHR"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Linaria/array_out/Linaria_gimbleprepCHR_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Linaria/array_out/Linaria_gimbleprepCHR_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=30G
#SBATCH --array=1-6%3
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk



##-0- define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Linaria

##-2- Define variables

REF=/home/mlu/scratch/0_ref_Geno/Linaria/LinVulg.fasta #the absolute path to find the reference genome
BAM_DIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Linaria #directory for the input bam files
# Make sure that the VCF file has been indexed!!
# If indexed with 'tabix -p vcf 231206_Geum_all.vcf.gz', the file ends with .tbi (in the gimble GitHub example)
working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Linaria #directory for the VCF files
#Create the input list by: ls /home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Linaria/*vcf.gz > Linaßß_input.txt


##-3- Set up array job input

echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Lina_input.txt) ### This is a list containing all VCFs with absolute paths
output=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Lina_output.txt) ### This is a list containing output names



##-4- Run gimbleprep in arrary
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

time gimbleprep -f $REF -b $BAM_DIR/ -v "$VCF" -o "$output"


