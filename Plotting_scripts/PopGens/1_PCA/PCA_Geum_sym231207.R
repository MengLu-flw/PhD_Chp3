#check the directory
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/1_PCA/240117_Geum_symALL")
getwd()


# setting up
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggpubr)

# read in data
pca05 <- read_table("Geum_ALLsym_05.eigenvec", col_names = FALSE)
eigenval05 <- scan("Geum_ALLsym_05.eigenval")

pca10 <- read_table("Geum_ALLsym_10.eigenvec", col_names = FALSE)
eigenval10 <- scan("Geum_ALLsym_10.eigenval")


# sort out the pca data
# remove nuisance column
pca05 <- pca05[,-2]

pca10 <- pca10[,-2]


# set names
names(pca05)[1] <- "ind"
names(pca05)[2:ncol(pca05)] <- paste0("PC", 1:(ncol(pca05)-1))

names(pca10)[1] <- "ind"
names(pca10)[2:ncol(pca10)] <- paste0("PC", 1:(ncol(pca10)-1))

#seperate original names into ID
pca05 <- separate(data=pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
pca05$ID <- paste0("ML", pca05$ID)

pca10 <- separate(data=pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
pca10$ID <- paste0("ML", pca10$ID)


# sort out the individual class and pops
# class
class05 <- rep(NA, length(pca05$class))
class05[grep("rivale_cf", pca05$class)] <- "Geum cf. rivale"
class05[grep("urbanum_cf", pca05$class)] <- "Geum cf. urbanum"
class05[grep("rivale_BC", pca05$class)] <- "Backcross to Geum rivale"
class05[grep("urbanum_BC", pca05$class)] <- "Backcross to Geum urbanum"
class05[grep("F2", pca05$class)] <- "Geum F2 hybrids"


class10 <- rep(NA, length(pca10$class))
class10[grep("rivale_cf", pca05$class)] <- "Geum cf. rivale"
class10[grep("urbanum_cf", pca05$class)] <- "Geum cf. urbanum"
class10[grep("rivale_BC", pca05$class)] <- "Backcross to Geum rivale"
class10[grep("urbanum_BC", pca05$class)] <- "Backcross to Geum urbanum"
class10[grep("F2", pca05$class)] <- "Geum F2 hybrids"


# remake data.frame
pca05 <- as_tibble(data.frame(pca05, class05))

pca10 <- as_tibble(data.frame(pca10, class10))


# Plotting
# first convert to percentage variance explained
pve05 <- data.frame(PC = 1:20, pve05 = eigenval05/sum(eigenval05)*100)

pve10 <- data.frame(PC = 1:20, pve10 = eigenval10/sum(eigenval10)*100)


# make plots
a1 <- ggplot(pve05, aes(PC, pve05)) + geom_bar(stat = "identity") +
  ylab("Percentage variance explained") + theme_light()

a2 <- ggplot(pve10, aes(PC, pve10)) + geom_bar(stat = "identity") +
  ylab("Percentage variance explained") + theme_light()


# print plots to a PDF
pdffn = "Geum_ALLsym_SNP_PLINK_eigenvalues.pdf"
pdf(pdffn, width=10, height=10)

P <- ggarrange(a1, a2, ncol=1, nrow=2)
P

dev.off()

# calculate the cumulative sum of the percentage variance explained
cumsum(pve05$pve05)

cumsum(pve10$pve10)



# plot PCA
b <- ggplot(pca05, aes(PC1, PC2, col = class05, label = ID)) + geom_point(size = 2)
b <- b + scale_colour_manual(values = c("#7470AF", "#00C876","#B72FB8","#314A15","#00B8FF"))
b <- b + theme_light() + xlim(-0.5,0.4) + ylim(-1, 1)
b <- b + xlab(paste0("PC1 (", signif(pve05$pve05[1], 3), "%)")) + ylab(paste0("PC2 (", signif(pve05$pve05[2], 3), "%)")) +
         labs(title = "PLINK: A window size of 50 Kb, a step size of 5 SNPs; r^2 greater than 0.2 will be pruned")
b <- b + geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =14),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
#b


c <- ggplot(pca10, aes(PC1, PC2, col = class10, label = ID)) + geom_point(size = 2)
c <- c + scale_colour_manual(values = c("#7470AF", "#00C876","#B72FB8","#314A15","#00B8FF"))
c <- c + theme_light() + xlim(-0.5,0.4) + ylim(-1, 1)
c <- c + xlab(paste0("PC1 (", signif(pve10$pve10[1], 3), "%)")) + ylab(paste0("PC2 (", signif(pve10$pve10[2], 3), "%)")) +
  labs(title = "PLINK: A window size of 50 Kb, a step size of 10 SNPs; r^2 greater than 0.1 will be pruned")
c <- c + geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =14),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
#c


# print plots to a PDF
pdffn = "Geum_ALLsym_SNP_PLNIK.pdf"
pdf(pdffn, width=12, height=12)

Q <- ggarrange(b, c, ncol=1, nrow=2)
Q

dev.off()

