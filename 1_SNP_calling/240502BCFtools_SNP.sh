#!/bin/bash
#SBATCH --job-name="Prim_refDToL_bcftoolsSNP"
#SBATCH --output="/mnt/shared/scratch/mlu/1_VCFs/3_raw_SNPs/BCFtools/Prim_refDToL/Prim_refDToL_bcftoolsSNP.out"
#SBATCH --error="/mnt/shared/scratch/mlu/1_VCFs/3_raw_SNPs/BCFtools/Prim_refDToL/Prim_refDToL_bcftoolsSNP.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=2G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

cd /mnt/shared/scratch/mlu/1_VCFs/3_raw_SNPs/BCFtools/Prim_refDToL

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

##-1- define variables

INDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Prim_refDToL #directory for the input bam files
OUTDIR=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools/Prim_refDToL #directory for the output bam files

REF=/home/mlu/scratch/0_ref_Geno/Primula/PriVulg.fasta #the absolute path to find the reference genome


##-2- BCFtools SNP calling

time bcftools mpileup -a AD,DP,SP -Q 30 -q 30 -Ou -f $REF $INDIR/*_dedup_RG.bam | bcftools call -mv -f GQ,GP -Oz -o $OUTDIR/240502_Prim_all.vcf.gz




