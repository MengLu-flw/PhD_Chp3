#check the directory
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/8_PSMC_SMC/PSMC/1_trial")
getwd()

# setting up
library(scales)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(ggpubr)

## read in data
G_urbanum <- read.delim("G_urbanum_ML033_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
G_urbanum <- mutate(G_urbanum, Sample = 'G_urbanum_ML033')
G_rivale <- read.delim("G_rivale_ML027_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
G_rivale <- mutate(G_rivale, Sample = 'G_rivale_ML027')


L_repens <- read.delim("L_repens_ML085_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
L_repens <- mutate(L_repens, Sample = 'L_repens_ML085')
L_vulgaris <- read.delim("L_vulgaris_ML139_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
L_vulgaris <- mutate(L_vulgaris, Sample = 'L_vulgaris_ML139')


P_veris <- read.delim("P_veris_ML005_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
P_veris <- mutate(P_veris, Sample = 'P_veris_ML005')
P_vulgaris <- read.delim("P_vulgaris_ML001_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
P_vulgaris <- mutate(P_vulgaris, Sample = 'P_vulgaris_ML001')


V_nigrum <- read.delim("V_nigrum_ML092_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
V_nigrum <- mutate(V_nigrum, Sample = 'V_nigrum_ML092')
V_thapsus <- read.delim("V_thapsus_ML061_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
V_thapsus <- mutate(V_thapsus, Sample = 'V_thapsus_ML061')


V_hirta <- read.delim("V_hirta_ML153_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
V_hirta <- mutate(V_hirta, Sample = 'V_hirta_ML153')
V_odorata <- read.delim("V_odorata_ML003_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
V_odorata <- mutate(V_odorata, Sample = 'V_odorata_ML003')


All_para <- rbind(G_rivale,G_urbanum,L_repens,L_vulgaris,P_veris,P_vulgaris,
                  V_nigrum,V_thapsus,V_hirta,V_odorata)


## ------------------------------####
## --- Exploring -r parameter ---####
## ------------------------------##
## plot trials with -t15 -r1, but different -p
t15r1_groups <- c("t15r1p25","t15r1p28","t15r1p30")
t15r1_G <- subset(All_para, V6 %in% t15r1_groups)

t15r1 <- ggplot(t15r1_G, aes(x=V1,y=V2, group=Sample)) +
  geom_step(aes(color=Sample)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All samples with -t15 -r1 and various -p") +
  ylim(0,165)

t15r1


## plot trials with -t15 -r3, but different -p
t15r3_groups <- c("t15r3p25","t15r3p28","t15r3p30")
t15r3_G <- subset(All_para, V6 %in% t15r3_groups)

t15r3 <- ggplot(t15r3_G, aes(x=V1,y=V2, group=Sample)) +
  geom_step(aes(color=Sample)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All samples with -t15 -r3 and various -p") +
  ylim(0,165)

t15r3


## plot trials with -t15 -r5, but different -p
t15r5_groups <- c("t15r5p25","t15r5p28","t15r5p30")
t15r5_G <- subset(All_para, V6 %in% t15r5_groups)

t15r5 <- ggplot(t15r5_G, aes(x=V1,y=V2, group=Sample)) +
  geom_step(aes(color=Sample)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All samples with -t15 -r5 and various -p") +
  ylim(0,165)

t15r5

## Output plots
pdf(file = "AllSample_t15_configs.pdf", width = 10, height = 15)
t15_allS <- ggarrange(t15r1,t15r3,t15r5, ncol = 1, nrow = 3)
t15_allS
dev.off()



## ------------------------------####
## --- Exploring -p parameter ---####
## --- With an interest of LGM --##
## ------------------------------##

## plot trials with -t15 -r5 -p25
t15r5p25_groups <- c("t15r5p25")
t15r5p25_G <- subset(All_para, V6 %in% t15r5p25_groups)

t15r5p25 <- ggplot(t15r5p25_G, aes(x=V1,y=V2, group=Sample)) +
  geom_step(aes(color=Sample)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All samples with -t15 -r5 and -p '4+25*2+4+6'") +
  ylim(0,160)

t15r5p25_R <- t15r5p25 + xlim(0,25000) + ylim(0,5)


## plot trials with -t15 -r5 -p28
t15r5p28_groups <- c("t15r5p28")
t15r5p28_G <- subset(All_para, V6 %in% t15r5p28_groups)

t15r5p28 <- ggplot(t15r5p28_G, aes(x=V1,y=V2, group=Sample)) +
  geom_step(aes(color=Sample)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All samples with -t15 -r5 and -p28 '28*2+3+5'") +
  ylim(0,160)

t15r5p28_R <- t15r5p28 + xlim(0,25000) + ylim(0,5)

## plot trials with -t15 -r5 -p30
t15r5p30_groups <- c("t15r5p30")
t15r5p30_G <- subset(All_para, V6 %in% t15r5p30_groups)

t15r5p30 <- ggplot(t15r5p30_G, aes(x=V1,y=V2, group=Sample)) +
  geom_step(aes(color=Sample)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All samples with -t15 -r5 and -p '4+30*2+4+6+10'") +
  ylim(0,160)

t15r5p30_R <- t15r5p30+ xlim(0,25000) + ylim(0,5)

#t15r5p30

## Output plots
pdf(file = "AllSample_t15r5_configs.pdf", width = 20, height = 15)
t15r5_allS <- ggarrange(t15r5p25_R,t15r5p25,
                        t15r5p28_R,t15r5p28,
                        t15r5p30_R,t15r5p30, ncol = 2, nrow = 3)
t15r5_allS
dev.off()



## --- --------------------------####
## --- Exploring -t parameter ---####
## ------------------------------##
## ---------G_urbanum---------------------
G_urbanum_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
G_urbanum_t5_G <- subset(G_urbanum, V6 %in% G_urbanum_t5_Groups)

G_urbanum_t5 <- ggplot(G_urbanum_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_urbanum with -t5 & various -r and -p")
G_urbanum_t5

G_urbanum_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
G_urbanum_t15_G <- subset(G_urbanum, V6 %in% G_urbanum_t15_Groups)

G_urbanum_t15 <- ggplot(G_urbanum_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_urbanum with -t15 & various -r and -p")
G_urbanum_t15

## ---------G_rivale---------------------
G_rivale_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
G_rivale_t5_G <- subset(G_rivale, V6 %in% G_rivale_t5_Groups)

G_rivale_t5 <- ggplot(G_rivale_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_rivale with -t5 & various -r and -p")
G_rivale_t5

G_rivale_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
G_rivale_t15_G <- subset(G_rivale, V6 %in% G_rivale_t15_Groups)

G_rivale_t15 <- ggplot(G_rivale_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_rivale with -t15 & various -r and -p")
G_rivale_t15

## ---------L_repens---------------------
L_repens_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
L_repens_t5_G <- subset(L_repens, V6 %in% L_repens_t5_Groups)

L_repens_t5 <- ggplot(L_repens_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_repens with -t5 & various -r and -p")
L_repens_t5

L_repens_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
L_repens_t15_G <- subset(L_repens, V6 %in% L_repens_t15_Groups)

L_repens_t15 <- ggplot(L_repens_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_repens with -t15 & various -r and -p")
L_repens_t15
## ---------L_vulgaris---------------------
L_vulgaris_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
L_vulgaris_t5_G <- subset(L_vulgaris, V6 %in% L_vulgaris_t5_Groups)

L_vulgaris_t5 <- ggplot(L_vulgaris_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_vulgaris with -t5 & various -r and -p")
L_vulgaris_t5

L_vulgaris_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
L_vulgaris_t15_G <- subset(L_vulgaris, V6 %in% L_vulgaris_t15_Groups)

L_vulgaris_t15 <- ggplot(L_vulgaris_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_vulgaris with -t15 & various -r and -p")
L_vulgaris_t15

## ---------P_vulgaris---------------------
P_vulgaris_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
P_vulgaris_t5_G <- subset(P_vulgaris, V6 %in% P_vulgaris_t5_Groups)

P_vulgaris_t5 <- ggplot(P_vulgaris_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_vulgaris with -t5 & various -r and -p") +
  ylim(0, 25)
P_vulgaris_t5

P_vulgaris_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
P_vulgaris_t15_G <- subset(P_vulgaris, V6 %in% P_vulgaris_t15_Groups)

P_vulgaris_t15 <- ggplot(P_vulgaris_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_vulgaris with -t15 & various -r and -p") +
  ylim(0, 60)
P_vulgaris_t15

## ---------P_veris---------------------
P_veris_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
P_veris_t5_G <- subset(P_veris, V6 %in% P_veris_t5_Groups)

P_veris_t5 <- ggplot(P_veris_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_veris with -t5 & various -r and -p") +
  ylim(0, 25)
P_veris_t5


P_veris_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
P_veris_t15_G <- subset(P_veris, V6 %in% P_veris_t15_Groups)

P_veris_t15 <- ggplot(P_veris_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_veris with -t15 & various -r and -p") +
  ylim(0, 60)
P_veris_t15

## ---------V_nigrum---------------------
V_nigrum_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
V_nigrum_t5_G <- subset(V_nigrum, V6 %in% V_nigrum_t5_Groups)

V_nigrum_t5 <- ggplot(V_nigrum_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_nigrum with -t5 & various -r and -p")
V_nigrum_t5

V_nigrum_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
V_nigrum_t15_G <- subset(V_nigrum, V6 %in% V_nigrum_t15_Groups)

V_nigrum_t15 <- ggplot(V_nigrum_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_nigrum with -t15 & various -r and -p")
V_nigrum_t15

## ---------V_thapsus---------------------
V_thapsus_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
V_thapsus_t5_G <- subset(V_thapsus, V6 %in% V_thapsus_t5_Groups)

V_thapsus_t5 <- ggplot(V_thapsus_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_thapsus with -t5 & various -r and -p")
V_thapsus_t5

V_thapsus_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
V_thapsus_t15_G <- subset(V_thapsus, V6 %in% V_thapsus_t15_Groups)

V_thapsus_t15 <- ggplot(V_thapsus_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_thapsus with -t15 & various -r and -p")
V_thapsus_t15
## ---------V_hirta---------------------
V_hirta_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
V_hirta_t5_G <- subset(V_hirta, V6 %in% V_hirta_t5_Groups)

V_hirta_t5 <- ggplot(V_hirta_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_hirta with -t5 & various -r and -p")
V_hirta_t5

V_hirta_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
V_hirta_t15_G <- subset(V_hirta, V6 %in% V_hirta_t15_Groups)

V_hirta_t15 <- ggplot(V_hirta_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_hirta with -t15 & various -r and -p")
V_hirta_t15
## ---------V_odorata---------------------
V_odorata_t5_Groups <- c("t5r1p25","t5r1p28","t5r1p30","t5r3p25","t5r3p28","t5r3p30","t5r5p25","t5r5p28","t5r5p30")
V_odorata_t5_G <- subset(V_odorata, V6 %in% V_odorata_t5_Groups)

V_odorata_t5 <- ggplot(V_odorata_t5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_odorata with -t5 & various -r and -p")
V_odorata_t5

V_odorata_t15_Groups <- c("t15r1p25","t15r1p28","t15r1p30","t15r3p25","t15r3p28","t15r3p30","t15r5p25","t15r5p28","t15r5p30")
V_odorata_t15_G <- subset(V_odorata, V6 %in% V_odorata_t15_Groups)

V_odorata_t15 <- ggplot(V_odorata_t15_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_odorata with -t15 & various -r and -p")
V_odorata_t15

## ---------
## Output plots
pdf(file = "t_configs_perSample.pdf", width = 20, height = 12)
p <- ggarrange(G_urbanum_t5,G_urbanum_t15,
               G_rivale_t5,G_rivale_t15,
               L_repens_t5,L_repens_t15,
               L_vulgaris_t5,L_vulgaris_t15,
               P_veris_t5,P_veris_t15,
               P_vulgaris_t5,P_vulgaris_t15,
               V_nigrum_t5,V_nigrum_t15,
               V_thapsus_t5,V_thapsus_t15,
               V_hirta_t5,V_hirta_t15,
               V_odorata_t5,V_odorata_t15, ncol = 2, nrow = 2)
p

dev.off()

## ------------------------------####
## --- Exploring -r parameter ---####
## ------------------------------##
## ---------G_rivale---------------------
G_rivale_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                        "t10r1p25","t10r1p28","t10r1p30",
                        "t15r1p25","t15r1p28","t15r1p30",
                        "t20r1p25","t20r1p28","t20r1p30")
G_rivale_r1_G <- subset(G_rivale, V6 %in% G_rivale_r1_Groups)

G_rivale_r1 <- ggplot(G_rivale_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_rivale with -r1 & various -t and -p")
G_rivale_r1

G_rivale_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                        "t10r3p25","t10r3p28","t10r3p30",
                        "t15r3p25","t15r3p28","t15r3p30",
                        "t20r3p25","t20r3p28","t20r3p30")
G_rivale_r3_G <- subset(G_rivale, V6 %in% G_rivale_r3_Groups)

G_rivale_r3 <- ggplot(G_rivale_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_rivale with -r3 & various -t and -p")
G_rivale_r3


G_rivale_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                        "t10r5p25","t10r5p28","t10r5p30",
                        "t15r5p25","t15r5p28","t15r5p30",
                        "t20r5p25","t20r5p28","t20r5p30")
G_rivale_r5_G <- subset(G_rivale, V6 %in% G_rivale_r5_Groups)

G_rivale_r5 <- ggplot(G_rivale_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_rivale with -r5 & various -t and -p")
G_rivale_r5

## ---------G_urbanum---------------------
G_urbanum_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                          "t10r1p25","t10r1p28","t10r1p30",
                          "t15r1p25","t15r1p28","t15r1p30",
                          "t20r1p25","t20r1p28","t20r1p30")
G_urbanum_r1_G <- subset(G_urbanum, V6 %in% G_urbanum_r1_Groups)

G_urbanum_r1 <- ggplot(G_urbanum_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_urbanum with -r1 & various -t and -p")
G_urbanum_r1

G_urbanum_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                          "t10r3p25","t10r3p28","t10r3p30",
                          "t15r3p25","t15r3p28","t15r3p30",
                          "t20r3p25","t20r3p28","t20r3p30")
G_urbanum_r3_G <- subset(G_urbanum, V6 %in% G_urbanum_r3_Groups)

G_urbanum_r3 <- ggplot(G_urbanum_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_urbanum with -r3 & various -t and -p")
G_urbanum_r3


G_urbanum_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                          "t10r5p25","t10r5p28","t10r5p30",
                          "t15r5p25","t15r5p28","t15r5p30",
                          "t20r5p25","t20r5p28","t20r5p30")
G_urbanum_r5_G <- subset(G_urbanum, V6 %in% G_urbanum_r5_Groups)

G_urbanum_r5 <- ggplot(G_urbanum_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("G_urbanum with -r5 & various -t and -p")
G_urbanum_r5

## ---------L_repens---------------------
L_repens_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                        "t10r1p25","t10r1p28","t10r1p30",
                        "t15r1p25","t15r1p28","t15r1p30",
                        "t20r1p25","t20r1p28","t20r1p30")
L_repens_r1_G <- subset(L_repens, V6 %in% L_repens_r1_Groups)

L_repens_r1 <- ggplot(L_repens_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_repens with -r1 & various -t and -p")
L_repens_r1

L_repens_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                        "t10r3p25","t10r3p28","t10r3p30",
                        "t15r3p25","t15r3p28","t15r3p30",
                        "t20r3p25","t20r3p28","t20r3p30")
L_repens_r3_G <- subset(L_repens, V6 %in% L_repens_r3_Groups)

L_repens_r3 <- ggplot(L_repens_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_repens with -r3 & various -t and -p")
L_repens_r3


L_repens_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                        "t10r5p25","t10r5p28","t10r5p30",
                        "t15r5p25","t15r5p28","t15r5p30",
                        "t20r5p25","t20r5p28","t20r5p30")
L_repens_r5_G <- subset(L_repens, V6 %in% L_repens_r5_Groups)

L_repens_r5 <- ggplot(L_repens_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_repens with -r5 & various -t and -p")
L_repens_r5

## ---------L_vulgaris---------------------
L_vulgaris_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                        "t10r1p25","t10r1p28","t10r1p30",
                        "t15r1p25","t15r1p28","t15r1p30",
                        "t20r1p25","t20r1p28","t20r1p30")
L_vulgaris_r1_G <- subset(L_vulgaris, V6 %in% L_vulgaris_r1_Groups)

L_vulgaris_r1 <- ggplot(L_vulgaris_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_vulgaris with -r1 & various -t and -p")
L_vulgaris_r1

L_vulgaris_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                        "t10r3p25","t10r3p28","t10r3p30",
                        "t15r3p25","t15r3p28","t15r3p30",
                        "t20r3p25","t20r3p28","t20r3p30")
L_vulgaris_r3_G <- subset(L_vulgaris, V6 %in% L_vulgaris_r3_Groups)

L_vulgaris_r3 <- ggplot(L_vulgaris_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_vulgaris with -r3 & various -t and -p")
L_vulgaris_r3


L_vulgaris_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                        "t10r5p25","t10r5p28","t10r5p30",
                        "t15r5p25","t15r5p28","t15r5p30",
                        "t20r5p25","t20r5p28","t20r5p30")
L_vulgaris_r5_G <- subset(L_vulgaris, V6 %in% L_vulgaris_r5_Groups)

L_vulgaris_r5 <- ggplot(L_vulgaris_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("L_vulgaris with -r5 & various -t and -p")
L_vulgaris_r5


## ---------P_veris---------------------
P_veris_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                        "t10r1p25","t10r1p28","t10r1p30",
                        "t15r1p25","t15r1p28","t15r1p30",
                        "t20r1p25","t20r1p28","t20r1p30")
P_veris_r1_G <- subset(P_veris, V6 %in% P_veris_r1_Groups)

P_veris_r1 <- ggplot(P_veris_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_veris with -r1 & various -t and -p") +
  ylim(0,30)
P_veris_r1

P_veris_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                        "t10r3p25","t10r3p28","t10r3p30",
                        "t15r3p25","t15r3p28","t15r3p30",
                        "t20r3p25","t20r3p28","t20r3p30")
P_veris_r3_G <- subset(P_veris, V6 %in% P_veris_r3_Groups)

P_veris_r3 <- ggplot(P_veris_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_veris with -r3 & various -t and -p") +
  ylim(0,30)
P_veris_r3


P_veris_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                        "t10r5p25","t10r5p28","t10r5p30",
                        "t15r5p25","t15r5p28","t15r5p30",
                        "t20r5p25","t20r5p28","t20r5p30")
P_veris_r5_G <- subset(P_veris, V6 %in% P_veris_r5_Groups)

P_veris_r5 <- ggplot(P_veris_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_veris with -r5 & various -t and -p") +
  ylim(0,30)
P_veris_r5

## ---------P_vulgaris---------------------
P_vulgaris_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                         "t10r1p25","t10r1p28","t10r1p30",
                         "t15r1p25","t15r1p28","t15r1p30",
                         "t20r1p25","t20r1p28","t20r1p30")
P_vulgaris_r1_G <- subset(P_vulgaris, V6 %in% P_vulgaris_r1_Groups)

P_vulgaris_r1 <- ggplot(P_vulgaris_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_vulgaris with -r1 & various -t and -p") +
  ylim(0,50)
P_vulgaris_r1

P_vulgaris_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                         "t10r3p25","t10r3p28","t10r3p30",
                         "t15r3p25","t15r3p28","t15r3p30",
                         "t20r3p25","t20r3p28","t20r3p30")
P_vulgaris_r3_G <- subset(P_vulgaris, V6 %in% P_vulgaris_r3_Groups)

P_vulgaris_r3 <- ggplot(P_vulgaris_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_vulgaris with -r3 & various -t and -p") +
  ylim(0,50)
P_vulgaris_r3


P_vulgaris_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                         "t10r5p25","t10r5p28","t10r5p30",
                         "t15r5p25","t15r5p28","t15r5p30",
                         "t20r5p25","t20r5p28","t20r5p30")
P_vulgaris_r5_G <- subset(P_vulgaris, V6 %in% P_vulgaris_r5_Groups)

P_vulgaris_r5 <- ggplot(P_vulgaris_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("P_vulgaris with -r5 & various -t and -p") +
  ylim(0,50)
P_vulgaris_r5


## ---------V_nigrum---------------------
V_nigrum_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                        "t10r1p25","t10r1p28","t10r1p30",
                        "t15r1p25","t15r1p28","t15r1p30",
                        "t20r1p25","t20r1p28","t20r1p30")
V_nigrum_r1_G <- subset(V_nigrum, V6 %in% V_nigrum_r1_Groups)

V_nigrum_r1 <- ggplot(V_nigrum_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_nigrum with -r1 & various -t and -p")
V_nigrum_r1

V_nigrum_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                        "t10r3p25","t10r3p28","t10r3p30",
                        "t15r3p25","t15r3p28","t15r3p30",
                        "t20r3p25","t20r3p28","t20r3p30")
V_nigrum_r3_G <- subset(V_nigrum, V6 %in% V_nigrum_r3_Groups)

V_nigrum_r3 <- ggplot(V_nigrum_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_nigrum with -r3 & various -t and -p")
V_nigrum_r3


V_nigrum_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                        "t10r5p25","t10r5p28","t10r5p30",
                        "t15r5p25","t15r5p28","t15r5p30",
                        "t20r5p25","t20r5p28","t20r5p30")
V_nigrum_r5_G <- subset(V_nigrum, V6 %in% V_nigrum_r5_Groups)

V_nigrum_r5 <- ggplot(V_nigrum_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_nigrum with -r5 & various -t and -p")
V_nigrum_r5

## ---------V_thapsus---------------------
V_thapsus_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                         "t10r1p25","t10r1p28","t10r1p30",
                         "t15r1p25","t15r1p28","t15r1p30",
                         "t20r1p25","t20r1p28","t20r1p30")
V_thapsus_r1_G <- subset(V_thapsus, V6 %in% V_thapsus_r1_Groups)

V_thapsus_r1 <- ggplot(V_thapsus_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_thapsus with -r1 & various -t and -p")
V_thapsus_r1

V_thapsus_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                         "t10r3p25","t10r3p28","t10r3p30",
                         "t15r3p25","t15r3p28","t15r3p30",
                         "t20r3p25","t20r3p28","t20r3p30")
V_thapsus_r3_G <- subset(V_thapsus, V6 %in% V_thapsus_r3_Groups)

V_thapsus_r3 <- ggplot(V_thapsus_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_thapsus with -r3 & various -t and -p")
V_thapsus_r3


V_thapsus_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                         "t10r5p25","t10r5p28","t10r5p30",
                         "t15r5p25","t15r5p28","t15r5p30",
                         "t20r5p25","t20r5p28","t20r5p30")
V_thapsus_r5_G <- subset(V_thapsus, V6 %in% V_thapsus_r5_Groups)

V_thapsus_r5 <- ggplot(V_thapsus_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_thapsus with -r5 & various -t and -p")
V_thapsus_r5



## ---------V_hirta---------------------
V_hirta_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                        "t10r1p25","t10r1p28","t10r1p30",
                        "t15r1p25","t15r1p28","t15r1p30",
                        "t20r1p25","t20r1p28","t20r1p30")
V_hirta_r1_G <- subset(V_hirta, V6 %in% V_hirta_r1_Groups)

V_hirta_r1 <- ggplot(V_hirta_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_hirta with -r1 & various -t and -p")
V_hirta_r1

V_hirta_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                        "t10r3p25","t10r3p28","t10r3p30",
                        "t15r3p25","t15r3p28","t15r3p30",
                        "t20r3p25","t20r3p28","t20r3p30")
V_hirta_r3_G <- subset(V_hirta, V6 %in% V_hirta_r3_Groups)

V_hirta_r3 <- ggplot(V_hirta_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_hirta with -r3 & various -t and -p")
V_hirta_r3


V_hirta_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                        "t10r5p25","t10r5p28","t10r5p30",
                        "t15r5p25","t15r5p28","t15r5p30",
                        "t20r5p25","t20r5p28","t20r5p30")
V_hirta_r5_G <- subset(V_hirta, V6 %in% V_hirta_r5_Groups)

V_hirta_r5 <- ggplot(V_hirta_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_hirta with -r5 & various -t and -p")
V_hirta_r5

## ---------V_odorata---------------------
V_odorata_r1_Groups <- c("t5r1p25","t5r1p28","t5r1p30",
                         "t10r1p25","t10r1p28","t10r1p30",
                         "t15r1p25","t15r1p28","t15r1p30",
                         "t20r1p25","t20r1p28","t20r1p30")
V_odorata_r1_G <- subset(V_odorata, V6 %in% V_odorata_r1_Groups)

V_odorata_r1 <- ggplot(V_odorata_r1_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_odorata with -r1 & various -t and -p")
V_odorata_r1

V_odorata_r3_Groups <- c("t5r3p25","t5r3p28","t5r3p30",
                         "t10r3p25","t10r3p28","t10r3p30",
                         "t15r3p25","t15r3p28","t15r3p30",
                         "t20r3p25","t20r3p28","t20r3p30")
V_odorata_r3_G <- subset(V_odorata, V6 %in% V_odorata_r3_Groups)

V_odorata_r3 <- ggplot(V_odorata_r3_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_odorata with -r3 & various -t and -p") +
  ylim(0,10)
V_odorata_r3


V_odorata_r5_Groups <- c("t5r5p25","t5r5p28","t5r5p30",
                         "t10r5p25","t10r5p28","t10r5p30",
                         "t15r5p25","t15r5p28","t15r5p30",
                         "t20r5p25","t20r5p28","t20r5p30")
V_odorata_r5_G <- subset(V_odorata, V6 %in% V_odorata_r5_Groups)

V_odorata_r5 <- ggplot(V_odorata_r5_G, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("V_odorata with -r5 & various -t and -p") +
  ylim(0,10)
V_odorata_r5





## ---------
## Output plots
pdf(file = "r_configs_perSample.pdf", width = 20, height = 18)
p <- ggarrange(G_rivale_r1,G_urbanum_r1,
               G_rivale_r3,G_urbanum_r3,
               G_rivale_r5,G_urbanum_r5,
               L_repens_r1,L_vulgaris_r1,
               L_repens_r3,L_vulgaris_r3,
               L_repens_r5, L_vulgaris_r5,
               P_veris_r1,P_vulgaris_r1,
               P_veris_r3,P_vulgaris_r3,
               P_veris_r5, P_vulgaris_r5,
               V_nigrum_r1,V_thapsus_r1,
               V_nigrum_r3,V_thapsus_r3,
               V_nigrum_r5,V_thapsus_r5,
               V_hirta_r1,V_odorata_r1,
               V_hirta_r3,V_odorata_r3,
               V_hirta_r5,V_odorata_r5,ncol = 2, nrow = 3)

p

dev.off()
