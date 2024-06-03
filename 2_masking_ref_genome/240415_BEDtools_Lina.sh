#!/bin/bash
#SBATCH --job-name="intergenic_Lina"
#SBATCH --output="/home/mlu/scratch/0_ref_Geno/2_genicBED/Slurm/intergenic_Lina.out"
#SBATCH --error="/home/mlu/scratch/0_ref_Geno/2_genicBED/Slurm/intergenic_Lina.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables and working dir
bedtools=/mnt/shared/scratch/mlu/apps/bedtools2/bin/bedtools # locate the app
rDIR=/home/mlu/scratch/0_ref_Geno/0_Masked # the directory to find repeat .bed files
cDIR=/home/mlu/scratch/2_gimble/2024_Jan # the directory to the all-callable .bed file
gDIR=/home/mlu/scratch/0_ref_Geno/1_GFFs # the direcoty to find .gff files

wDIR=/home/mlu/scratch/0_ref_Geno/2_genicBED
cd $wDIR

## Inspect inputs
#less $rDIR/LinVulg_masked.repeats.bed
#less $cDIR/Linaria/gimble.bed

oREF=$cDIR/Linaria/gimble.bed
REPEAT=$rDIR/LinVulg_masked.repeats.bed

GFF=$gDIR/Linaria_vulgaris-GCA_948329865.1-2023_06-genes.gff3.gz

mREF=$wDIR/LinVulg_masked_gimble.bed
iREF=$wDIR/LinVulg_intergenic_gimble.bed

## Mask the callable sites
time $bedtools intersect -a $oREF -b $REPEAT -v > $mREF

## Get rid of genes
time $bedtools intersect -a $mREF -b $GFF -v > $iREF

rm $mREF