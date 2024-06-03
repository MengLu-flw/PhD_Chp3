###-- Preparation & Configuration  --###

###-- redmask.py on gitHub only works with Python 2
###-- Make a compatible conda env for it
conda create -n Red_py27 -c conda-forge -c bioconda red python=2.7 pip natsort biopython git
conda activate Red_py27

###-- Red binary was downloaded from http://toolsmith.ens.utulsa.edu
###-- Red binary was complied in ~/scratch/apps/RED

###-- redmask.py wrapper was copied from GitHub and made executable, also in ~/scratch/apps/RED

wDIR=/home/mlu/scratch/0_ref_Geno/0_Masked
appDIR=/mnt/shared/scratch/mlu/apps/RED
inputG=/home/mlu/projects/rbge/mlu/0_ref_Geno/Primula/PriVeri.fasta
outfix=PriVeri_masked
cd $wDIR

export PATH=/mnt/shared/scratch/mlu/apps/RED/:$PATH # Every time run redmask.py should define this configuration
python $appDIR/redmask.py -i $inputGenome -o $output_prefix # This is the run example

##----------------------------------------------------------------------------------------

#!/bin/bash
#SBATCH --job-name="RED"
#SBATCH --output="/home/mlu/scratch/0_ref_Geno/0_Masked/Slurm/RED_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/0_ref_Geno/0_Masked/Slurm/RED_%A-%a.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --array=1-5
#SBATCH --mem=8G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables and working dir
wDIR=/home/mlu/scratch/0_ref_Geno/0_Masked
appDIR=/mnt/shared/scratch/mlu/apps/RED
cd $wDIR

##-1- Activate conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/Red_py27

##-2- Set up array job
echo $SLURM_ARRAY_TASK_ID
inputGenome=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/refNames.txt)
outPREFIX=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/output.txt)


##-3- Soft-mask ref. genome using RED programme (2015), run with the wrapper redmask.py
export PATH=/mnt/shared/scratch/mlu/apps/RED/:$PATH # Every time run redmask.py should define this configuration

python $appDIR/redmask.py -i "$inputGenome" -o "$outPREFIX"

# GeuUrba_masked needs 10G MEM

