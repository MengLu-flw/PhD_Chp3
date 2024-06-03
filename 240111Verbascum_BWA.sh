#!/bin/bash
#SBATCH --job-name="Verbascum_BWA"
#SBATCH --output="/home/mlu/scratch/1_VCFs/1_aligned_bam/Verbascum/array_out/Verbascum_BWA_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/1_aligned_bam/Verbascum/array_out/Verbascum_BWA_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=8G
#SBATCH --array=1-21%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- make sure that ref. genome has been indexed
# time bwa index /home/mlu/scratch/0_ref_Geno/Verbascum/VerThap.fasta


##-1- define variables
LISTDIR=/home/mlu/scratch/1_VCFs/1_aligned_bam/Verbascum #directory to find sample list
SEQDIR=/home/mlu/projects/rbge/mlu/1_trimdata_fastp/all_trimmed #directory to find trimmed reads
REF=/home/mlu/scratch/0_ref_Geno/Verbascum/VerThap.fasta #directory to the ref geno & ref geno
OUTDIR=/home/mlu/scratch/1_VCFs/1_aligned_bam/Verbascum #directory for the output bam files


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
name=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $LISTDIR/Verbsample.txt)   ### This is a namelist for all Geum allopatry files, format 'ML027_EKDN220041655-1A', 'ML028_EKDN220041656-1A'...per line


##-3- BWA mem mapping
time bwa mem -M -t 8 $REF $SEQDIR/"$name"_R1_trimmed.fq.gz $SEQDIR/"$name"_R2_trimmed.fq.gz | samtools view -b | samtools sort -T "$name" > $OUTDIR/"$name"_sort.bam 

#You can also ONLY called the UNIQUE alignment - that's to say, you are essentially 'masking' the ref. genome and throwing away the repeats
#You can do this by adding samtools view -q 1, you are skipping alignments with MAPQ smaller than 1 (i.e., only have a unique map) 
#But you might NOT want to do this, as your Geum are ancient hexaploids
#bwa-mem2 mem -M -t 12 $REF $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R1_trimmed.fastq.gz $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R2_trimmed.fastq.gz | samtools view -b -q 1| samtools sort -T "$name" > "$name"_sort.bam 

#You can also define your readgroups here now by adding -R in bwa
#bwa-mem2 mem -M -t 12 $REF $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R1_trimmed.fastq.gz $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R2_trimmed.fastq.gz -R '@RG\tID:PT_MI_86\tSM:PT_MI_86'| samtools view -b -q 1| samtools sort -T "$name" > "$name"_sort.bam 


## -4- Get mapping stats from bwa
cd $OUTDIR
samtools flagstat "$name"_sort.bam > "$name".flagstat
samtools coverage -H "$name"_sort.bam > "$name".samtools.coverage



#####---------------------------------------------------------------------------------####

#!/bin/bash
#SBATCH --job-name="Viola_BWA"
#SBATCH --output="/home/mlu/scratch/1_VCFs/1_aligned_bam/Viola/array_out/Viola_BWA.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/1_aligned_bam/Viola/array_out/Viola_BWA.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=8G
#SBATCH --array=1-13%6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- make sure that ref. genome has been indexed
# time bwa index /home/mlu/scratch/0_ref_Geno/Viola/VioOdor.fasta


##-1- define variables
LISTDIR=/home/mlu/scratch/1_VCFs/1_aligned_bam/Viola #directory to find sample list
SEQDIR=/home/mlu/projects/rbge/mlu/1_trimdata_fastp/all_trimmed #directory to find trimmed reads
REF=/home/mlu/scratch/0_ref_Geno/Viola/VioOdor.fasta #directory to the ref geno & ref geno
OUTDIR=/home/mlu/scratch/1_VCFs/1_aligned_bam/Viola #directory for the output bam files


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
name=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $LISTDIR/Violsample.txt)   ### This is a namelist for all Geum allopatry files, format 'ML027_EKDN220041655-1A', 'ML028_EKDN220041656-1A'...per line


##-3- BWA mem mapping
time bwa mem -M -t 8 $REF $SEQDIR/"$name"_R1_trimmed.fq.gz $SEQDIR/"$name"_R2_trimmed.fq.gz | samtools view -b | samtools sort -T "$name" > $OUTDIR/"$name"_sort.bam 

#You can also ONLY called the UNIQUE alignment - that's to say, you are essentially 'masking' the ref. genome and throwing away the repeats
#You can do this by adding samtools view -q 1, you are skipping alignments with MAPQ smaller than 1 (i.e., only have a unique map) 
#But you might NOT want to do this, as your Geum are ancient hexaploids
#bwa-mem2 mem -M -t 12 $REF $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R1_trimmed.fastq.gz $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R2_trimmed.fastq.gz | samtools view -b -q 1| samtools sort -T "$name" > "$name"_sort.bam 

#You can also define your readgroups here now by adding -R in bwa
#bwa-mem2 mem -M -t 12 $REF $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R1_trimmed.fastq.gz $SEQDIR/$FOLDER/All_fastp_trimmed/"$name"_R2_trimmed.fastq.gz -R '@RG\tID:PT_MI_86\tSM:PT_MI_86'| samtools view -b -q 1| samtools sort -T "$name" > "$name"_sort.bam 


## -4- Get mapping stats from bwa
cd $OUTDIR
samtools flagstat "$name"_sort.bam > "$name".flagstat
samtools coverage -H "$name"_sort.bam > "$name".samtools.coverage
