#!/bin/bash
#SBATCH --job-name="Geum_gimbleprepCHR"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Geum/array_out/Geum_gimbleprepCHR_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Geum/array_out/Geum_gimbleprepCHR_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --array=1-21%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk



##-0- define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Geum

##-2- Define variables

REF=/home/mlu/scratch/0_ref_Geno/Geum/GeuUrba.fasta #the absolute path to find the reference genome
BAM_DIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Geum #directory for the input bam files
# Make sure that the VCF file has been indexed!!
# If indexed with 'tabix -p vcf 231206_Geum_all.vcf.gz', the file ends with .tbi (in the gimble GitHub example)
working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Geum #directory for the VCF files
#Create the input list by: ls /home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Geum/*vcf.gz > Geum_input.txt


##-3- Set up array job input

echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Geum_input.txt) ### This is a list containing all VCFs with absolute paths
output=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Geum_output.txt) ### This is a list containing output names



##-4- Run gimbleprep in arrary
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

time gimbleprep -f $REF -b $BAM_DIR/ -v "$VCF" -o "$output"


bcftools filter --threads 1 -Oz -S . -e '(FMT/DP[0]<8 | FMT/DP[0]>46) | (FMT/DP[1]<8 | FMT/DP[1]>34) | (FMT/DP[2]<8 | FMT/DP[2]>42) | (FMT/DP[3]<8 | FMT/DP[3]>34) | (FMT/DP[4]<8 | FMT/DP[4]>40) | (FMT/DP[5]<8 | FMT/DP[5]>38) | (FMT/DP[6]<8 | FMT/DP[6]>40) | (FMT/DP[7]<8 | FMT/DP[7]>50) | (FMT/DP[8]<8 | FMT/DP[8]>36) | (FMT/DP[9]<8 | FMT/DP[9]>44) | (FMT/DP[10]<8 | FMT/DP[10]>34) | (FMT/DP[11]<8 | FMT/DP[11]>38) | (FMT/DP[12]<8 | FMT/DP[12]>38) | (FMT/DP[13]<8 | FMT/DP[13]>36) | (FMT/DP[14]<8 | FMT/DP[14]>42) | (FMT/DP[15]<8 | FMT/DP[15]>36) | (FMT/DP[16]<8 | FMT/DP[16]>40) | (FMT/DP[17]<8 | FMT/DP[17]>42) | (FMT/DP[18]<8 | FMT/DP[18]>44) | (FMT/DP[19]<8 | FMT/DP[19]>40) | (FMT/DP[20]<8 | FMT/DP[20]>42)' tmp_gimble_30kpx7cq/vcf.filtered.pass.vcf.gz | bcftools sort -T tmp_gimble_30kpx7cq/vcf.filtered.vcf.gz.sort.tmp -Oz > Verb_CHR12.vcf.gz && bcftools index -t Verb_CHR12.vcf.gz


