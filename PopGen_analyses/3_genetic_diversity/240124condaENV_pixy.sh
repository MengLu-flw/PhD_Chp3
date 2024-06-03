srun --partition=short --cpus-per-task=8 --mem=12G --pty bash

####----Create conda env for pixy
#--------------- ---------- ---------- ---------- ---------- ------------------------- ---------- ---------- 
conda create -n pixy -c conda-forge -c bioconda
conda activate pixy

conda install -c conda-forge pixy
conda install -c bioconda htslib
conda install bioconda::tabix

conda update --all # to resolve any incompatibility

pixy --help


####----Simon Martin's codes can run in base env
#--------------- ---------- ---------- ---------- ---------- ------------------------- ---------- ---------- 
cd ~/scratch/apps

git clone https://github.com/simonhmartin/genomics_general.git

# remember to call the absolute path each time
/home/mlu/scratch/apps/genomics_scripts/VCF_processing/parseVCF.py -h
/home/mlu/scratch/apps/genomics_scripts/popgenWindows.py -h
