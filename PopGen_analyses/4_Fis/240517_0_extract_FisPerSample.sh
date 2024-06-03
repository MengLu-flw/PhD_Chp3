### ---------------------------------------------------------------------------------- ###
## See if Fis value is the same when you only extract the VCF of one single sample
### ---------------------------------------------------------------------------------- ###
#!/bin/bash
#SBATCH --job-name="0_extract_FisPerSample"
#SBATCH --output="/mnt/shared/scratch/mlu/4_Chp3/Inbreeding/test/Slurm/0_extract_FisPerSample.out"
#SBATCH --error="/mnt/shared/scratch/mlu/4_Chp3/Inbreeding/test/Slurm/0_extract_FisPerSample.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

cd /mnt/shared/scratch/mlu/4_Chp3/Inbreeding/test

##-1- Check the sample names in a VCF
VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Geum_riv_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# G_rivale_ML027
# G_rivale_ML028
# G_rivale_ML049
# G_rivale_ML053
# G_rivale_ML056
# G_rivale_ML057
# G_rivale_ML070
# G_rivale_ML073
# G_rivale_ML124
# G_rivale_ML125
# G_rivale_ML143
# G_rivale_ML144
# G_rivale_ML149
# G_rivale_ML150
# G_rivale_ML177
# G_rivale_ML275
# G_rivale_ML277
# time bcftools view -s G_rivale_ML027 $VCF -Oz -o G_rivale_ML027.vcf.gz
# time bcftools view -s G_rivale_ML277 $VCF -Oz -o G_rivale_ML277.vcf.gz


VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Geum_urb_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# G_urbanum_ML033
# G_urbanum_ML037
# G_urbanum_ML045
# G_urbanum_ML048
# G_urbanum_ML058
# G_urbanum_ML059
# G_urbanum_ML060
# G_urbanum_ML075
# G_urbanum_ML079
# G_urbanum_ML088
# G_urbanum_ML101
# G_urbanum_ML104
# G_urbanum_ML114
# G_urbanum_ML130
# G_urbanum_ML136
# G_urbanum_ML145
# G_urbanum_ML271
# G_urbanum_ML273
# G_urbanum_ML274
# G_urbanum_ML276
# G_urbanum_ML280
# G_urbanum_ML282
# G_urbanum_ML283
time bcftools view -s G_urbanum_ML033 $VCF -Oz -o G_urbanum_ML033.vcf.gz
time bcftools view -s G_urbanum_ML104 $VCF -Oz -o G_urbanum_ML104.vcf.gz
time bcftools view -s G_urbanum_ML283 $VCF -Oz -o G_urbanum_ML283.vcf.gz



VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Lina_rep_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# L_repens_ML085
# L_repens_ML096
# L_repens_ML113
# L_repens_ML118
# L_repens_ML129
# L_repens_ML134
# L_repens_ML234A
time bcftools view -s L_repens_ML085 $VCF -Oz -o L_repens_ML085.vcf.gz
time bcftools view -s L_repens_ML234A $VCF -Oz -o L_repens_ML234A.vcf.gz


VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Lina_vul_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# L_vulgaris_ML139
# L_vulgaris_ML148
# L_vulgaris_ML157
# L_vulgaris_ML161
# L_vulgaris_ML188
# L_vulgaris_ML235A
# L_vulgaris_ML236A
time bcftools view -s L_vulgaris_ML139 $VCF -Oz -o L_vulgaris_ML139.vcf.gz
time bcftools view -s L_vulgaris_ML236A $VCF -Oz -o L_vulgaris_ML236A.vcf.gz


VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Prim_ver_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# P_veris_ML005
# P_veris_ML007
# P_veris_ML008
# P_veris_ML011
# P_veris_ML012
# P_veris_ML013
# P_veris_ML014
# P_veris_ML018
# P_veris_ML019
# P_veris_ML031
# P_veris_ML035
# P_veris_ML036
# P_veris_ML040
# P_veris_ML107
# P_veris_ML119
# P_veris_ML137
# P_veris_ML269
# P_veris_ML270
time bcftools view -s P_veris_ML005 $VCF -Oz -o P_veris_ML005.vcf.gz
time bcftools view -s P_veris_ML019 $VCF -Oz -o P_veris_ML019.vcf.gz
time bcftools view -s P_veris_ML270 $VCF -Oz -o P_veris_ML270.vcf.gz


VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Prim_vul_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# P_vulgaris_ML001
# P_vulgaris_ML002
# P_vulgaris_ML009
# P_vulgaris_ML015
# P_vulgaris_ML016
# P_vulgaris_ML021
# P_vulgaris_ML022
# P_vulgaris_ML023
# P_vulgaris_ML024
# P_vulgaris_ML029
# P_vulgaris_ML030
# P_vulgaris_ML039
# P_vulgaris_ML141
# P_vulgaris_ML142
# P_vulgaris_ML175
# P_vulgaris_ML183
# P_vulgaris_ML186
# P_vulgaris_ML278
time bcftools view -s P_vulgaris_ML001 $VCF -Oz -o P_vulgaris_ML001.vcf.gz
time bcftools view -s P_vulgaris_ML024 $VCF -Oz -o P_vulgaris_ML024.vcf.gz
time bcftools view -s P_vulgaris_ML278 $VCF -Oz -o P_vulgaris_ML278.vcf.gz


VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Verb_nig_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# V_nigrum_ML092
# V_nigrum_ML103
# V_nigrum_ML174
# V_nigrum_ML225
# V_nigrum_ML227
# V_nigrum_ML240A
# V_nigrum_ML312
time bcftools view -s V_nigrum_ML092 $VCF -Oz -o V_nigrum_ML092.vcf.gz
time bcftools view -s V_nigrum_ML312 $VCF -Oz -o V_nigrum_ML312.vcf.gz
time bcftools view -s V_nigrum_ML174 $VCF -Oz -o V_nigrum_ML174.vcf.gz

VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Verb_tha_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# V_thapsus_ML061
# V_thapsus_ML062
# V_thapsus_ML068
# V_thapsus_ML076
# V_thapsus_ML083
# V_thapsus_ML089
# V_thapsus_ML105
# V_thapsus_ML110
# V_thapsus_ML117
# V_thapsus_ML120
# V_thapsus_ML123
# V_thapsus_ML128
# V_thapsus_ML133
# V_thapsus_ML140
time bcftools view -s V_thapsus_ML061 $VCF -Oz -o V_thapsus_ML061.vcf.gz
time bcftools view -s V_thapsus_ML105 $VCF -Oz -o V_thapsus_ML105.vcf.gz
time bcftools view -s V_thapsus_ML140 $VCF -Oz -o V_thapsus_ML140.vcf.gz


VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Viol_hir_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# V_hirta_ML153
# V_hirta_ML160
# V_hirta_ML241A
# V_hirta_ML242A
# V_hirta_ML243A
time bcftools view -s V_hirta_ML153 $VCF -Oz -o V_hirta_ML153.vcf.gz
time bcftools view -s V_hirta_ML243A $VCF -Oz -o V_hirta_ML243A.vcf.gz

VCF=/home/mlu/scratch/1_VCFs/4_filtered_SNPs/per_species/240405_Viol_odo_MACfiltered.vcf.gz
# time bcftools query -l $VCF
# V_odorata_ML003
# V_odorata_ML004
# V_odorata_ML017
# V_odorata_ML026
# V_odorata_ML044
# V_odorata_ML168
# V_odorata_ML171
# V_odorata_ML176
time bcftools view -s V_odorata_ML003 $VCF -Oz -o V_odorata_ML003.vcf.gz
time bcftools view -s V_odorata_ML176 $VCF -Oz -o V_odorata_ML176.vcf.gz

