#######----------------------------------------------------------------------------#######
#######--------- Convert VCFs to alignments & make tree locally with MEGA----------#######
#######----------------------------------------------------------------------------#######
#!/bin/bash
#SBATCH --job-name="cp_Prim_phylip"
#SBATCH --output="/home/mlu/scratch/4_Chp3/cp_Phylogeny/Slurm/cp_Prim_phylip.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/cp_Phylogeny/Slurm/cp_Prim_phylip.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-1- Define variables
wDIR=/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp
appDIR=/home/mlu/scratch/apps/vcf2phylip
cd $wDIR

##-2- Get alignment

# 18 ingroups + P_vulgaris_ML001
# 18 ingroups + P_veris_ML018

echo Converting vcf to phylip
$appDIR/vcf2phylip.py -i 240429_Pveris_CPfinal.vcf.gz --outgroup P_vulgaris_ML001 --output-folder IQtree/ -n 

$appDIR/vcf2phylip.py -i 240429_Pvulgaris_CPfinal.vcf.gz --outgroup P_veris_ML018 --output-folder IQtree/ -n 





#######----------------------------------------------------------------------------#######
#######------------------- Subset filtered VCF into per species -------------------#######
#######----------------------------------------------------------------------------#######

#!/bin/bash
#SBATCH --job-name="cp_Prim_subset"
#SBATCH --output="/home/mlu/scratch/4_Chp3/cp_Phylogeny/Slurm/cp_Prim_subset.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/cp_Phylogeny/Slurm/cp_Prim_subset.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk




##-1- define variables
wDIR=/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp
cd $wDIR



##-2- PREP: Do codes below in srun
org_VCF=240429_Prim_CPfiltered.vcf.gz
name=Pveris_ingroup
time bcftools query -l $org_VCF
# 18 ingroups + P_vulgaris_ML001


org_VCF=240429_Prim_CPfiltered.vcf.gz
name=Pvulgaris_ingroup
time bcftools query -l $org_VCF
# 18 ingroups + P_veris_ML018


##-3- Keep ingroup samples + 1 outgroup only
time bcftools view -S Pveris_ingroup.txt 240429_Prim_CPfiltered.vcf.gz -Oz -o 240429_Pveris_CPfinal.vcf.gz #drop sample
echo 240429_Pveris_CPfinal.vcf.gz
time bcftools query -l 240429_Pveris_CPfinal.vcf.gz #check if the change has been made


time bcftools view -S Pvulgaris_ingroup.txt 240429_Prim_CPfiltered.vcf.gz -Oz -o 240429_Pvulgaris_CPfinal.vcf.gz #drop sample
echo 240429_Pvulgaris_CPfinal.vcf.gz
time bcftools query -l 240429_Pvulgaris_CPfinal.vcf.gz #check if the change has been made






#######----------------------------------------------------------------------------#######
#######----------- Call SNPs on Plt using ref. genome & filter raw VCF ------------#######
#######----------------------------------------------------------------------------#######

#!/bin/bash
#SBATCH --job-name="cp_Prim"
#SBATCH --output="/home/mlu/scratch/4_Chp3/cp_Phylogeny/Slurm/cp_Prim.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/cp_Phylogeny/Slurm/cp_Prim.err"
#SBATCH --cpus-per-task=4
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk



## -1- define variables
wDIR=/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp #directory for the output bam files
cd $wDIR


REF=/home/mlu/scratch/0_ref_Geno/Primula/PriVulg.fasta
CHROM='ENA|OY987224|OY987224.1'
BAM=$wDIR/Prim_bamlist #ls /home/mlu/scratch/1_VCFs/2_precalling_bam/Prim_refDToL/*bam > $wDIR/Prim_bamlist



## -2- Call chloroplast SNPs using BCFtools
# Cannot do Primula currently because CP doesn't show up as an assembly in the ref. genome

time bcftools mpileup -a AD,DP,SP -Q 30 -q 30 -Ou -f $REF -b $BAM -r $CHROM | bcftools call -m -f GQ,GP -Oz -o $wDIR/240429_Prim_CP.vcf.gz



## -3- Use vcftools for filtration
time vcftools --gzvcf 240429_Prim_CP.vcf.gz --minGQ 30 --minDP 10 --max-missing 0.9 --keep-INFO-all --recode --stdout > 240429_Prim_CPfiltered.vcf

time bgzip 240429_Prim_CPfiltered.vcf

