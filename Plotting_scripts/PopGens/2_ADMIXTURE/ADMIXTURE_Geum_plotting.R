#check the directory
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/2_clustering/admixture/240117_Geum")
getwd()

# setting up
library(tidyverse)
library(ggplot2)
library(ggrepel)

# read in data
samplelist <- read_tsv("Geum_samplelist.txt",col_names = c("sample", "pop"))
cv <- read_delim("Geum.cv.error",col_names = c("k", "cv"))

# read all Q file
all_data <- tibble(sample=character(),
                   k=numeric(),
                   Q=character(),
                   value=numeric())
for (k in 2:5){
  data <- read_delim(paste0("Geum.",k,".Q"),
                     col_names = paste0("Q",seq(2:k)),
                     delim=" ")
  data$sample <- samplelist$sample
  data$k <- k
  data %>% gather(Q, value, -sample,-k) -> data
  all_data <- rbind(all_data,data)
}
# check read in file
all_data

##### plot - type 1
pdffn = "Geum_ADMIXTURE.pdf"
pdf(pdffn, width=15, height=15)

all_data %>%
  ggplot(.,aes(x=sample,y=value,fill=factor(Q))) + 
  geom_bar(stat="identity",position="stack") +
  xlab("Sample") + ylab("Genetic clustering") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
  theme(legend.position = "none", text=element_text(size=22)) +
  facet_wrap(~k,ncol=1)

dev.off()


##### plot cv error
pdffn = "Geum_cv_error.pdf"
pdf(pdffn, width=5, height=3)

plotCV <- ggplot(cv, aes(x=k, y=cv)) + geom_point()
plotCV

dev.off()
