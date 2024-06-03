setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Geum/Fst")
getwd()

library(xlsx)
library(rlang)
library(ggplot2)
library(scales)
library(ggpubr)
library(ggrepel)

#read in data
Geum_CHR1 <- read.delim("GeumCHR01_fst.txt", header = TRUE, sep = "\t")
Geum_CHR2 <- read.delim("GeumCHR02_fst.txt", header = TRUE, sep = "\t")
Geum_CHR3 <- read.delim("GeumCHR03_fst.txt", header = TRUE, sep = "\t")
Geum_CHR4 <- read.delim("GeumCHR04_fst.txt", header = TRUE, sep = "\t")
Geum_CHR5 <- read.delim("GeumCHR05_fst.txt", header = TRUE, sep = "\t")
Geum_CHR6 <- read.delim("GeumCHR06_fst.txt", header = TRUE, sep = "\t")
Geum_CHR7 <- read.delim("GeumCHR07_fst.txt", header = TRUE, sep = "\t")
Geum_CHR8 <- read.delim("GeumCHR08_fst.txt", header = TRUE, sep = "\t")
Geum_CHR9 <- read.delim("GeumCHR09_fst.txt", header = TRUE, sep = "\t")
Geum_CHR10 <- read.delim("GeumCHR10_fst.txt", header = TRUE, sep = "\t")
Geum_CHR11 <- read.delim("GeumCHR11_fst.txt", header = TRUE, sep = "\t")
Geum_CHR12 <- read.delim("GeumCHR12_fst.txt", header = TRUE, sep = "\t")
Geum_CHR13 <- read.delim("GeumCHR13_fst.txt", header = TRUE, sep = "\t")
Geum_CHR14 <- read.delim("GeumCHR14_fst.txt", header = TRUE, sep = "\t")
Geum_CHR15 <- read.delim("GeumCHR15_fst.txt", header = TRUE, sep = "\t")
Geum_CHR16 <- read.delim("GeumCHR16_fst.txt", header = TRUE, sep = "\t")
Geum_CHR17 <- read.delim("GeumCHR17_fst.txt", header = TRUE, sep = "\t")
Geum_CHR18 <- read.delim("GeumCHR18_fst.txt", header = TRUE, sep = "\t")
Geum_CHR19 <- read.delim("GeumCHR19_fst.txt", header = TRUE, sep = "\t")
Geum_CHR20 <- read.delim("GeumCHR20_fst.txt", header = TRUE, sep = "\t")
Geum_CHR21 <- read.delim("GeumCHR21_fst.txt", header = TRUE, sep = "\t")

#plot
#col = c("Geum_rivale" = "#7470AF", "Geum_urbanum" = "#087234")

ch1 <- ggplot(data=Geum_CHR1, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 1") +
  scale_x_continuous("Position on Chromosome 1 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch2 <- ggplot(data=Geum_CHR2, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 2") +
  scale_x_continuous("Position on Chromosome 2 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch3 <- ggplot(data=Geum_CHR3, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 3") +
  scale_x_continuous("Position on Chromosome 3 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch4 <- ggplot(data=Geum_CHR4, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 4") +
  scale_x_continuous("Position on Chromosome 4 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none",)

ch5 <- ggplot(data=Geum_CHR5, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 5") +
  scale_x_continuous("Position on Chromosome 5 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch6 <- ggplot(data=Geum_CHR6, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 6") +
  scale_x_continuous("Position on Chromosome 6 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch7 <- ggplot(data=Geum_CHR7, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 7") +
  scale_x_continuous("Position on Chromosome 7 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch8 <- ggplot(data=Geum_CHR8, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 8") +
  scale_x_continuous("Position on Chromosome 8 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch9 <- ggplot(data=Geum_CHR9, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 9") +
  scale_x_continuous("Position on Chromosome 9 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch10 <- ggplot(data=Geum_CHR10, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 10") +
  scale_x_continuous("Position on Chromosome 10 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none",)

ch11 <- ggplot(data=Geum_CHR11, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 11") +
  scale_x_continuous("Position on Chromosome 11 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch12 <- ggplot(data=Geum_CHR12, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 12") +
  scale_x_continuous("Position on Chromosome 12 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch13 <- ggplot(data=Geum_CHR13, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 13") +
  scale_x_continuous("Position on Chromosome 13 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch14 <- ggplot(data=Geum_CHR14, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 14") +
  scale_x_continuous("Position on Chromosome 14 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch15 <- ggplot(data=Geum_CHR15, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 15") +
  scale_x_continuous("Position on Chromosome 15 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch16 <- ggplot(data=Geum_CHR16, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 16") +
  scale_x_continuous("Position on Chromosome 16 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none",)

ch17 <- ggplot(data=Geum_CHR17, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 17") +
  scale_x_continuous("Position on Chromosome 17 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch18 <- ggplot(data=Geum_CHR18, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 18") +
  scale_x_continuous("Position on Chromosome 18 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch19 <- ggplot(data=Geum_CHR19, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 19") +
  scale_x_continuous("Position on Chromosome 19 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none")

ch20 <- ggplot(data=Geum_CHR20, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 20") +
  scale_x_continuous("Position on Chromosome 20 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none",)

ch21 <- ggplot(data=Geum_CHR21, aes(x=window_pos_1, y=avg_wc_fst)) +
  geom_line() +
  #  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Fst) CHR 21") +
  scale_x_continuous("Position on Chromosome 21 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Fst in 20 kb windows") +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none",)


pdffn = "Geum_fst.pdf"
pdf(pdffn, width=15, height=10)

G <- ggarrange(ch1, ch2, ch3, ch4, ch5, ch6, ch7,
               ch8, ch9, ch10, ch11, ch12, ch13, ch14,
               ch15, ch16, ch17, ch18, ch19, ch20, ch21, ncol=2, nrow=3)
G

dev.off()

