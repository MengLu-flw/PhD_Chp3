setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/0_geoMetadata")
getwd()

#####Mapping#####
library(openxlsx)
library(ggplot2)
library(ggrepel)
library(maps)
library(readxl)

#--check the UK map--#
worldmap = map_data('world')

uk <- ggplot() + geom_polygon(data = worldmap, 
               aes(x = long, y = lat, group = group), 
               fill="lightgrey", color="darkgrey") + 
  coord_fixed(ratio = 1.5, 
              xlim = c(-7,2), ylim = c(49.5, 59)) +
  theme_void()


#--get coordinates--#
pop <- read.xlsx("Linaria.xlsx")


#--plot points--#
#--set your own colour--#
col = c("Linaria vulgaris" = "#B9974B", "Linaria repens" = "#9E6FA6")

pop_map <- uk +
  geom_point(data = pop, aes(x = as.numeric(longitude), y = as.numeric(latitude), colour=Taxon), size = 5,
             alpha = 1) +
  scale_colour_manual(values = col) +
  geom_text_repel(data = pop, aes(x = as.numeric(longitude), y = as.numeric(latitude), label=Extraction_ID), max.overlaps = Inf)

noLABs_map <- uk +
  geom_point(data = pop, aes(x = as.numeric(longitude), y = as.numeric(latitude), colour=Taxon), size = 5,
             alpha = 1) +
  scale_colour_manual(values = col) 

#--view map & plot in PDF--#
pop_map

pdffn = "Linaria_sampling_map.pdf"
pdf(pdffn, width=5, height=7)

pop_map

dev.off()


pdffn = "Linaria_sampling_map_noLABs.pdf"
pdf(pdffn, width=5, height=7)

noLABs_map

dev.off()
