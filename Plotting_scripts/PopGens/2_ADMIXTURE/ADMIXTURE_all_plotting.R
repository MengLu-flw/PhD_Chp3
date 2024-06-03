#check the directory
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/2_clustering/admixture/240426_perSpecies/data")
getwd()

# setting up
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggpubr)


#### Geum_riv_05 ####
Geum_riv_05_samplelist <- read_tsv("Geum_riv_05.list",col_names = c("sample"))

Geum_riv_05_Q <- tibble(sample=character(),
                   k=numeric(),
                   Q=character(),
                   value=numeric())
for (k in 2:5){
  data <- read_delim(paste0("Geum_riv_05.",k,".Q"),
                     col_names = paste0("Q",seq(2:k)),
                     delim=" ")
  data$sample <- Geum_riv_05_samplelist$sample
  data$k <- k
  data %>% gather(Q, value, -sample,-k) -> data
  Geum_riv_05_Q <- rbind(Geum_riv_05_Q,data)
}

#Geum_riv_05_Q


# To reorder the bar, add levels to the sample variable
Geum_riv_05_Q_levels <- c("G_rivale_ML027","G_rivale_ML053",
                          "G_rivale_ML177","G_rivale_ML275",
                          "G_rivale_ML049","G_rivale_ML124",
                          "G_rivale_ML028","G_rivale_ML125",
                          "G_rivale_ML150","G_rivale_ML144",
                          "G_rivale_ML149","G_rivale_ML056",
                          "G_rivale_ML057","G_rivale_ML070",
                          "G_rivale_ML073","G_rivale_ML143",
                          "G_rivale_ML277")
Geum_riv_05_Q$sample <- factor(Geum_riv_05_Q$sample, levels = Geum_riv_05_Q_levels)

Geum_riv_05 <- ggplot(Geum_riv_05_Q,aes(x=sample,y=value,fill=factor(Q))) + 
  geom_bar(stat="identity",position="stack") +
  xlab("Sample") + ylab("Genetic clustering") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
  theme(legend.position = "none", text=element_text(size=22)) +
  facet_wrap(~k,ncol=1)

Geum_riv_05

#### Geum_riv_10 ####
Geum_riv_10_samplelist <- read_tsv("Geum_riv_10.list",col_names = c("sample"))

Geum_riv_10_Q <- tibble(sample=character(),
                        k=numeric(),
                        Q=character(),
                        value=numeric())
for (k in 2:5){
  data <- read_delim(paste0("Geum_riv_10.",k,".Q"),
                     col_names = paste0("Q",seq(2:k)),
                     delim=" ")
  data$sample <- Geum_riv_10_samplelist$sample
  data$k <- k
  data %>% gather(Q, value, -sample,-k) -> data
  Geum_riv_10_Q <- rbind(Geum_riv_10_Q,data)
}

# To reorder the bar, add levels to the sample variable
Geum_riv_10_Q_levels <- c("G_rivale_ML027","G_rivale_ML053",
                          "G_rivale_ML177","G_rivale_ML275",
                          "G_rivale_ML049","G_rivale_ML124",
                          "G_rivale_ML028","G_rivale_ML125",
                          "G_rivale_ML150","G_rivale_ML144",
                          "G_rivale_ML149","G_rivale_ML056",
                          "G_rivale_ML057","G_rivale_ML070",
                          "G_rivale_ML073","G_rivale_ML143",
                          "G_rivale_ML277")
Geum_riv_10_Q$sample <- factor(Geum_riv_10_Q$sample, levels = Geum_riv_10_Q_levels)


Geum_riv_10 <- ggplot(Geum_riv_10_Q,aes(x=sample,y=value,fill=factor(Q))) + 
  geom_bar(stat="identity",position="stack") +
  xlab("Sample") + ylab("Genetic clustering") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
  theme(legend.position = "none", text=element_text(size=22)) +
  facet_wrap(~k,ncol=1)

Geum_riv_10


##### Plot all tested K
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/2_clustering/admixture/240426_perSpecies")
getwd()

pdffn = "ADMIXTURE_perSpecies_all_240429.pdf"
pdf(pdffn, width=9, height=5)

Q <- ggarrange(Geum_riv_05,
               Geum_riv_10,
               Geum_urb_05,
               Geum_urb_10,
               Lina_rep_05,
               Lina_rep_10,
               Lina_vul_05,
               Lina_vul_10,
               Prim_ver_05,
               Prim_ver_10,
               Prim_vul_05,
               Prim_vul_10,
               Verb_nig_05,
               Verb_nig_10,
               Verb_tha_05,
               Verb_tha_10,
               Viol_hir_05,
               Viol_hir_10,
               Viol_odo_05,
               Viol_odo_10, ncol=1, nrow=1)
Q

dev.off()
