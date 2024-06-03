#!/bin/bash
#SBATCH --job-name="cp_subset"
#SBATCH --output="/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_cp/Slurm/cp_subset_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_cp/Slurm/cp_subset_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=1G
#SBATCH --array=1-8
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk



##-1- define variables

OUTDIR=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_cp #directory for the output bam files

cd $OUTDIR


##-2- Set up array job input

echo $SLURM_ARRAY_TASK_ID
sample_Name=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/Sname_list.txt)   ### This is a list containing all main chromosome names
VCF_name=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/VCFname_list.txt)   ### This is a list containing all path to ref. genomes
reVCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/reVCFname_list.txt)   ### This is a list containing all path to ref. genomes


##-3- Keep ingroup samples + 1 outgroup only

time bcftools view -S "$sample_Name" "$VCF_name" -Oz -o "$reVCF" #drop sample

echo "$reVCF"
time bcftools query -l "$reVCF" #check if the change has been made



#####----PREP: Do codes below in srun
org_VCF=240324_Grivale_CPfiltered.vcf.gz
name=Grivale_ingroup
time bcftools query -l $org_VCF > $name.txt
# 17 ingroups + G_urbanum_ML037


org_VCF=240324_Gurbanum_CPfiltered.vcf.gz
name=Gurbanum_ingroup
time bcftools query -l $org_VCF > $name.txt
# 23 ingroups + G_rivale_ML027


org_VCF=240324_Lrepens_CPfiltered.vcf.gz
name=Lrepens_ingroup
time bcftools query -l $org_VCF > $name.txt
# 7 ingroups + L_vulgaris_ML139


org_VCF=240324_Lvulgaris_CPfiltered.vcf.gz
name=Lvulgaris_ingroup
time bcftools query -l $org_VCF > $name.txt
# 7 ingroups + L_repens_ML085


org_VCF=240324_Vhirta_CPfiltered.vcf.gz
name=Vhirta_ingroup
time bcftools query -l $org_VCF > $name.txt
# 5 ingroups + V_odorata_ML003


org_VCF=240324_Vnigrum_CPfiltered.vcf.gz
name=Vnigrum_ingroup
time bcftools query -l $org_VCF > $name.txt
# 7 ingroups + V_thapsus_ML117


org_VCF=240324_Vodorata_CPfiltered.vcf.gz
name=Vodorata_ingroup
time bcftools query -l $org_VCF > $name.txt
# 8 ingroups + V_hirta_ML241A


org_VCF=240324_Vthapsus_CPfiltered.vcf.gz
name=Vthapsus_ingroup
time bcftools query -l $org_VCF > $name.txt
# 14 ingroups + V_nigrum_ML092






