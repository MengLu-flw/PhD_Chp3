#!/bin/bash
#SBATCH --job-name="cp_allSITE"
#SBATCH --output="/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp/Slurm/cp_allSITE_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp/Slurm/cp_allSITE_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=1G
#SBATCH --array=1-4
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk



##-1- define variables

OUTDIR=/home/mlu/scratch/4_Chp3/cp_Phylogeny/BCFtools_cp #directory for the output bam files

cd $OUTDIR

##-2- BCFtools all-site calling Chloroplast only, using arrary job

##-2.1- Set up array job input

echo $SLURM_ARRAY_TASK_ID
CHROM=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/cp_CHRname.txt)   ### This is a list containing all main chromosome names
REF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/ref_list.txt)   ### This is a list containing all path to ref. genomes
BAMs=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/bam_dir.txt)   ### This is a list containing all txt names that storing bam files name
NAME=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/name_list.txt)   ### This is a list containing all txt names that storing bam files name


##-2.2- Run BCFtools in arrary
# Cannot do Primula currently because CP doesn't show up as an assembly in the ref. genome

time bcftools mpileup -a AD,DP,SP -Q 30 -q 30 -Ou -f "$REF" -b "$BAMs" -r "$CHROM" | bcftools call -m -f GQ,GP -Oz -o $OUTDIR/240322_"$NAME".vcf.gz


