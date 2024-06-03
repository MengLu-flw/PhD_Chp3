### ------------------------------------ Part I -------------------------------------- ###
### --------------------------------- checkMD5.sh ------------------------------------ ###
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="checkMD5"
#SBATCH --output="checkMD5_out.txt"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=M.Lu-17@sms.ed.ac.uk


for subdir in $(ls -d /home/mlu/projects/rbge/mlu/Raw_data/2022_12_16/*/)
  do
	cd $subdir
md5sum --check MD5.txt
  	cd ..
  done


### ----------------------------------- Part II -------------------------------------- ###
### ------------------------------- Run_QCreports.sh --------------------------------- ###
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="Run_QCreports"
#SBATCH --output="Run_QCreports_out.txt"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=M.Lu-17@sms.ed.ac.uk


# Run fastqc
cd /home/mlu/scratch/0_Raw_data

for subdir in $(ls -d /home/mlu/scratch/0_Raw_data/*/)
  do
	cd $subdir
fastqc *.fq.gz -o /home/mlu/scratch/0_Raw_data/fastQC/
cd ..
  done


### ---------------------------------- Part III -------------------------------------- ###
### --------------------------------- fastQC.sh -------------------------------------- ###
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="fastQC"
#SBATCH --output="fastQC.out.txt"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=M.Lu-17@sms.ed.ac.uk

# Run fastqc
cd /home/mlu/scratch/0_Raw_data

parallel 'fastqc {} -o /home/mlu/scratch/0_Raw_data/fastQC/' ::: ./*/*fq.gz



### ----------------------------------- Part IV -------------------------------------- ###
### ---------------------------------- multiQC.sh ------------------------------------ ###
### ---------------------------------------------------------------------------------- ###

#!/bin/bash
#SBATCH --job-name="multiQC"
#SBATCH --output="multiQC.out.txt"
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --partition=short
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=M.Lu-17@sms.ed.ac.uk


# Run multiQC
cd /home/mlu/scratch/0_Raw_data

time multiqc ./fastQC -o ./multiQC


