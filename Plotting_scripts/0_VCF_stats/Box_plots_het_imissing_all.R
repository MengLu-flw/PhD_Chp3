setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/1_SNPs/2024_4_rawSNP_stats")
getwd()

library(openxlsx)
library(ggplot2)
library(dplyr)

#--get coordinates--#
het <- read.xlsx("240404vcftools_het.xlsx")

ind_depth <- read.xlsx("240404vcftools_perIndividual_depth.xlsx")

ind_missing <- read.xlsx("240404vcftools_perIndividual_missing.xlsx")


#--define a outlier finding function--#
findoutlier <- function(x) {
  return(x < quantile(x, .25) - 1.5*IQR(x) | x > quantile(x, .75) + 1.5*IQR(x))
}

#--add outlier labels--#
het <- het %>%
  group_by(Species) %>%
  mutate(outlier = ifelse(findoutlier(F), outlier_label, NA))

ind_depth <- ind_depth %>%
  group_by(Species) %>%
  mutate(outlier = ifelse(findoutlier(MEAN_DEPTH), outlier_label, NA))

ind_missing <- ind_missing %>%
  group_by(Species) %>%
  mutate(outlier = ifelse(findoutlier(P_MISS), outlier_label, NA))

#--box plot--#
#--set your own colour--#
col = c("Geum rivale" = "#7470AF", "Geum urbanum" = "#087234",
        "Geum cf. rivale" = "#7470AF", "Geum cf. urbanum" = "#087234",
        "Linaria vulgaris" = "#B9974B", "Linaria repens" = "#9E6FA6",
        "Primula vulgaris" = "#DDB53D", "Primula veris" = "#EB9762",
        "Verbascum thapsus" = "#945200", "Verbascum nigrum" = "#7A1751",
        "Viola odorata" = "#7A93FF", "Viola hirta" = "#433B95")

het_plot <- ggplot(het, aes(x=Species, y=F, color=Species, fill=Species)) +
  geom_boxplot(alpha=0.2,linewidth = 1) +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.2) +
  scale_color_manual(values=col) +
  scale_fill_manual(values=col) +
  theme(axis.text.x = element_text(face="bold", size=8, angle=30),
        axis.title.x = element_text(face="bold", size =8),
        axis.title.y = element_text(face="bold", size =8),
        legend.position = "none") +
  geom_text(aes(label=outlier), size = 3, fontface = "bold", na.rm=TRUE, hjust=0.8, vjust=2) +
  geom_hline(yintercept=0,color ="#4D4D4D",size = 1)

depth_plot <- ggplot(ind_depth, aes(x=Species, y=MEAN_DEPTH, color=Species, fill=Species)) +
  geom_boxplot(alpha=0.2,linewidth = 1) +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.2) +
  scale_color_manual(values=col) +
  scale_fill_manual(values=col) +
  theme(axis.text.x = element_text(face="bold", size=8, angle=30),
        axis.title.x = element_text(face="bold", size =8),
        axis.title.y = element_text(face="bold", size =8),
        legend.position = "none") +
  geom_text(aes(label=outlier), size = 3, fontface = "bold", na.rm=TRUE, hjust=0.5, vjust=1.4) +
  geom_hline(yintercept=8,color ="#C00000",size = 1) +
  geom_text(aes(x=1, label="DP=8", y=8.3), colour="#C00000", size=4) +
  geom_hline(yintercept=6,color ="#E65B51",size = 1) +
  geom_text(aes(x=1, label="DP=6", y=6.3), colour="#E65B51", size=4)


missing_plot <- ggplot(ind_missing, aes(x=Species, y=P_MISS, color=Species, fill=Species)) +
  geom_boxplot(alpha=0.2,linewidth = 1) +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.2) +
  scale_color_manual(values=col) +
  scale_fill_manual(values=col) +
  theme(axis.text.x = element_text(face="bold", size=8, angle=30),
        axis.title.x = element_text(face="bold", size =8),
        axis.title.y = element_text(face="bold", size =8),
        legend.position = "none") +
  geom_text(aes(label=outlier), size = 3, fontface = "bold", na.rm=TRUE, hjust=0.5, vjust=1.4)

#view plot
het_plot
depth_plot
missing_plot

#--plot in PDF--#

pdffn = "Inbreeding_coeff.pdf"
pdf(pdffn, width=7, height=9)

het_plot

dev.off()

pdffn = "Depth_per_individual.pdf"
pdf(pdffn, width=7, height=9)

depth_plot

dev.off()
pdffn = "Missingness_per_individual.pdf"
pdf(pdffn, width=7, height=9)

missing_plot

dev.off()
