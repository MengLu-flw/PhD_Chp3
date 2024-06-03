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
G_rivale <- read.delim("G_rivale_ML027_ALLpar.single.plot.txt", header=FALSE, sep = "\t")

L_repens <- read.delim("L_repens_ML085_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
L_vulgaris <- read.delim("L_vulgaris_ML139_ALLpar.single.plot.txt", header=FALSE, sep = "\t")

P_veris <- read.delim("P_veris_ML005_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
P_vulgaris <- read.delim("P_vulgaris_ML001_ALLpar.single.plot.txt", header=FALSE, sep = "\t")

V_nigrum <- read.delim("V_nigrum_ML092_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
V_thapsus <- read.delim("V_thapsus_ML061_ALLpar.single.plot.txt", header=FALSE, sep = "\t")

V_hirta <- read.delim("V_hirta_ML153_ALLpar.single.plot.txt", header=FALSE, sep = "\t")
V_odorata <- read.delim("V_odorata_ML003_ALLpar.single.plot.txt", header=FALSE, sep = "\t")


## plot all trials
G_urbanum_all <- ggplot(G_urbanum, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of G_urbanum_ML033")

G_rivale_all <- ggplot(G_rivale, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of G_rivale_ML027")



L_repens_all <- ggplot(L_repens, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of L_repens_ML085")


L_vulgaris_all <- ggplot(L_vulgaris, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of L_vulgaris_ML139")




P_veris_all <- ggplot(P_veris, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of P_veris_ML005") +
  ylim(0, 60)




P_vulgaris_all <- ggplot(P_vulgaris, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of P_vulgaris_ML001") +
  ylim(0, 60)




V_nigrum_all <- ggplot(V_nigrum, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of V_nigrum_ML092")




V_thapsus_all <- ggplot(V_thapsus, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of V_thapsus_ML061")




V_hirta_all <- ggplot(V_hirta, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of V_hirta_ML153")


V_odorata_all <- ggplot(V_odorata, aes(x=V1,y=V2, group=V6)) +
  geom_step(aes(color=V6)) +
  labs(x=expression("Generations (µ=7x"*10^-9*")"),
       y = expression("Effective population size ( x"~10^4*")")) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  ggtitle("All trails of V_odorata_ML003")


##-- output plot
pdf(file = "All_parameter_configs.pdf", width = 10, height = 15)
p <- ggarrange(G_rivale_all, G_urbanum_all,
               L_repens_all,L_vulgaris_all,
               P_veris_all,P_vulgaris_all,
               V_nigrum_all,V_thapsus_all,
               V_hirta_all, V_odorata_all, ncol = 1, nrow = 2)
p

dev.off()





