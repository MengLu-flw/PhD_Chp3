#!/bin/bash
#SBATCH --job-name="Geum_allSITE"
#SBATCH --output="/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Geum/array_out/Geum_allSITE_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Geum/array_out/Geum_allSITE_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=4G
#SBATCH --array=1-21%5
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


# Use BCFtools to call true SNPs (without monomorphic sites)

# bcftools mpileup -a AD,DP,SP -Q 30 -q 30 -Ou -f | bcftools call -mv -f GQ,GP -Oz -o

# -a AD,DP,SP: annotate allelic depth (AD), number of high-quality bases (DP), and Phred-scaled strand bias P-value (SP) to the FORMAT field int the VCF output
# -Q 30: minimum base quality as 30 for a base to be considered
# -q 30: minimum mapping quality as 30 for an alignment to be used
# -Ou: define output type as uncompressed BCF; Use the -Ou option when piping between bcftools subcommands to speed up performance by removing unnecessary compressions and conversions
# -f: call the faidx-indexed reference genome file (in FASTA format)
# -mv: -m multiallelic caller;  -v output variant sites only
# -f GQ,GP: annotate genotype quality (GQ) and genotype posterior probabilities (GP) to FORMAT fields of the output VCF ;currently GQ and GP fields are supported.
# -Oz: define output type as compressed VCF
# -o: define output file name


##-0- define working directory
cd /home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Geum

##-1- define variables
#directory for the input bam files: /home/mlu/scratch/1_VCFs/2_precalling_bam/Geum

OUTDIR=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Geum #directory for the output bam files

REF=/home/mlu/scratch/0_ref_Geno/Geum/GeuUrba.fasta #the absolute path to find the reference genome

bamList=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools_perCHR/Geum/Geum_bamlist #the absolute path to find the list of bam files

##-2- BCFtools all-site calling per CHROM, using arrary job

##-2.1- Set up array job input

echo $SLURM_ARRAY_TASK_ID
CHROM=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $OUTDIR/Geum_CHRname.txt)   ### This is a list containing all main chromosome names

##-2.2- Run BCFtools in arrary

time bcftools mpileup -a AD,DP,SP -Q 30 -q 30 -Ou -f $REF -b $bamList -r "$CHROM" | bcftools call -m -f GQ,GP -Oz -o $OUTDIR/2401118_Geum_"$CHROM".vcf.gz

