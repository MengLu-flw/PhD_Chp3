setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/4_Fis/240405_perSpecies")
getwd()

library(openxlsx)
library(ggplot2)
library(dplyr)

#--get coordinates--#
data <- read.xlsx("All_Fis_het.xlsx")
data <- data %>% mutate_at(c('O(HOM)', 'E(HOM)','N(NM)','F'), as.numeric)

#--plot--#
#--set your own colour--#
col = c("Geum rivale" = "#7470AF", "Geum urbanum" = "#087234", 
        "Linaria vulgaris" = "#B9974B", "Linaria repens" = "#9E6FA6", 
        "Primula vulgaris" = "#DDB53D", "Primula veris" = "#EB9762", 
        "Verbascum thapsus" = "#945200", "Verbascum nigrum" = "#7A1751",
        "Viola odorata" = "#7A93FF", "Viola hirta" = "#433B95")

#--define outliers--#
findoutlier <- function(x) {
  return(x < quantile(x, .25) - 1.5*IQR(x) | x > quantile(x, .75) + 1.5*IQR(x))
}

data <- data %>%
  group_by(FID) %>%
  mutate(outlier = ifelse(findoutlier(F), ID_F, NA))


#--box plot--#
p <- ggplot(data, aes(x=FID, y=F, color=FID, fill=FID)) +
  geom_boxplot(alpha=0.2,linewidth = 1) +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.2) +
  scale_color_manual(values=col) +
  scale_fill_manual(values=col) +
  theme(axis.text.x = element_text(face="bold", size=10, angle=30),
        axis.title.x = element_text(face="bold", size =12),
        axis.text.y = element_text(face="bold", size =10),
        axis.title.y = element_text(face="bold", size =12),
        legend.position = "none") +
  geom_hline(yintercept=0,color ="#4D4D4D",size = 1) +
  geom_text(aes(label=outlier), size = 3, fontface = "bold", na.rm=TRUE, hjust=0.5, vjust=1.4)

#view plot
p

#--plot in PDF--#

pdffn = "Fis_PLINK_filtered.pdf"
pdf(pdffn, width=7, height=9)

p

dev.off()
