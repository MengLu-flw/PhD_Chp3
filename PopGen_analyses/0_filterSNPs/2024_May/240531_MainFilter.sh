###-------------- The script below is ready, however, ---------------------------------###
###-------------- I think you've done this when generating easySFS --------------------###
###-------------- Just symlink the file from the other folder -------------------------###

cd /home/mlu/scratch/1_VCFs/4_filtered_SNPs/2024_May

ln -s /home/mlu/scratch/3_fsc28/1_SFS/Geum/Geum_NOmiss.vcf.gz ./
ln -s /home/mlu/scratch/3_fsc28/1_SFS/Lina/Lina_NOmiss.vcf.gz ./
ln -s /home/mlu/scratch/3_fsc28/1_SFS/PrimDToL/PrimDToL_NOmiss.vcf.gz ./
ln -s /home/mlu/scratch/3_fsc28/1_SFS/Prim/Prim_NOmiss.vcf.gz ./
ln -s /home/mlu/scratch/3_fsc28/1_SFS/Verb/Verb_NOmiss.vcf.gz ./
ln -s /home/mlu/scratch/3_fsc28/1_SFS/Viol/Viol_NOmiss.vcf.gz ./

# * NOTE: the only difference is the multi-allelic check, you can check it by:
# vcftools --vcf input.vcf --min-alleles 3 --max-alleles 100 --recode --stdout | grep -v '^#' | wc -l


###------------------------------------------------------------------------------------###
#!/bin/bash
#SBATCH --job-name="maxDP15_filter"
#SBATCH --output="/home/mlu/scratch/1_VCFs/4_filtered_SNPs/2024_May/array_out/maxDP15_filter_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/4_filtered_SNPs/2024_May/array_out/maxDP15_filter_%A-%a.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --array=1-6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

wDIR=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/2024_May
cd $wDIR

##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
inVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/inVCFlist.txt)
outVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/outVCFlist.txt)


##-1- Filter
time vcftools --gzvcf $inVCF --minQ 30 --max-missing 1 --mac 2 --remove-indels --min-alleles 2 --max-alleles 2 --keep-INFO-all --recode --stdout > $outVCF.vcf
time bgzip $outVCF.vcf


##-1- Get VCF stats
time bcftools +counts $yourfile.vcf.gz >> $wDIR/VCF_240531.stats




