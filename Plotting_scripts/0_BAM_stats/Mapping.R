setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/1_SNPs/2024_0_dedupBAM_stats/0429_Prim_DToL")
getwd()

library(xlsx)
library(ggplot2)
library(ggpubr)

#read in data
dat <- read.xlsx("BWA_mapping.xlsx", "Sheet3", header=TRUE)
dat <- dat[complete.cases(dat), ]

head(dat)


#-1- Species~Primary_map_rate
p1 <-ggplot(dat, aes(x=Species, y=Primary_map_rate, fill=Species, label=Sample.ID)) +
  geom_violin(trim=FALSE) +
  geom_hline(yintercept=0.9,color = "#A42416") +
  labs(title="Primary mapping rate") +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.8) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none") +
  scale_y_continuous(limits = c(85, 100)) +
  geom_text_repel()
#p1

#-2- Species~Properly_paired_rate
p2 <-ggplot(dat, aes(x=Species, y=Properly_paired_rate, fill=Species, label=Sample.ID)) +
  geom_violin(trim=FALSE) +
  geom_hline(yintercept=0.8, color="#A42416") +
  labs(title="Properly paired rate") +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.8) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none") +
  scale_y_continuous(limits = c(70, 100)) +
  geom_text_repel()
#p2

#-2- Species~Singleton_rate
p3 <-ggplot(dat, aes(x=Species, y=Singleton_rate, fill=Species, label=Sample.ID)) +
  geom_violin(trim=FALSE) +
  geom_hline(yintercept=0.0025, color="#A42416") +
  labs(title="Singleton rate") +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.8) +
  theme(axis.text.x = element_text(face="bold", size=12, angle=30),
        axis.text.y = element_text(face="bold", size=12, color="#A42416"),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(face="bold", size =14),
        axis.title.y = element_text(face="bold", size =14),
        legend.position = "none") +
  geom_text_repel()
#p3



#Violin plot - BWA mapping rate
pdf(file = "BWA_mapping_Prim0429.pdf", width = 7, height = 15)
p <- ggarrange(p1,p2,p3, ncol = 1, nrow = 3)
p

dev.off()

