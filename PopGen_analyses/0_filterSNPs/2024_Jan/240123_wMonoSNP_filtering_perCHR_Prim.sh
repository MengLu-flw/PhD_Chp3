#!/bin/bash
#SBATCH --job-name="Prim_wMonoSNP_filterCHR"
#SBATCH --output="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula/array_out/Prim_wMonoSNP_Fil_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula/array_out/Prim_wMonoSNP_Fil_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=2G
#SBATCH --array=1-11%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- Define working directory
cd /home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula

working_DIR=/home/mlu/scratch/1_VCFs/5_filtered_SNPs_perCHR/Primula #directory for the VCF files


##-1- Set up array job input
echo $SLURM_ARRAY_TASK_ID
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Prim_output.txt) ### This is a list containing output names
orgVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $working_DIR/Prim_input.txt) ### This is a list containing all VCFs with absolute paths



##-2- Run bcftools, filter DP customised to each sample sequencing depth
## -S . > to set genotypes of failed samples to missing value (.)
## therefore, you might not see a reduction in site number but the failed sites have been recoded

# To find DP filter ref. check gimble.log last line
# tail -n 1 gimble_out/Prim_CHR01.log.txt

time bcftools filter --threads 4 -Oz -S . -e '(FMT/DP[0]<8 | FMT/DP[0]>38) | (FMT/DP[1]<8 | FMT/DP[1]>52) | (FMT/DP[2]<8 | FMT/DP[2]>48) | (FMT/DP[3]<8 | FMT/DP[3]>38) | (FMT/DP[4]<8 | FMT/DP[4]>38) | (FMT/DP[5]<8 | FMT/DP[5]>44) | (FMT/DP[6]<8 | FMT/DP[6]>44) | (FMT/DP[7]<8 | FMT/DP[7]>32) | (FMT/DP[8]<8 | FMT/DP[8]>30) | (FMT/DP[9]<8 | FMT/DP[9]>44) | (FMT/DP[10]<8 | FMT/DP[10]>40) | (FMT/DP[11]<8 | FMT/DP[11]>32) | (FMT/DP[12]<8 | FMT/DP[12]>40) | (FMT/DP[13]<8 | FMT/DP[13]>38) | (FMT/DP[14]<8 | FMT/DP[14]>38) | (FMT/DP[15]<8 | FMT/DP[15]>48) | (FMT/DP[16]<8 | FMT/DP[16]>36) | (FMT/DP[17]<8 | FMT/DP[17]>38) | (FMT/DP[18]<8 | FMT/DP[18]>40) | (FMT/DP[19]<8 | FMT/DP[19]>38) | (FMT/DP[20]<8 | FMT/DP[20]>52) | (FMT/DP[21]<8 | FMT/DP[21]>40) | (FMT/DP[22]<8 | FMT/DP[22]>42) | (FMT/DP[23]<8 | FMT/DP[23]>48) | (FMT/DP[24]<8 | FMT/DP[24]>38) | (FMT/DP[25]<8 | FMT/DP[25]>38) | (FMT/DP[26]<8 | FMT/DP[26]>34) | (FMT/DP[27]<8 | FMT/DP[27]>36) | (FMT/DP[28]<8 | FMT/DP[28]>40) | (FMT/DP[29]<8 | FMT/DP[29]>38) | (FMT/DP[30]<8 | FMT/DP[30]>42) | (FMT/DP[31]<8 | FMT/DP[31]>36) | (FMT/DP[32]<8 | FMT/DP[32]>44) | (FMT/DP[33]<8 | FMT/DP[33]>44) | (FMT/DP[34]<8 | FMT/DP[34]>44) | (FMT/DP[35]<8 | FMT/DP[35]>42)' "$orgVCF" > "$CHROMO".vcf.gz && tabix -p vcf "$CHROMO".vcf.gz



##-3- Run vcftools, filter out indels, and keep biallelic, monomorphic, and no missing genotype at a site
#you don't need --min-alleles 2 here because you need to keep the invariant sites

time vcftools --gzvcf "$CHROMO".vcf.gz --max-missing 0.8 --remove-indels --keep-INFO-all --recode --stdout > "$CHROMO"_filtered.vcf

time bgzip "$CHROMO"_filtered.vcf


##-4- Stats
echo "$CHROMO"_original > SiteCount_Prim"$CHROMO".txt
time bcftools view -H "$orgVCF" | wc -l >> SiteCount_Prim"$CHROMO".txt

echo "$CHROMO"_input >> SiteCount_Prim"$CHROMO".txt
time bcftools view -H "$CHROMO".vcf.gz | wc -l >> SiteCount_Prim"$CHROMO".txt

echo "$CHROMO"_filtered >> SiteCount_Prim"$CHROMO".txt
time bcftools view -H "$CHROMO"_filtered.vcf.gz | wc -l >> SiteCount_Prim"$CHROMO".txt

#cat SiteCount_Prim* > SiteCount_PrimALL.txt
#rm SiteCount_PrimPrim*


