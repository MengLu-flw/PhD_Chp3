setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/3_genetic_diversity/Geum/Dxy")
getwd()

library(xlsx)
library(rlang)
library(ggplot2)
library(scales)
library(ggpubr)
library(ggrepel)

#read in data
Geum_CHR1 <- read.delim("GeumCHR01_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR1avg  <- mean(Geum_CHR1$avg_dxy,na.rm = TRUE)

Geum_CHR2 <- read.delim("GeumCHR02_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR2avg  <- mean(Geum_CHR2$avg_dxy,na.rm = TRUE)

Geum_CHR3 <- read.delim("GeumCHR03_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR3avg  <- mean(Geum_CHR3$avg_dxy,na.rm = TRUE)

Geum_CHR4 <- read.delim("GeumCHR04_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR4avg  <- mean(Geum_CHR4$avg_dxy,na.rm = TRUE)

Geum_CHR5 <- read.delim("GeumCHR05_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR5avg  <- mean(Geum_CHR5$avg_dxy,na.rm = TRUE)

Geum_CHR6 <- read.delim("GeumCHR06_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR6avg  <- mean(Geum_CHR6$avg_dxy,na.rm = TRUE)

Geum_CHR7 <- read.delim("GeumCHR07_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR7avg  <- mean(Geum_CHR7$avg_dxy,na.rm = TRUE)

Geum_CHR8 <- read.delim("GeumCHR08_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR8avg  <- mean(Geum_CHR8$avg_dxy,na.rm = TRUE)

Geum_CHR9 <- read.delim("GeumCHR09_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR9avg  <- mean(Geum_CHR9$avg_dxy,na.rm = TRUE)

Geum_CHR10 <- read.delim("GeumCHR10_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR10avg  <- mean(Geum_CHR10$avg_dxy,na.rm = TRUE)

Geum_CHR11 <- read.delim("GeumCHR11_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR11avg  <- mean(Geum_CHR11$avg_dxy,na.rm = TRUE)

Geum_CHR12 <- read.delim("GeumCHR12_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR12avg  <- mean(Geum_CHR12$avg_dxy,na.rm = TRUE)

Geum_CHR13 <- read.delim("GeumCHR13_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR13avg  <- mean(Geum_CHR13$avg_dxy,na.rm = TRUE)

Geum_CHR14 <- read.delim("GeumCHR14_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR14avg  <- mean(Geum_CHR14$avg_dxy,na.rm = TRUE)

Geum_CHR15 <- read.delim("GeumCHR15_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR15avg  <- mean(Geum_CHR15$avg_dxy,na.rm = TRUE)

Geum_CHR16 <- read.delim("GeumCHR16_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR16avg  <- mean(Geum_CHR16$avg_dxy,na.rm = TRUE)

Geum_CHR17 <- read.delim("GeumCHR17_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR17avg  <- mean(Geum_CHR17$avg_dxy,na.rm = TRUE)

Geum_CHR18 <- read.delim("GeumCHR18_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR18avg  <- mean(Geum_CHR18$avg_dxy,na.rm = TRUE)

Geum_CHR19 <- read.delim("GeumCHR19_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR19avg  <- mean(Geum_CHR19$avg_dxy,na.rm = TRUE)

Geum_CHR20 <- read.delim("GeumCHR20_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR20avg  <- mean(Geum_CHR20$avg_dxy,na.rm = TRUE)

Geum_CHR21 <- read.delim("GeumCHR21_dxy.txt", header = TRUE, sep = "\t")
Geum_CHR21avg  <- mean(Geum_CHR21$avg_dxy,na.rm = TRUE)


#plot
#col = c("Geum_rivale" = "#7470AF", "Geum_urbanum" = "#087234")

ch1 <- ggplot(data=Geum_CHR1, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 1") +
  scale_x_continuous("Position on Chromosome 1 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR1avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR1avg,label = round(Geum_CHR1avg,4), hjust =-0.5, vjust = -5, size = 14))

ch2 <- ggplot(data=Geum_CHR2, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 2") +
  scale_x_continuous("Position on Chromosome 2 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR2avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR2avg,label = round(Geum_CHR2avg,4), hjust =-0.5, vjust = -5, size = 14))

ch3 <- ggplot(data=Geum_CHR3, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 3") +
  scale_x_continuous("Position on Chromosome 3 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR3avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR3avg,label = round(Geum_CHR3avg,4), hjust =-0.5, vjust = -5, size = 14))

ch4 <- ggplot(data=Geum_CHR4, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 4") +
  scale_x_continuous("Position on Chromosome 4 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR4avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR4avg,label = round(Geum_CHR4avg,4), hjust =-0.5, vjust = -5, size = 14))

ch5 <- ggplot(data=Geum_CHR5, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 5") +
  scale_x_continuous("Position on Chromosome 5 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR5avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR5avg,label = round(Geum_CHR5avg,4), hjust =-0.5, vjust = -5, size = 14))

ch6 <- ggplot(data=Geum_CHR6, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 6") +
  scale_x_continuous("Position on Chromosome 6 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR6avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR6avg,label = round(Geum_CHR6avg,4), hjust =-0.5, vjust = -5, size = 14))

ch7 <- ggplot(data=Geum_CHR7, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 7") +
  scale_x_continuous("Position on Chromosome 7 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR7avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR7avg,label = round(Geum_CHR7avg,4), hjust =-0.5, vjust = -5, size = 14))

ch8 <- ggplot(data=Geum_CHR8, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 8") +
  scale_x_continuous("Position on Chromosome 8 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR8avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR8avg,label = round(Geum_CHR8avg,4), hjust =-0.5, vjust = -5, size = 14))

ch9 <- ggplot(data=Geum_CHR9, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 9") +
  scale_x_continuous("Position on Chromosome 9 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR9avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR9avg,label = round(Geum_CHR9avg,4), hjust =-0.5, vjust = -5, size = 14))

ch10 <- ggplot(data=Geum_CHR10, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 10") +
  scale_x_continuous("Position on Chromosome 10 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR10avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR10avg,label = round(Geum_CHR10avg,4), hjust =-0.5, vjust = -5, size = 14))

ch11 <- ggplot(data=Geum_CHR11, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 11") +
  scale_x_continuous("Position on Chromosome 11 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR11avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR11avg,label = round(Geum_CHR11avg,4), hjust =-0.5, vjust = -5, size = 14))

ch12 <- ggplot(data=Geum_CHR12, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 12") +
  scale_x_continuous("Position on Chromosome 12 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR12avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR12avg,label = round(Geum_CHR12avg,4), hjust =-0.5, vjust = -5, size = 14))

ch13 <- ggplot(data=Geum_CHR13, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 13") +
  scale_x_continuous("Position on Chromosome 13 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR13avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR13avg,label = round(Geum_CHR13avg,4), hjust =-0.5, vjust = -5, size = 14))

ch14 <- ggplot(data=Geum_CHR14, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 14") +
  scale_x_continuous("Position on Chromosome 14 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR14avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR14avg,label = round(Geum_CHR14avg,4), hjust =-0.5, vjust = -5, size = 14))

ch15 <- ggplot(data=Geum_CHR15, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 15") +
  scale_x_continuous("Position on Chromosome 15 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR15avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR15avg,label = round(Geum_CHR15avg,4), hjust =-0.5, vjust = -5, size = 14))

ch16 <- ggplot(data=Geum_CHR16, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 16") +
  scale_x_continuous("Position on Chromosome 16 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR16avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR16avg,label = round(Geum_CHR16avg,4), hjust =-0.5, vjust = -5, size = 14))

ch17 <- ggplot(data=Geum_CHR17, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 17") +
  scale_x_continuous("Position on Chromosome 17 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR17avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR17avg,label = round(Geum_CHR17avg,4), hjust =-0.5, vjust = -5, size = 14))

ch18 <- ggplot(data=Geum_CHR18, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 18") +
  scale_x_continuous("Position on Chromosome 18 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR18avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR18avg,label = round(Geum_CHR18avg,4), hjust =-0.5, vjust = -5, size = 14))

ch19 <- ggplot(data=Geum_CHR19, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 19") +
  scale_x_continuous("Position on Chromosome 19 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR19avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR19avg,label = round(Geum_CHR19avg,4), hjust =-0.5, vjust = -5, size = 14))

ch20 <- ggplot(data=Geum_CHR20, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 20") +
  scale_x_continuous("Position on Chromosome 20 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +   geom_hline(yintercept = Geum_CHR20avg, color="#FF7E79") +   geom_text(aes(0,Geum_CHR20avg,label = round(Geum_CHR20avg,4), hjust =-0.5, vjust = -5, size = 14))

ch21 <- ggplot(data=Geum_CHR21, aes(x=window_pos_1, y=avg_dxy)) +
  geom_line(color="#767A7A") +
#  scale_colour_manual(values = col) +
  #  labs(title="Geum nucleotide diversity (Dxy) CHR 21") +
  scale_x_continuous("Position on Chromosome 21 (Mb)", labels = unit_format(unit = "M", scale = 1e-6)) +
  scale_y_continuous("Averaged Dxy in 20 kb windows", limits = c(0, 0.25)) +
  theme(axis.text.x = element_text(face="bold", size=12),
        axis.text.y = element_text(face="bold", size=12),
        plot.title = element_text(face="bold", size =16),
        axis.title.x = element_text(size =14),
        axis.title.y = element_text(size =14), legend.position = "none") +
  geom_hline(yintercept = Geum_CHR21avg, color="#FF7E79") +
  geom_text(aes(0,Geum_CHR21avg,label = round(Geum_CHR21avg,4), hjust =-0.5, vjust = -5, size = 14))


pdffn = "Geum_dxy.pdf"
pdf(pdffn, width=15, height=10)

G <- ggarrange(ch1, ch2, ch3, ch4, ch5, ch6, ch7,
               ch8, ch9, ch10, ch11, ch12, ch13, ch14,
               ch15, ch16, ch17, ch18, ch19, ch20, ch21, ncol=2, nrow=3)
G

dev.off()

