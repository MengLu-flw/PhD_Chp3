#!/bin/bash
#SBATCH --job-name="Verb_wMonoSNP_filterCHR"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum/array_out/Verb_wMonoSNP_Fil_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum/array_out/Verb_wMonoSNP_Fil_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=2G
#SBATCH --array=1-18%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- Define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum

working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum #directory for the VCF files


##-1- Set up array job input
echo $SLURM_ARRAY_TASK_ID
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Verb_output.txt) ### This is a list containing output names
orgVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Verb_input.txt) ### This is a list containing all VCFs with absolute paths



##-2- Run bcftools, filter DP customised to each sample sequencing depth
## -S . > to set genotypes of failed samples to missing value (.)
## therefore, you might not see a reduction in site number but the failed sites have been recoded

# To find DP filter ref. check gimble.log last line
# tail -n 1 gimble_out/Verb_CHR01.log.txt
time bcftools filter --threads 4 -Oz -S . -e '(FMT/DP[0]<8 | FMT/DP[0]>46) | (FMT/DP[1]<8 | FMT/DP[1]>34) | (FMT/DP[2]<8 | FMT/DP[2]>42) | (FMT/DP[3]<8 | FMT/DP[3]>34) | (FMT/DP[4]<8 | FMT/DP[4]>40) | (FMT/DP[5]<8 | FMT/DP[5]>38) | (FMT/DP[6]<8 | FMT/DP[6]>40) | (FMT/DP[7]<8 | FMT/DP[7]>50) | (FMT/DP[8]<8 | FMT/DP[8]>36) | (FMT/DP[9]<8 | FMT/DP[9]>44) | (FMT/DP[10]<8 | FMT/DP[10]>34) | (FMT/DP[11]<8 | FMT/DP[11]>38) | (FMT/DP[12]<8 | FMT/DP[12]>38) | (FMT/DP[13]<8 | FMT/DP[13]>36) | (FMT/DP[14]<8 | FMT/DP[14]>42) | (FMT/DP[15]<8 | FMT/DP[15]>36) | (FMT/DP[16]<8 | FMT/DP[16]>40) | (FMT/DP[17]<8 | FMT/DP[17]>42) | (FMT/DP[18]<8 | FMT/DP[18]>44) | (FMT/DP[19]<8 | FMT/DP[19]>40) | (FMT/DP[20]<8 | FMT/DP[20]>42)' "$orgVCF" > "$CHROMO".vcf.gz && tabix -p vcf "$CHROMO".vcf.gz



##-3- Run vcftools, filter out indels, and keep biallelic, monomorphic, and no missing genotype at a site
#you don't need --min-alleles 2 here because you need to keep the invariant sites

time vcftools --gzvcf "$CHROMO".vcf.gz --max-missing 0.8 --remove-indels --keep-INFO-all --recode --stdout > "$CHROMO"_filtered.vcf

time bgzip "$CHROMO"_filtered.vcf


#!/bin/bash
#SBATCH --job-name="Quick"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum/array_out/Verb_QuickStats_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Verbascum/array_out/Verb_QuickStats_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --array=1-18%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk
##-4- Stats
echo "$CHROMO"_original > SiteCount_Verb"$CHROMO".txt
time bcftools view -H "$orgVCF" | wc -l >> SiteCount_Verb"$CHROMO".txt

echo "$CHROMO"_input >> SiteCount_Verb"$CHROMO".txt
time bcftools view -H "$CHROMO".vcf.gz | wc -l >> SiteCount_Verb"$CHROMO".txt

echo "$CHROMO"_filtered >> SiteCount_Verb"$CHROMO".txt
time bcftools view -H "$CHROMO"_filtered.vcf.gz | wc -l >> SiteCount_Verb"$CHROMO".txt

#cat SiteCount_Verb* > SiteCount_VerbALL.txt
#rm SiteCount_VerbVerb*


