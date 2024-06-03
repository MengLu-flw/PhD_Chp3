setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/1_SNPs/2024_4_rawSNP_stats")
getwd()

library(ggplot2)
library(dplyr)
library(ggpubr)

#--get coordinates--#
Geum_urb <- read.delim("240404_Geum_urb_downS.ldepth.mean")
Geum_riv <- read.delim("240404_Geum_riv_downS.ldepth.mean")

Lina_rep <- read.delim("240404_Lina_rep_downS.ldepth.mean")
Lina_vul <- read.delim("240404_Lina_vul_downS.ldepth.mean")

Prim_ver <- read.delim("240404_Prim_ver_downS.ldepth.mean")
Prim_vul <- read.delim("240404_Prim_vul_downS.ldepth.mean")

Verb_nig <- read.delim("240404_Verb_nig_downS.ldepth.mean")
Verb_tha <- read.delim("240404_Verb_tha_downS.ldepth.mean")

Viol_hir <- read.delim("240404_Viol_hir_downS.ldepth.mean")
Viol_odo <- read.delim("240404_Viol_odo_downS.ldepth.mean")



##--find peaks of the density plots
Geum_urb_mainPeak <- max(density(Geum_urb$MEAN_DEPTH)$y[density(Geum_urb$MEAN_DEPTH)$x > 8])
#which(density(Geum_urb$MEAN_DEPTH)$y == Geum_urb_mainPeak)
Geum_urb_mainPeak_x <- density(Geum_urb$MEAN_DEPTH)$x[which(density(Geum_urb$MEAN_DEPTH)$y == Geum_urb_mainPeak)]

Geum_riv_mainPeak <- max(density(Geum_riv$MEAN_DEPTH)$y[density(Geum_riv$MEAN_DEPTH)$x > 8])
#which(density(Geum_riv$MEAN_DEPTH)$y == Geum_riv_mainPeak)
Geum_riv_mainPeak_x <- density(Geum_riv$MEAN_DEPTH)$x[which(density(Geum_riv$MEAN_DEPTH)$y == Geum_riv_mainPeak)]


Lina_rep_mainPeak <- max(density(Lina_rep$MEAN_DEPTH)$y[density(Lina_rep$MEAN_DEPTH)$x > 8])
#which(density(Lina_rep$MEAN_DEPTH)$y == Lina_rep_mainPeak)
Lina_rep_mainPeak_x <- density(Lina_rep$MEAN_DEPTH)$x[which(density(Lina_rep$MEAN_DEPTH)$y == Lina_rep_mainPeak)]

Lina_vul_mainPeak <- max(density(Lina_vul$MEAN_DEPTH)$y[density(Lina_vul$MEAN_DEPTH)$x > 8])
#which(density(Lina_vul$MEAN_DEPTH)$y == Lina_vul_mainPeak)
Lina_vul_mainPeak_x <- density(Lina_vul$MEAN_DEPTH)$x[which(density(Lina_vul$MEAN_DEPTH)$y == Lina_vul_mainPeak)]


Prim_ver_mainPeak <- max(density(Prim_ver$MEAN_DEPTH)$y[density(Prim_ver$MEAN_DEPTH)$x > 8])
#which(density(Prim_ver$MEAN_DEPTH)$y == Prim_ver_mainPeak)
Prim_ver_mainPeak_x <- density(Prim_ver$MEAN_DEPTH)$x[which(density(Prim_ver$MEAN_DEPTH)$y == Prim_ver_mainPeak)]

Prim_vul_mainPeak <- max(density(Prim_vul$MEAN_DEPTH)$y[density(Prim_vul$MEAN_DEPTH)$x > 8])
#which(density(Prim_vul$MEAN_DEPTH)$y == Prim_vul_mainPeak)
Prim_vul_mainPeak_x <- density(Prim_vul$MEAN_DEPTH)$x[which(density(Prim_vul$MEAN_DEPTH)$y == Prim_vul_mainPeak)]


Verb_nig_mainPeak <- max(density(Verb_nig$MEAN_DEPTH)$y[density(Verb_nig$MEAN_DEPTH)$x > 8])
#which(density(Verb_nig$MEAN_DEPTH)$y == Verb_nig_mainPeak)
Verb_nig_mainPeak_x <- density(Verb_nig$MEAN_DEPTH)$x[which(density(Verb_nig$MEAN_DEPTH)$y == Verb_nig_mainPeak)]

