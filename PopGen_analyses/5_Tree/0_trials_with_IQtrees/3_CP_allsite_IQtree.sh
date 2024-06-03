#!/bin/bash
#SBATCH --job-name="cp_IQtree"
#SBATCH --output="/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp/Slurm/cp_IQtree_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp/Slurm/cp_IQtree_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=4G
#SBATCH --array=1-8
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-1- define variables

OUTDIR=/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp #directory for the output bam files

cd $OUTDIR

##-2- Set up array job input

echo $SLURM_ARRAY_TASK_ID
INPUT=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/INPUT_list.txt)   ### This is a list containing all main chromosome names
outG=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/outgroup_list.txt)   ### This is a list containing all main chromosome names


echo Converting vcf to phylip
~/scratch/apps/vcf2phylip/vcf2phylip.py -i "$INPUT".vcf.gz --outgroup "$outG" --output-folder IQtree/ -n 

##-2- run IQtree
# Finding the best substitution model (-m MFP)
# Using ultrafast bootstrap approximation (-B 1000)
# Reducing impact of severe model violations (-bnni)
# With multiple cores -T AUTO
# from http://www.iqtree.org/doc/Tutorial

# Run
iqtree -s IQtree/"$INPUT".min4.phy -m MFP -B 1000 -bnni -T AUTO --seqtype DNA


