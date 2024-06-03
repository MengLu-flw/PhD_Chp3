setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/1_SNPs/2024_0_dedupBAM_stats/0429_Prim_DToL")
getwd()

library(xlsx)
library(rlang)
library(ggplot2)
library(ggpubr)
library(ggrepel)


#read in data
Prim_DToL <- read.xlsx("BWA_depth.xlsx", "Prim_DToL_main", header=TRUE)
Prim_DToL <- Prim_DToL[complete.cases(Prim_DToL), ]
Pvulg_DToL <- Prim_DToL[Prim_DToL$Species=="Primula vulgaris",1:5]
Pveri_DToL <- Prim_DToL[Prim_DToL$Species=="Primula veris",1:5]

Prim_autoS <- read.xlsx("BWA_depth.xlsx", "Primula_nucl", header=TRUE)
Prim_autoS <- Prim_autoS[complete.cases(Prim_autoS), ]
Pvulg_autoS <- Prim_autoS[Prim_autoS$Species=="Primula vulgaris",1:5]
Pveri_autoS <- Prim_autoS[Prim_autoS$Species=="Primula veris",1:5]


#####Violin plot - Samtools breadth of covering ref. genome####
#-0- Ref.chromosome.name~breadth of covering ref. genome
Pvulg_1 <-ggplot(Pvulg_autoS, aes(x=Ref.chromosome.name, y=Coverage, label=Sample.ID)) +
  geom_violin(aes(colour =Ref.chromosome.name), fill=NA, size=1, trim=FALSE) +
  labs(title="Primula vulgaris breadth of covering ref. genome") +
  geom_dotplot(aes(fill=Ref.chromosome.name),binaxis='y', stackdir='center', dotsize=0.6) +
  geom_text_repel(aes(size = 10)) +
  scale_x_discrete(labels=c("lcl|pve_haplotypeT_001" = "Chr 1",
                            "lcl|pve_haplotypeT_002" = "Chr 2",
                            "lcl|pve_haplotypeT_003" = "Chr 3",
                            "lcl|pve_haplotypeT_004" = "Chr 4",
                            "lcl|pve_haplotypeT_005" = "Chr 5",
                            "lcl|pve_haplotypeT_006" = "Chr 6",
                            "lcl|pve_haplotypeT_007" = "Chr 7",
                            "lcl|pve_haplotypeT_008" = "Chr 8",
                            "lcl|pve_haplotypeT_009" = "Chr 9",
                            "lcl|pve_haplotypeT_010" = "Chr 10",
                            "lcl|pve_haplotypeT_011" = "Chr 11")) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none")

#Pvulg_1


Pveri_1 <-ggplot(Pveri_autoS, aes(x=Ref.chromosome.name, y=Coverage, label=Sample.ID)) +
  geom_violin(aes(colour =Ref.chromosome.name), fill=NA, size=1, trim=FALSE) +
  labs(title="Primula veris breadth of covering ref. genome") +
  geom_dotplot(aes(fill=Ref.chromosome.name),binaxis='y', stackdir='center', dotsize=0.6) +
  geom_text_repel(aes(size = 10)) +
  scale_x_discrete(labels=c("lcl|pve_haplotypeT_001" = "Chr 1",
                            "lcl|pve_haplotypeT_002" = "Chr 2",
                            "lcl|pve_haplotypeT_003" = "Chr 3",
                            "lcl|pve_haplotypeT_004" = "Chr 4",
                            "lcl|pve_haplotypeT_005" = "Chr 5",
                            "lcl|pve_haplotypeT_006" = "Chr 6",
                            "lcl|pve_haplotypeT_007" = "Chr 7",
                            "lcl|pve_haplotypeT_008" = "Chr 8",
                            "lcl|pve_haplotypeT_009" = "Chr 9",
                            "lcl|pve_haplotypeT_010" = "Chr 10",
                            "lcl|pve_haplotypeT_011" = "Chr 11")) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none")

#Pveri_1




Pvulg_2 <-ggplot(Pvulg_DToL, aes(x=Ref.chromosome.name, y=Coverage, label=Sample.ID)) +
  geom_violin(aes(colour =Ref.chromosome.name), fill=NA, size=1, trim=FALSE) +
  labs(title="Primula vulgaris DToL REF breadth of covering ref. genome") +
  geom_dotplot(aes(fill=Ref.chromosome.name),binaxis='y', stackdir='center', dotsize=0.6) +
  geom_text_repel(aes(size = 10)) +
  scale_x_discrete(labels=c("01|OY987212.1" = "Chr 1",
                            "02|OY987213.1" = "Chr 2",
                            "03|OY987214.1" = "Chr 3",
                            "04|OY987215.1" = "Chr 4",
                            "05|OY987216.1" = "Chr 5",
                            "06|OY987217.1" = "Chr 6",
                            "07|OY987218.1" = "Chr 7",
                            "08|OY987219.1" = "Chr 8",
                            "09|OY987220.1" = "Chr 9",
                            "10|OY987221.1" = "Chr 10",
                            "11|OY987222.1" = "Chr 11",
                            "MT|OY987223.1" = "MIT",
                            "Plt|OY987224.1" = "PLT")) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none")

#Pvulg_2

Pveri_2 <-ggplot(Pveri_DToL, aes(x=Ref.chromosome.name, y=Coverage, label=Sample.ID)) +
  geom_violin(aes(colour =Ref.chromosome.name), fill=NA, size=1, trim=FALSE) +
  labs(title="Primula veris DToL REF breadth of covering ref. genome") +
  geom_dotplot(aes(fill=Ref.chromosome.name),binaxis='y', stackdir='center', dotsize=0.6) +
  geom_text_repel(aes(size = 10)) +
  scale_x_discrete(labels=c("01|OY987212.1" = "Chr 1",
                            "02|OY987213.1" = "Chr 2",
                            "03|OY987214.1" = "Chr 3",
                            "04|OY987215.1" = "Chr 4",
                            "05|OY987216.1" = "Chr 5",
                            "06|OY987217.1" = "Chr 6",
                            "07|OY987218.1" = "Chr 7",
                            "08|OY987219.1" = "Chr 8",
                            "09|OY987220.1" = "Chr 9",
                            "10|OY987221.1" = "Chr 10",
                            "11|OY987222.1" = "Chr 11",
                            "MT|OY987223.1" = "MIT",
                            "Plt|OY987224.1" = "PLT")) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none")
#Pveri_2


###-Plotting
pdf(file = "BWA_breadth_of_coverage_Prim0429.pdf", width = 10, height = 15)

p <- ggarrange(Pvulg_1, Pveri_1,
               Pvulg_2, Pveri_2,
               ncol = 1, nrow = 2)

p

dev.off()

