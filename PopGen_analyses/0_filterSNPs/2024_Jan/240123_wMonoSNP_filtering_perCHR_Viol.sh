#!/bin/bash
#SBATCH --job-name="Viol_wMonoSNP_filterCHR"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/array_out/Viol_wMonoSNP_Fil_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola/array_out/Viol_wMonoSNP_Fil_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=2G
#SBATCH --array=1-10%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- Define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola

working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Viola #directory for the VCF files


##-1- Set up array job input
echo $SLURM_ARRAY_TASK_ID
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Viol_output.txt) ### This is a list containing output names
orgVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Viol_input.txt) ### This is a list containing all VCFs with absolute paths



##-2- Run bcftools, filter DP customised to each sample sequencing depth
## -S . > to set genotypes of failed samples to missing value (.)
## therefore, you might not see a reduction in site number but the failed sites have been recoded

# To find DP filter ref. check gimble.log last line
# tail -n 1 gimble_out/Viol_CHR01.log.txt
time bcftools filter --threads 4 -Oz -S . -e '(FMT/DP[0]<8 | FMT/DP[0]>56) | (FMT/DP[1]<8 | FMT/DP[1]>52) | (FMT/DP[2]<8 | FMT/DP[2]>54) | (FMT/DP[3]<8 | FMT/DP[3]>42) | (FMT/DP[4]<8 | FMT/DP[4]>50) | (FMT/DP[5]<8 | FMT/DP[5]>94) | (FMT/DP[6]<8 | FMT/DP[6]>94) | (FMT/DP[7]<8 | FMT/DP[7]>60) | (FMT/DP[8]<8 | FMT/DP[8]>48) | (FMT/DP[9]<8 | FMT/DP[9]>54) | (FMT/DP[10]<8 | FMT/DP[10]>82) | (FMT/DP[11]<8 | FMT/DP[11]>88) | (FMT/DP[12]<8 | FMT/DP[12]>92)' "$orgVCF" > "$CHROMO".vcf.gz && tabix -p vcf "$CHROMO".vcf.gz



##-3- Run vcftools, filter out indels, and keep biallelic, monomorphic, and no missing genotype at a site
#you don't need --min-alleles 2 here because you need to keep the invariant sites

time vcftools --gzvcf "$CHROMO".vcf.gz --max-missing 0.8 --remove-indels --keep-INFO-all --recode --stdout > "$CHROMO"_filtered.vcf

time bgzip "$CHROMO"_filtered.vcf


##-4- Stats
echo "$CHROMO"_original > SiteCount_Viol"$CHROMO".txt
time bcftools view -H "$orgVCF" | wc -l >> SiteCount_Viol"$CHROMO".txt

echo "$CHROMO"_input >> SiteCount_Viol"$CHROMO".txt
time bcftools view -H "$CHROMO".vcf.gz | wc -l >> SiteCount_Viol"$CHROMO".txt

echo "$CHROMO"_filtered >> SiteCount_Viol"$CHROMO".txt
time bcftools view -H "$CHROMO"_filtered.vcf.gz | wc -l >> SiteCount_Viol"$CHROMO".txt

#cat SiteCount_Viol* > SiteCount_ViolALL.txt
#rm SiteCount_ViolViol*


