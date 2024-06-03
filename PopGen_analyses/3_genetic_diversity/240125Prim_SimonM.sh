#!/bin/bash
#SBATCH --job-name="Prim_SMpy"
#SBATCH --output="/home/mlu/scratch/4_Chp3/Diversity/SimonM_py/Primula/array_out/Primula_SMpy_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/4_Chp3/Diversity/SimonM_py/Primula/array_out/Primula_SMpy_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=2G
#SBATCH --array=1-11%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
wDIR=/home/mlu/scratch/4_Chp3/Diversity/SimonM_py/Primula

pyDIR=/home/mlu/scratch/apps/genomics_scripts

cd $wDIR

##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
VCF=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/VCFlist.txt)
CHROMO=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/chromList.txt) ### This is a list containing chromosome names



##-1- Run Simon Martin's script
##-1.1- Convert the vcf file to geno.gz, which is the format that the following script requires
$pyDIR/VCF_processing/parseVCF.py -i "$VCF" | bgzip > Prim"$CHROMO".geno.gz


##-1.2- Calculate summary stats
$pyDIR/popgenWindows.py -T 4 -g Prim"$CHROMO".geno.gz -o Prim"$CHROMO".Fst.Dxy.pi.csv.gz \
   -f phased -w 20000 -s 20000 -m 5000 \
   --popsFile $wDIR/Prim_popfile.txt
