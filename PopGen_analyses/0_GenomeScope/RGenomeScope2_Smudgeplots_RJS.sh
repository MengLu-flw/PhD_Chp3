#!/bin/bash

#SBATCH --job-name=%j_GenomeScope2_smudgeplots_Plate7
#SBATCH --output=%j_GenomeScope2_smudgeplots_Plate7.txt
#SBATCH --mem=40G
#SBATCH --cpus-per-task=12
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=r.j.schley@exeter.ac.uk


SEQNAME=$1
DATADIR=/home/rschley/projects/rbge/rschley/Inga_analyses/Data_collection/Inga_resequencing_data/Plate_7_Inga_polyploids_Project_11040/V0323_plate7/01_raw_reads



########################################################## Just for fun lets run genomescope ##########################################################

mkdir "$SEQNAME"
cd "$SEQNAME"

#First, you need to generate a kmer database with FastK 
## Make kmer database by running FastK with kmer size of 31, 4 threads
echo 'Making Kmer database'
FastK -v -t4 -k31 -M16 -T4 "$DATADIR"/"$SEQNAME"*.fastq.gz -N"$SEQNAME"


#Make histogram with Histex
Histex -G "$SEQNAME" > "$SEQNAME"_k31_GS.hist


# Run GenomeScope
echo 'Running GenomeScope'
genomescope2 -p 2 -i "$SEQNAME"_k31_GS.hist -o ./"$SEQNAME"_dip -n "$SEQNAME"_dip -k 31 --verbose
genomescope2 -p 3 -i "$SEQNAME"_k31_GS.hist -o ./"$SEQNAME"_tri -n "$SEQNAME"_tri -k 31 --verbose
genomescope2 -p 4 -i "$SEQNAME"_k31_GS.hist -o ./"$SEQNAME"_tet -n "$SEQNAME"_tet -k 31 --verbose




########################################################## Running smudgeplots ##########################################################
# from BGA workshop version https://github.com/BGAcademy23/smudgeplot

#Run smudgeplot
echo 'Running Smudgeplot'
/home/rschley/scratch/apps/smudgeplot/exec/smudgeplot.py hetmers -L 10 -t 4 --verbose -o "$SEQNAME"_k31_pairs "$SEQNAME".ktab

#Plot smudgeplot
/home/rschley/scratch/apps/smudgeplot/exec/smudgeplot.py plot -t "$SEQNAME" -o "$SEQNAME"_k31_smudgeplot "$SEQNAME"_k31_pairs_text.smu
