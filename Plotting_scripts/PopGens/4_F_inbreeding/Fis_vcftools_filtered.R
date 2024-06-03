setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/4_Fis/240405_perSpecies")
getwd()

library(openxlsx)
library(ggplot2)
library(dplyr)

#--get coordinates--#
het <- read.xlsx("240409vcftools_het.xlsx")



#--define a outlier finding function--#
findoutlier <- function(x) {
  return(x < quantile(x, .25) - 1.5*IQR(x) | x > quantile(x, .75) + 1.5*IQR(x))
}

#--add outlier labels--#
het <- het %>%
  group_by(Species) %>%
  mutate(outlier = ifelse(findoutlier(F), outlier_label, NA))

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
  geom_text(aes(label=outlier), size = 3, fontface = "bold", na.rm=TRUE, hjust=0.5, vjust=2) +
  geom_hline(yintercept=0,color ="#4D4D4D",size = 1)

#view plot
het_plot


#--plot in PDF--#

pdffn = "Fis_vcftools_filtered.pdf"
pdf(pdffn, width=7, height=9)

het_plot

dev.off()
