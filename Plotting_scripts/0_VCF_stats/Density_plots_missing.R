setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/1_SNPs/2024_4_rawSNP_stats")
getwd()

library(ggplot2)
library(dplyr)
library(ggpubr)

#--get coordinates--#
Geum_urb <- read.delim("240404_Geum_urb_downS.lmiss")
Geum_riv <- read.delim("240404_Geum_riv_downS.lmiss")

Lina_rep <- read.delim("240404_Lina_rep_downS.lmiss")
Lina_vul <- read.delim("240404_Lina_vul_downS.lmiss")

Prim_ver <- read.delim("240404_Prim_ver_downS.lmiss")
Prim_vul <- read.delim("240404_Prim_vul_downS.lmiss")

Verb_nig <- read.delim("240404_Verb_nig_downS.lmiss")
Verb_tha <- read.delim("240404_Verb_tha_downS.lmiss")

Viol_hir <- read.delim("240404_Viol_hir_downS.lmiss")
Viol_odo <- read.delim("240404_Viol_odo_downS.lmiss")



##--find peaks of the density plots

##--density plots--###--final plots--##
Geum_urb_plot <- ggplot(Geum_urb, aes(F_MISS)) +
  geom_density(fill = "#087234", colour = "#087234", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Geum urbanum fraction of missing genotype per site; 0: no missing data")

Geum_riv_plot <- ggplot(Geum_riv, aes(F_MISS)) +
  geom_density(fill = "#7470AF", colour = "#7470AF", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Geum rivale fraction of missing genotype per site; 0: no missing data")


Lina_rep_plot <- ggplot(Lina_rep, aes(F_MISS)) +
  geom_density(fill = "#9E6FA6", colour = "#9E6FA6", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Linaria repens fraction of missing genotype per site; 0: no missing data")

Lina_vul_plot <- ggplot(Lina_vul, aes(F_MISS)) +
  geom_density(fill = "#B9974B", colour = "#B9974B", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Linaria vulgaris fraction of missing genotype per site; 0: no missing data")


Prim_ver_plot <- ggplot(Prim_ver, aes(F_MISS)) +
  geom_density(fill = "#EB9762", colour = "#EB9762", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Primula veris fraction of missing genotype per site; 0: no missing data")

Prim_vul_plot <- ggplot(Prim_vul, aes(F_MISS)) +
  geom_density(fill = "#DDB53D", colour = "#DDB53D", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Primula vulgaris fraction of missing genotype per site; 0: no missing data")


Verb_nig_plot <- ggplot(Verb_nig, aes(F_MISS)) +
  geom_density(fill = "#7A1751", colour = "#7A1751", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Verbascum nigrum fraction of missing genotype per site; 0: no missing data")

Verb_tha_plot <- ggplot(Verb_tha, aes(F_MISS)) +
  geom_density(fill = "#945200", colour = "#945200", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Verbascum thapsus fraction of missing genotype per site; 0: no missing data")


Viol_hir_plot <- ggplot(Viol_hir, aes(F_MISS)) +
  geom_density(fill = "#433B95", colour = "#433B95", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Viola hirta fraction of missing genotype per site; 0: no missing data")

Viol_odo_plot <- ggplot(Viol_odo, aes(F_MISS)) +
  geom_density(fill = "#7A93FF", colour = "#7A93FF", alpha = 0.3) +
  geom_vline(xintercept=0.1,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Viola odorata fraction of missing genotype per site; 0: no missing data")


#--plot in PDF--#

pdffn = "Missingness_per_site.pdf"
pdf(pdffn, width=, height=9)

q <- ggarrange(Geum_urb_plot,Geum_riv_plot,
               Lina_rep_plot,Lina_vul_plot,
               Prim_ver_plot,Prim_vul_plot,
               Verb_nig_plot,Verb_tha_plot,
               Viol_odo_plot,Viol_odo_plot,
               ncol = 1, nrow = 2)

q


dev.off()

