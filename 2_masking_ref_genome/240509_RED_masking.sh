#!/bin/bash
#SBATCH --job-name="RED_primDToL"
#SBATCH --output="/home/mlu/scratch/0_ref_Geno/0_Masked/Slurm/RED_primDToL.out"
#SBATCH --error="/home/mlu/scratch/0_ref_Geno/0_Masked/Slurm/RED_primDToL.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=4G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables and working dir
wDIR=/home/mlu/scratch/0_ref_Geno/0_Masked
appDIR=/mnt/shared/scratch/mlu/apps/RED
cd $wDIR

##-1- Activate conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/Red_py27


##-2- Soft-mask ref. genome using RED programme (2015), run with the wrapper redmask.py
export PATH=/mnt/shared/scratch/mlu/apps/RED/:$PATH # Every time run redmask.py should define this configuration

python $appDIR/redmask.py -i /home/mlu/scratch/0_ref_Geno/Primula/PriVulg.fasta -o PriVulg_masked
