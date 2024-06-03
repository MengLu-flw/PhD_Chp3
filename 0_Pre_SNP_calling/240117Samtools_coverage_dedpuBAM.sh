#!/bin/bash
#SBATCH --job-name="Geum_dedup_coverage"
#SBATCH --output="/home/mlu/scratch/1_VCFs/2_precalling_bam/Geum/array_out/Geum_cover_array_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/2_precalling_bam/Geum/array_out/Geum_cover_array_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
#SBATCH --array=1-40%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- define variables
LISTDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Geum #directory to find sample list
OUTDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Geum #directory for the output bam files

##-1- Set up array job input
echo $SLURM_ARRAY_TASK_ID
name=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $LISTDIR/Geum_dedup_cov.txt)   ### This is a namelist for all Geum allopatry files, format 'ML027_EKDN220041655-1A', 'ML028_EKDN220041656-1A'...per line

##-2- Get mapping stats from bwa
cd $OUTDIR
samtools flagstat "$name"_dedup_RG.bam > "$name".flagstat
samtools coverage -H "$name"_dedup_RG.bam > "$name".samtools.coverage






####----------Then you can compile all mapping stats - run it as interactive as it will be really fast
srun --partition=medium --cpus-per-task=8 --mem=12G --pty bash

##-1- prepare relevant directories
cd /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum
mkdir sumstat
mkdir sumstat/mapping sumstat/depth


##-2- get summarised info from samtools.flagstat reports
cd /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum

time parallel 'grep -E "+ 0 mapped|+ 0 primary mapped|+ 0 properly paired|+ 0 singletons" {}.flagstat > ./sumstat/mapping/{}.sumstat' :::: /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum/Geum_dedup_cov.txt


##-3- rename outputs
cd /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum/sumstat/mapping

for f in ./*.sumstat; 
do 
newname=$( echo $f | sed -r 's/_EKDN[0-9]{9}-1A.sumstat//' ); #'s/AAAA/BBBB/' AAAA is to find the the matching pattern, BBBB is the replacement
mv $f $newname; 
done


##-4- add the file name as a column into each file
for f in *; 
do 
sed -i "s/$/\t$f/" $f; #\t stands for TAB, while $ is the end of the line originally
done

##-5- concatenate all outputs into one file
cat ./* > GeumAll_mapping_stats.txt #now this .txt is ready to be download and view on your local machine


####------------------------------Compile all depth stats----------------------------------------


##-2- get summarised info from samtools.coverage reports
cd /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum

###-2.1- frist inspect the coverage report structure
#less ML027*.samtools.coverage #to view it
#head -1 ML024_EKDN230035852-1A.samtools.coverage | tr '\t' '\n' | wc -l #to figure out how many columns in this table
#tr 'A' 'B' will replace A with B
#here, you are replacing all the TAB by a newline so that by counting the number of newlines, you get the number of columns

###-2.2- extract the column that you need
parallel 'cut -f 1,6,7 {}.samtools.coverage > ./sumstat/depth/{}.sumstat' :::: /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum/Geum_dedup_cov.txt

##-3- rename outputs
cd /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum/sumstat/depth

for f in ./*.sumstat;
do  newname=$( echo $f | sed -r 's/_EKDN[0-9]{9}-1A.sumstat//' ); #'s/AAAA/BBBB/' AAAA is to find the the matching pattern, BBBB is the replacement 
mv $f $newname;
done
  

##-4- add the file name as a column into each file
for f in *; 
do sed -i "s/$/\t$f/" $f; #\t stands for TAB, while $ is the end of the line originally
done

##-5- concatenate all outputs into one file
cat ./* > GeumAll_depth_stats.txt #now this .txt is ready to be download and view on your local machine


####------------------------------Clean up this directory----------------------------------------
cd /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum
mkdir sumstat/original_file
mv *-1A.* sumstat/original_file/