Verb_tha_mainPeak <- max(density(Verb_tha$MEAN_DEPTH)$y[density(Verb_tha$MEAN_DEPTH)$x > 8])
#which(density(Verb_tha$MEAN_DEPTH)$y == Verb_tha_mainPeak)
Verb_tha_mainPeak_x <- density(Verb_tha$MEAN_DEPTH)$x[which(density(Verb_tha$MEAN_DEPTH)$y == Verb_tha_mainPeak)]


Viol_hir_mainPeak <- max(density(Viol_hir$MEAN_DEPTH)$y[density(Viol_hir$MEAN_DEPTH)$x > 25])
#which(density(Viol_hir$MEAN_DEPTH)$y == Viol_hir_mainPeak)
Viol_hir_mainPeak_x <- density(Viol_hir$MEAN_DEPTH)$x[which(density(Viol_hir$MEAN_DEPTH)$y == Viol_hir_mainPeak)]

Viol_odo_mainPeak <- max(density(Viol_odo$MEAN_DEPTH)$y[density(Viol_odo$MEAN_DEPTH)$x > 8])
#which(density(Viol_odo$MEAN_DEPTH)$y == Viol_odo_mainPeak)
Viol_odo_mainPeak_x <- density(Viol_odo$MEAN_DEPTH)$x[which(density(Viol_odo$MEAN_DEPTH)$y == Viol_odo_mainPeak)]

##--density plots--###--final plots--##
Geum_urb_plot <- ggplot(Geum_urb, aes(MEAN_DEPTH)) +
  geom_density(fill = "#087234", colour = "#087234", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=16.31953,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Geum urbanum mean depth (across all samples) per site; DP peak = 16.32")

Geum_riv_plot <- ggplot(Geum_riv, aes(MEAN_DEPTH)) +
  geom_density(fill = "#7470AF", colour = "#7470AF", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=13.63302,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Geum rivale mean depth (across all samples) per site; DP peak = 13.63")


Lina_rep_plot <- ggplot(Lina_rep, aes(MEAN_DEPTH)) +
  geom_density(fill = "#9E6FA6", colour = "#9E6FA6", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=9.652804,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Linaria repens mean depth (across all samples) per site; DP peak = 9.65")

Lina_vul_plot <- ggplot(Lina_vul, aes(MEAN_DEPTH)) +
  geom_density(fill = "#B9974B", colour = "#B9974B", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=13.20132,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Linaria vulgaris mean depth (across all samples) per site; DP peak = 13.20")


Prim_ver_plot <- ggplot(Prim_ver, aes(MEAN_DEPTH)) +
  geom_density(fill = "#EB9762", colour = "#EB9762", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=14.90045,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Primula veris mean depth (across all samples) per site; DP peak = 14.90")

Prim_vul_plot <- ggplot(Prim_vul, aes(MEAN_DEPTH)) +
  geom_density(fill = "#DDB53D", colour = "#DDB53D", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=13.45933,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Primula vulgaris mean depth (across all samples) per site; DP peak = 13.46")


Verb_nig_plot <- ggplot(Verb_nig, aes(MEAN_DEPTH)) +
  geom_density(fill = "#7A1751", colour = "#7A1751", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=15.06307,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Verbascum nigrum mean depth (across all samples) per site; DP peak = 15.06")

Verb_tha_plot <- ggplot(Verb_tha, aes(MEAN_DEPTH)) +
  geom_density(fill = "#945200", colour = "#945200", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=15.00057,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Verbascum thapsus mean depth (across all samples) per site; DP peak = 15.00")


Viol_hir_plot <- ggplot(Viol_hir, aes(MEAN_DEPTH)) +
  geom_density(fill = "#433B95", colour = "#433B95", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=28.65173,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Viola hirta mean depth (across all samples) per site; DP peak = 28.65")

Viol_odo_plot <- ggplot(Viol_odo, aes(MEAN_DEPTH)) +
  geom_density(fill = "#7A93FF", colour = "#7A93FF", alpha = 0.3) +
  scale_x_continuous(limits = c(0, 100)) +
  geom_vline(xintercept=20.27288,color ="#4D4D4D",size = 0.5) +
  theme_light() +
  labs(title="Viola odorata mean depth (across all samples) per site; DP peak = 20.27")


#--plot in PDF--#

pdffn = "Depth_per_site.pdf"
pdf(pdffn, width=9, height=9)

q <- ggarrange(Geum_urb_plot,Geum_riv_plot,
               Lina_rep_plot,Lina_vul_plot,
               Prim_ver_plot,Prim_vul_plot,
               Verb_nig_plot,Verb_tha_plot,
               Viol_hir_plot,Viol_odo_plot,
               ncol = 1, nrow = 2)

q


dev.off()

