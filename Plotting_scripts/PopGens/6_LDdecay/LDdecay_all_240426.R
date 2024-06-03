#check the directory
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/7_LD_decay")
getwd()


# setting up
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggpubr)

# read in data
Geum_urb_D <- read.table("Geum_urb.out.bin",header=TRUE)
Geum_urb_D$Taxon <- "Geum urbanum"
Geum_riv_D <- read.table("Geum_riv.out.bin",header=TRUE)
Geum_riv_D$Taxon <- "Geum rivale"

Lina_rep_D <- read.table("Lina_rep.out.bin",header=TRUE)
Lina_rep_D$Taxon <- "Linaria repens"
Lina_vul_D <- read.table("Lina_vul.out.bin",header=TRUE)
Lina_vul_D$Taxon <- "Linaria vulgaris"

Prim_ver_D <- read.table("Prim_ver.out.bin",header=TRUE)
Prim_ver_D$Taxon <- "Primula veris"
Prim_vul_D <- read.table("Prim_vul.out.bin",header=TRUE)
Prim_vul_D$Taxon <- "Primula vulgaris"

Verb_tha_D <- read.table("Verb_tha.out.bin",header=TRUE)
Verb_tha_D$Taxon <- "Verbascum thapsus"
Verb_nig_D <- read.table("Verb_nig.out.bin",header=TRUE)
Verb_nig_D$Taxon <- "Verbascum nigrum"

Viol_hir_D <- read.table("Viol_hir.out.bin",header=TRUE)
Viol_hir_D$Taxon <- "Viola hirta"
Viol_odo_D <- read.table("Viol_odo.out.bin",header=TRUE)
Viol_odo_D$Taxon <- "Viola odorata"

Alldata <- rbind(Geum_urb_D,Geum_riv_D,Lina_rep_D,Lina_vul_D,
                 Prim_ver_D,Prim_vul_D,Verb_tha_D,Verb_nig_D,
                 Viol_hir_D,Viol_odo_D)

Geum_D <- rbind(Geum_urb_D,Geum_riv_D)

Lina_D <- rbind(Lina_rep_D,Lina_vul_D)

Prim_D <- rbind(Prim_ver_D,Prim_vul_D)

Verb_D <- rbind(Verb_tha_D,Verb_nig_D)

Viol_D <- rbind(Viol_hir_D,Viol_odo_D)

# plot results in 1Kb windows, showing the first 300Kb distance
col <- c("Geum rivale" = "#7470AF", "Geum urbanum" = "#087234",
         "Linaria vulgaris" = "#B9974B", "Linaria repens" = "#B46BA2",
         "Primula vulgaris" = "#FFC000" , "Primula veris" = "#ED7D31",
         "Verbascum thapsus" = "#6B4215", "Verbascum nigrum" = "#7A1751",
         "Viola odorata" = "#7A93FF", "Viola hirta" = "#433B95")
  
p <- ggplot(Alldata, aes(x =Dist/1000,y =Mean_r.2,group=Taxon,color=Taxon)) +
  geom_line() +
  labs(title = "All species LD decay",x = "Distance(Kb)",y = expression(r^2)) +
  theme(axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  theme_minimal(base_size = 12) +
  xlim(0, 300) +
  scale_color_manual(values=col)

#p

# print plots to a PDF
pdffn = "LDdecay_all_240426.pdf"
pdf(pdffn, width=9, height=6)

p

dev.off()


Geum <- ggplot(Geum_D, aes(x =Dist/1000,y =Mean_r.2,group=Taxon,color=Taxon)) +
  geom_line() +
  labs(title = "Geum LD decay",x = "Distance(Kb)",y = expression(r^2)) +
  theme(axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  theme_minimal(base_size = 12) +
  xlim(0, 300) +
  scale_color_manual(values=col)

Lina <- ggplot(Lina_D, aes(x =Dist/1000,y =Mean_r.2,group=Taxon,color=Taxon)) +
  geom_line() +
  labs(title = "Linaria LD decay",x = "Distance(Kb)",y = expression(r^2)) +
  theme(axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  theme_minimal(base_size = 12) +
  xlim(0, 300) +
  scale_color_manual(values=col)

Prim <- ggplot(Prim_D, aes(x =Dist/1000,y =Mean_r.2,group=Taxon,color=Taxon)) +
  geom_line() +
  labs(title = "Primula LD decay",x = "Distance(Kb)",y = expression(r^2)) +
  theme(axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  theme_minimal(base_size = 12) +
  xlim(0, 300) +
  scale_color_manual(values=col)

Verb <- ggplot(Verb_D, aes(x =Dist/1000,y =Mean_r.2,group=Taxon,color=Taxon)) +
  geom_line() +
  labs(title = "Verbascum LD decay",x = "Distance(Kb)",y = expression(r^2)) +
  theme(axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  theme_minimal(base_size = 12) +
  xlim(0, 300) +
  scale_color_manual(values=col)

Viol <- ggplot(Viol_D, aes(x =Dist/1000,y =Mean_r.2,group=Taxon,color=Taxon)) +
  geom_line() +
  labs(title = "Viola LD decay",x = "Distance(Kb)",y = expression(r^2)) +
  theme(axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  theme_minimal(base_size = 12) +
  xlim(0, 300) +
  scale_color_manual(values=col)

pdffn = "LDdecay_perGenus_240426.pdf"
pdf(pdffn, width=18, height=12)

Q <- ggarrange(Geum, Lina, Prim, Verb, Viol, ncol=2, nrow=2)
Q

dev.off()


