setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity")
getwd()

library(xlsx)
library(rlang)
library(ggplot2)
library(scales)
library(ggpubr)
library(ggrepel)

#---Read in data####
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Geum/20K/pi")
getwd()
Geum_CHR1 <- read.delim("GeumCHR01_pi.txt", header = TRUE, sep = "\t")
Geum_CHR2 <- read.delim("GeumCHR02_pi.txt", header = TRUE, sep = "\t")
Geum_CHR3 <- read.delim("GeumCHR03_pi.txt", header = TRUE, sep = "\t")
Geum_CHR4 <- read.delim("GeumCHR04_pi.txt", header = TRUE, sep = "\t")
Geum_CHR5 <- read.delim("GeumCHR05_pi.txt", header = TRUE, sep = "\t")
Geum_CHR6 <- read.delim("GeumCHR06_pi.txt", header = TRUE, sep = "\t")
Geum_CHR7 <- read.delim("GeumCHR07_pi.txt", header = TRUE, sep = "\t")
Geum_CHR8 <- read.delim("GeumCHR08_pi.txt", header = TRUE, sep = "\t")
Geum_CHR9 <- read.delim("GeumCHR09_pi.txt", header = TRUE, sep = "\t")
Geum_CHR10 <- read.delim("GeumCHR10_pi.txt", header = TRUE, sep = "\t")
Geum_CHR11 <- read.delim("GeumCHR11_pi.txt", header = TRUE, sep = "\t")
Geum_CHR12 <- read.delim("GeumCHR12_pi.txt", header = TRUE, sep = "\t")
Geum_CHR13 <- read.delim("GeumCHR13_pi.txt", header = TRUE, sep = "\t")
Geum_CHR14 <- read.delim("GeumCHR14_pi.txt", header = TRUE, sep = "\t")
Geum_CHR15 <- read.delim("GeumCHR15_pi.txt", header = TRUE, sep = "\t")
Geum_CHR16 <- read.delim("GeumCHR16_pi.txt", header = TRUE, sep = "\t")
Geum_CHR17 <- read.delim("GeumCHR17_pi.txt", header = TRUE, sep = "\t")
Geum_CHR18 <- read.delim("GeumCHR18_pi.txt", header = TRUE, sep = "\t")
Geum_CHR19 <- read.delim("GeumCHR19_pi.txt", header = TRUE, sep = "\t")
Geum_CHR20 <- read.delim("GeumCHR20_pi.txt", header = TRUE, sep = "\t")
Geum_CHR21 <- read.delim("GeumCHR21_pi.txt", header = TRUE, sep = "\t")


setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Linaria/20K/pi")
getwd()
Lina_CHR1 <- read.delim("LinaCHR01_pi.txt", header = TRUE, sep = "\t")
Lina_CHR2 <- read.delim("LinaCHR02_pi.txt", header = TRUE, sep = "\t")
Lina_CHR3 <- read.delim("LinaCHR03_pi.txt", header = TRUE, sep = "\t")
Lina_CHR4 <- read.delim("LinaCHR04_pi.txt", header = TRUE, sep = "\t")
Lina_CHR5 <- read.delim("LinaCHR05_pi.txt", header = TRUE, sep = "\t")
Lina_CHR6 <- read.delim("LinaCHR06_pi.txt", header = TRUE, sep = "\t")


setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Primula/20K/pi")
getwd()
Prim_CHR1 <- read.delim("PrimCHR01_pi.txt", header = TRUE, sep = "\t")
Prim_CHR2 <- read.delim("PrimCHR02_pi.txt", header = TRUE, sep = "\t")
Prim_CHR3 <- read.delim("PrimCHR03_pi.txt", header = TRUE, sep = "\t")
Prim_CHR4 <- read.delim("PrimCHR04_pi.txt", header = TRUE, sep = "\t")
Prim_CHR5 <- read.delim("PrimCHR05_pi.txt", header = TRUE, sep = "\t")
Prim_CHR6 <- read.delim("PrimCHR06_pi.txt", header = TRUE, sep = "\t")
Prim_CHR7 <- read.delim("PrimCHR07_pi.txt", header = TRUE, sep = "\t")
Prim_CHR8 <- read.delim("PrimCHR08_pi.txt", header = TRUE, sep = "\t")
Prim_CHR9 <- read.delim("PrimCHR09_pi.txt", header = TRUE, sep = "\t")
Prim_CHR10 <- read.delim("PrimCHR10_pi.txt", header = TRUE, sep = "\t")
Prim_CHR11 <- read.delim("PrimCHR11_pi.txt", header = TRUE, sep = "\t")


setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Verbascum/20K/pi")
getwd()
Verb_CHR1 <- read.delim("VerbCHR01_pi.txt", header = TRUE, sep = "\t")
Verb_CHR2 <- read.delim("VerbCHR02_pi.txt", header = TRUE, sep = "\t")
Verb_CHR3 <- read.delim("VerbCHR03_pi.txt", header = TRUE, sep = "\t")
Verb_CHR4 <- read.delim("VerbCHR04_pi.txt", header = TRUE, sep = "\t")
Verb_CHR5 <- read.delim("VerbCHR05_pi.txt", header = TRUE, sep = "\t")
Verb_CHR6 <- read.delim("VerbCHR06_pi.txt", header = TRUE, sep = "\t")
Verb_CHR7 <- read.delim("VerbCHR07_pi.txt", header = TRUE, sep = "\t")
Verb_CHR8 <- read.delim("VerbCHR08_pi.txt", header = TRUE, sep = "\t")
Verb_CHR9 <- read.delim("VerbCHR09_pi.txt", header = TRUE, sep = "\t")
Verb_CHR10 <- read.delim("VerbCHR10_pi.txt", header = TRUE, sep = "\t")
Verb_CHR11 <- read.delim("VerbCHR11_pi.txt", header = TRUE, sep = "\t")
Verb_CHR12 <- read.delim("VerbCHR12_pi.txt", header = TRUE, sep = "\t")
Verb_CHR13 <- read.delim("VerbCHR13_pi.txt", header = TRUE, sep = "\t")
Verb_CHR14 <- read.delim("VerbCHR14_pi.txt", header = TRUE, sep = "\t")
Verb_CHR15 <- read.delim("VerbCHR15_pi.txt", header = TRUE, sep = "\t")
Verb_CHR16 <- read.delim("VerbCHR16_pi.txt", header = TRUE, sep = "\t")
Verb_CHR17 <- read.delim("VerbCHR17_pi.txt", header = TRUE, sep = "\t")
Verb_CHR18 <- read.delim("VerbCHR18_pi.txt", header = TRUE, sep = "\t")


setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Viola/20K/pi")
getwd()
Viol_CHR1 <- read.delim("ViolCHR01_pi.txt", header = TRUE, sep = "\t")
Viol_CHR2 <- read.delim("ViolCHR02_pi.txt", header = TRUE, sep = "\t")
Viol_CHR3 <- read.delim("ViolCHR03_pi.txt", header = TRUE, sep = "\t")
Viol_CHR4 <- read.delim("ViolCHR04_pi.txt", header = TRUE, sep = "\t")
Viol_CHR5 <- read.delim("ViolCHR05_pi.txt", header = TRUE, sep = "\t")
Viol_CHR6 <- read.delim("ViolCHR06_pi.txt", header = TRUE, sep = "\t")
Viol_CHR7 <- read.delim("ViolCHR07_pi.txt", header = TRUE, sep = "\t")
Viol_CHR8 <- read.delim("ViolCHR08_pi.txt", header = TRUE, sep = "\t")
Viol_CHR9 <- read.delim("ViolCHR09_pi.txt", header = TRUE, sep = "\t")
Viol_CHR10 <- read.delim("ViolCHR10_pi.txt", header = TRUE, sep = "\t")

#---####

#---Combine datasets####
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity")
getwd()
Geum_all_pi <- rbind(Geum_CHR1,Geum_CHR2,Geum_CHR3,Geum_CHR4,Geum_CHR5,
                     Geum_CHR6,Geum_CHR7,Geum_CHR8,Geum_CHR9,Geum_CHR10,
                     Geum_CHR11,Geum_CHR12,Geum_CHR13,Geum_CHR14,Geum_CHR15,
                     Geum_CHR16,Geum_CHR17,Geum_CHR18,Geum_CHR19,Geum_CHR20,
                     Geum_CHR21)

Geum_riv <- Geum_all_pi[Geum_all_pi$pop == "Geum_rivale", ]
Geum_riv$avg_pi <- as.numeric(Geum_riv$avg_pi)
mean(Geum_riv$avg_pi, na.rm = TRUE)
# 0.01293423
Geum_urb <- Geum_all_pi[Geum_all_pi$pop == "Geum_urbanum", ]
Geum_urb$avg_pi <- as.numeric(Geum_urb$avg_pi)
mean(Geum_urb$avg_pi, na.rm = TRUE)
# 0.002457068


Lina_all_pi <- rbind(Lina_CHR1,Lina_CHR2,Lina_CHR3,Lina_CHR4,Lina_CHR5,
                     Lina_CHR6)
Lina_rep <- Lina_all_pi[Lina_all_pi$pop == "Linaria_repens", ]
Lina_rep$avg_pi <- as.numeric(Lina_rep$avg_pi)
mean(Lina_rep$avg_pi, na.rm = TRUE)
# 0.03146413
Lina_vul <- Lina_all_pi[Lina_all_pi$pop == "Linaria_vulgaris", ]
Lina_vul$avg_pi <- as.numeric(Lina_vul$avg_pi)
mean(Lina_vul$avg_pi, na.rm = TRUE)
# 0.01915102


