### ------------------------------------ Part I -------------------------------------- ###
### -------------------------------- Prepare for fastp ------------------------------- ###
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="pre_fastp"
#SBATCH --output="pre_fastp.out.txt"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=4G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

## Make a list that capture all unique sample names
cd /home/mlu/scratch/1_trimdata_fastp/all_raw/original
ls *.fq.gz | cut -d'_' -f1,2 | sort | uniq > samplenames.txt 


## Merge reads from the same individual on different lanes of different runs (e.g., sample ML312 has L8_1, L8_2, L1_1, and L1_2; and you want to combine these into just ‘concat_1’ and ‘concat_2’) for Forward and Reverse reads
cd /home/mlu/scratch/1_trimdata_fastp/all_raw

# Forward reads
parallel 'cat ./original/{}_*_1.fq.gz > ./concat/{}_concat_R1.fq.gz' :::: /home/mlu/scratch/1_trimdata_fastp/all_raw/original/samplenames.txt

# Reverse reads
parallel 'cat ./original/{}_*_2.fq.gz > ./concat/{}_concat_R2.fq.gz' :::: /home/mlu/scratch/1_trimdata_fastp/all_raw/original/samplenames.txt


### ------------------------------------ Part II ------------------------------------- ###
### ----------------------------------- Run fastp ------------------------------------ ###
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="run_fsatp"
#SBATCH --output="run_fastp.out.txt"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

## Run fastp v0.23.4, with:
#  Quality =<22 removed (-q 22)
#  Length =<75 removed (-l 75)
#  Adapters detected and removed --detect_adapter_for_pe 
#  Base correction in overlapping reads (-c) 
#  Poly g tails trimmed (-g) 

cd /home/mlu/scratch/1_trimdata_fastp

parallel 'fastp -q 22 -l 75 --detect_adapter_for_pe -c -g -i ./all_raw/concat/{}_concat_R1.fq.gz -I ./all_raw/concat/{}_concat_R2.fq.gz -o ./all_trimmed/{}_R1_trimmed.fq.gz -O ./all_trimmed/{}_R2_trimmed.fq.gz' :::: /home/mlu/scratch/1_trimdata_fastp/all_raw/original/samplenames.txt


## Re-run fastQC for your trimmed reads

cd /home/mlu/scratch/1_trimdata_fastp

mkdir fastqc_trimmed

parallel 'fastqc {} -o /home/mlu/scratch/1_trimdata_fastp/fastqc_trimmed' ::: /home/mlu/scratch/1_trimdata_fastp/all_trimmed/*_trimmed.fq.gz

## Run multiQC to get a summary
cd /home/mlu/scratch/1_trimdata_fastp

mkdir multiqc_trimmed

time multiqc /home/mlu/scratch/1_trimdata_fastp/fastqc_trimmed -o /home/mlu/scratch/1_trimdata_fastp/multiqc_trimmed