Prim_all_pi <- rbind(Prim_CHR1,Prim_CHR2,Prim_CHR3,Prim_CHR4,Prim_CHR5,
                     Prim_CHR6,Prim_CHR7,Prim_CHR8,Prim_CHR9,Prim_CHR10,
                     Prim_CHR11)
Prim_ver <- Prim_all_pi[Prim_all_pi$pop == "Primula_veris", ]
Prim_ver$avg_pi <- as.numeric(Prim_ver$avg_pi)
mean(Prim_ver$avg_pi, na.rm = TRUE)
# 0.004854202
Prim_vul <- Prim_all_pi[Prim_all_pi$pop == "Primula_vulgaris", ]
Prim_vul$avg_pi <- as.numeric(Prim_vul$avg_pi)
mean(Prim_vul$avg_pi, na.rm = TRUE)
# 0.00772473


Verb_all_pi <- rbind(Verb_CHR1,Verb_CHR2,Verb_CHR3,Verb_CHR4,Verb_CHR5,
                     Verb_CHR6,Verb_CHR7,Verb_CHR8,Verb_CHR9,Verb_CHR10,
                     Verb_CHR11,Verb_CHR12,Verb_CHR13,Verb_CHR14,Verb_CHR15,
                     Verb_CHR16,Verb_CHR17,Verb_CHR18)

Verb_nig <- Verb_all_pi[Verb_all_pi$pop == "Verbascum_nigrum", ]
Verb_nig$avg_pi <- as.numeric(Verb_nig$avg_pi)
mean(Verb_nig$avg_pi, na.rm = TRUE)
# 0.01325095
Verb_tha <- Verb_all_pi[Verb_all_pi$pop == "Verbascum_thapsus", ]
Verb_tha$avg_pi <- as.numeric(Verb_tha$avg_pi)
mean(Verb_tha$avg_pi, na.rm = TRUE)
# 0.003183466


Viol_all_pi <- rbind(Viol_CHR1,Viol_CHR2,Viol_CHR3,Viol_CHR4,Viol_CHR5,
                     Viol_CHR6,Viol_CHR7,Viol_CHR8,Viol_CHR9,Viol_CHR10)

Viol_hir <- Viol_all_pi[Viol_all_pi$pop == "Viola_hirta", ]
Viol_hir$avg_pi <- as.numeric(Viol_hir$avg_pi)
mean(Viol_hir$avg_pi, na.rm = TRUE)
# 0.01335917
Viol_odo <- Viol_all_pi[Viol_all_pi$pop == "Viola_odorata", ]
Viol_odo$avg_pi <- as.numeric(Viol_odo$avg_pi)
mean(Viol_odo$avg_pi, na.rm = TRUE)
# 0.003931855

#---####

#---Plot####

all_pi <- rbind(Geum_all_pi,Lina_all_pi,Prim_all_pi,Verb_all_pi,Viol_all_pi)


col <- c("Geum_rivale" = "#7470AF", "Geum_urbanum" = "#087234",
         "Linaria_vulgaris" = "#B9974B", "Linaria_repens" = "#B46BA2",
         "Primula_vulgaris" = "#FFC000", "Primula_veris" = "#ED7D31",
         "Verbascum_thapsus" = "#6B4215", "Verbascum_nigrum" = "#7A1751",
         "Viola_udorata" = "#7A93FF", "Viola_hirta" = "#433B95")

ALL <- ggplot(data=all_pi, aes(x=pop, y=avg_pi, colour=pop)) +
  geom_violin(trim=FALSE, alpha=0.3,linewidth = 1) +
  scale_colour_manual(values = col) +
  geom_boxplot(alpha=0.2, width=0.1) +
  scale_y_continuous("Nucleotide diversity (π)", limits = c(0, 0.035)) +
  xlab ("Genome-wide π calculated in 20k windows") +
  theme(axis.text.x = element_text(face="bold", size=8, angle=30),
        axis.title.x = element_text(face="bold", size =8),
        axis.title.y = element_text(face="bold", size =8),
        legend.position = "none") +
  geom_hline(yintercept=0.0025, color="#A42416") +
  geom_text(aes(0,0.0025,label = 0.0025, vjust =4))

#geom_boxplot(alpha=0.2,linewidth = 1) +
#geom_boxplot(alpha=0.2, width=0.1) +
#geom_dotplot(binaxis='y', stackdir='center', dotsize=0.01) +
  
  
pdffn = "AllSpecies_pi_240517.pdf"
pdf(pdffn, width=10, height=5)

ALL

dev.off()

