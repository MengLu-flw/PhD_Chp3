#check the directory
setwd("/Users/menglu/Library/CloudStorage/OneDrive-UniversityofEdinburgh/Edinburgh/2_Project/6_Methodology/2_Basic_stats/real/1_PCA/240425_perSpecies")
getwd()


# setting up
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggpubr)

# read in data
GRiv_pca05 <- read_table("05_Geum_riv.eigenvec", col_names = FALSE)
GRiv_eigenval05 <- scan("05_Geum_riv.eigenval")
GRiv_pca10 <- read_table("10_Geum_riv.eigenvec", col_names = FALSE)
GRiv_eigenval10 <- scan("10_Geum_riv.eigenval")

GUrb_pca05 <- read_table("05_Geum_urb.eigenvec", col_names = FALSE)
GUrb_eigenval05 <- scan("05_Geum_urb.eigenval")
GUrb_pca10 <- read_table("10_Geum_urb.eigenvec", col_names = FALSE)
GUrb_eigenval10 <- scan("10_Geum_urb.eigenval")


LRep_pca05 <- read_table("05_Lina_rep.eigenvec", col_names = FALSE)
LRep_eigenval05 <- scan("05_Lina_rep.eigenval")
LRep_pca10 <- read_table("10_Lina_rep.eigenvec", col_names = FALSE)
LRep_eigenval10 <- scan("10_Lina_rep.eigenval")

LVul_pca05 <- read_table("05_Lina_vul.eigenvec", col_names = FALSE)
LVul_eigenval05 <- scan("05_Lina_vul.eigenval")
LVul_pca10 <- read_table("10_Lina_vul.eigenvec", col_names = FALSE)
LVul_eigenval10 <- scan("10_Lina_vul.eigenval")


PVer_pca05 <- read_table("05_Prim_ver.eigenvec", col_names = FALSE)
PVer_eigenval05 <- scan("05_Prim_ver.eigenval")
PVer_pca10 <- read_table("10_Prim_ver.eigenvec", col_names = FALSE)
PVer_eigenval10 <- scan("10_Prim_ver.eigenval")

PVul_pca05 <- read_table("05_Prim_vul.eigenvec", col_names = FALSE)
PVul_eigenval05 <- scan("05_Prim_vul.eigenval")
PVul_pca10 <- read_table("10_Prim_vul.eigenvec", col_names = FALSE)
PVul_eigenval10 <- scan("10_Prim_vul.eigenval")


VTha_pca05 <- read_table("05_Verb_tha.eigenvec", col_names = FALSE)
VTha_eigenval05 <- scan("05_Verb_tha.eigenval")
VTha_pca10 <- read_table("10_Verb_tha.eigenvec", col_names = FALSE)
VTha_eigenval10 <- scan("10_Verb_tha.eigenval")

VNig_pca05 <- read_table("05_Verb_nig.eigenvec", col_names = FALSE)
VNig_eigenval05 <- scan("05_Verb_nig.eigenval")
VNig_pca10 <- read_table("10_Verb_nig.eigenvec", col_names = FALSE)
VNig_eigenval10 <- scan("10_Verb_nig.eigenval")


VHir_pca05 <- read_table("05_Viol_hir.eigenvec", col_names = FALSE)
VHir_eigenval05 <- scan("05_Viol_hir.eigenval")
VHir_pca10 <- read_table("10_Viol_hir.eigenvec", col_names = FALSE)
VHir_eigenval10 <- scan("10_Viol_hir.eigenval")

VOdo_pca05 <- read_table("05_Viol_odo.eigenvec", col_names = FALSE)
VOdo_eigenval05 <- scan("05_Viol_odo.eigenval")
VOdo_pca10 <- read_table("10_Viol_odo.eigenvec", col_names = FALSE)
VOdo_eigenval10 <- scan("10_Viol_odo.eigenval")



# sort out the pca data
# remove nuisance column
GRiv_pca05 <- GRiv_pca05[,-2]
GRiv_pca10 <- GRiv_pca10[,-2]
GUrb_pca05 <- GUrb_pca05[,-2]
GUrb_pca10 <- GUrb_pca10[,-2]

LRep_pca05 <- LRep_pca05[,-2]
LRep_pca10 <- LRep_pca10[,-2]
LVul_pca05 <- LVul_pca05[,-2]
LVul_pca10 <- LVul_pca10[,-2]

PVer_pca05 <- PVer_pca05[,-2]
PVer_pca10 <- PVer_pca10[,-2]
PVul_pca05 <- PVul_pca05[,-2]
PVul_pca10 <- PVul_pca10[,-2]

VTha_pca05 <- VTha_pca05[,-2]
VTha_pca10 <- VTha_pca10[,-2]
VNig_pca05 <- VNig_pca05[,-2]
VNig_pca10 <- VNig_pca10[,-2]

VHir_pca05 <- VHir_pca05[,-2]
VHir_pca10 <- VHir_pca10[,-2]
VOdo_pca05 <- VOdo_pca05[,-2]
VOdo_pca10 <- VOdo_pca10[,-2]


# set names
names(GRiv_pca05)[1] <- "ind"
names(GRiv_pca05)[2:ncol(GRiv_pca05)] <- paste0("PC", 1:(ncol(GRiv_pca05)-1))
names(GRiv_pca10)[1] <- "ind"
names(GRiv_pca10)[2:ncol(GRiv_pca10)] <- paste0("PC", 1:(ncol(GRiv_pca10)-1))

names(GUrb_pca05)[1] <- "ind"
names(GUrb_pca05)[2:ncol(GUrb_pca05)] <- paste0("PC", 1:(ncol(GUrb_pca05)-1))
names(GUrb_pca10)[1] <- "ind"
names(GUrb_pca10)[2:ncol(GUrb_pca10)] <- paste0("PC", 1:(ncol(GUrb_pca10)-1))


names(LRep_pca05)[1] <- "ind"
names(LRep_pca05)[2:ncol(LRep_pca05)] <- paste0("PC", 1:(ncol(LRep_pca05)-1))
names(LRep_pca10)[1] <- "ind"
names(LRep_pca10)[2:ncol(LRep_pca10)] <- paste0("PC", 1:(ncol(LRep_pca10)-1))

names(LVul_pca05)[1] <- "ind"
names(LVul_pca05)[2:ncol(LVul_pca05)] <- paste0("PC", 1:(ncol(LVul_pca05)-1))
names(LVul_pca10)[1] <- "ind"
names(LVul_pca10)[2:ncol(LVul_pca10)] <- paste0("PC", 1:(ncol(LVul_pca10)-1))

names(PVer_pca05)[1] <- "ind"
names(PVer_pca05)[2:ncol(PVer__pca05)] <- paste0("PC", 1:(ncol(PVer_pca05)-1))
names(PVer_pca10)[1] <- "ind"
names(PVer_pca10)[2:ncol(PVer_pca10)] <- paste0("PC", 1:(ncol(PVer_pca10)-1))

names(PVul_pca05)[1] <- "ind"
names(PVul_pca05)[2:ncol(PVul_pca05)] <- paste0("PC", 1:(ncol(PVul_pca05)-1))
names(PVul_pca10)[1] <- "ind"
names(PVul_pca10)[2:ncol(PVul_pca10)] <- paste0("PC", 1:(ncol(PVul_pca10)-1))


names(VNig_pca05)[1] <- "ind"
names(VNig_pca05)[2:ncol(VNig_pca05)] <- paste0("PC", 1:(ncol(VNig_pca05)-1))
names(VNig_pca10)[1] <- "ind"
names(VNig_pca10)[2:ncol(VNig_pca10)] <- paste0("PC", 1:(ncol(VNig_pca10)-1))

names(VTha_pca05)[1] <- "ind"
names(VTha_pca05)[2:ncol(VTha_pca05)] <- paste0("PC", 1:(ncol(VTha_pca05)-1))
names(VTha_pca10)[1] <- "ind"
names(VTha_pca10)[2:ncol(VTha_pca10)] <- paste0("PC", 1:(ncol(VTha_pca10)-1))

names(VHir_pca05)[1] <- "ind"
names(VHir_pca05)[2:ncol(VHir_pca05)] <- paste0("PC", 1:(ncol(VHir_pca05)-1))
names(VHir_pca10)[1] <- "ind"
names(VHir_pca10)[2:ncol(VHir_pca10)] <- paste0("PC", 1:(ncol(VHir_pca10)-1))

names(VOdo_pca05)[1] <- "ind"
names(VOdo_pca05)[2:ncol(VOdo_pca05)] <- paste0("PC", 1:(ncol(VOdo_pca05)-1))
names(VOdo_pca10)[1] <- "ind"
names(VOdo_pca10)[2:ncol(VOdo_pca10)] <- paste0("PC", 1:(ncol(VOdo_pca10)-1))





#seperate original names into ID
GRiv_pca05 <- separate(data=GRiv_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
GRiv_pca05$ID <- paste0("ML", GRiv_pca05$ID)
GRiv_pca10 <- separate(data=GRiv_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
GRiv_pca10$ID <- paste0("ML", GRiv_pca10$ID)

GUrb_pca05 <- separate(data=GUrb_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
GUrb_pca05$ID <- paste0("ML", GUrb_pca05$ID)
GUrb_pca10 <- separate(data=GUrb_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
GUrb_pca10$ID <- paste0("ML", GUrb_pca10$ID)

LRep_pca05 <- separate(data=LRep_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
LRep_pca05$ID <- paste0("ML", LRep_pca05$ID)
LRep_pca10 <- separate(data=LRep_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
LRep_pca10$ID <- paste0("ML", LRep_pca10$ID)

LVul_pca05 <- separate(data=LVul_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
LVul_pca05$ID <- paste0("ML", LVul_pca05$ID)
LVul_pca10 <- separate(data=LVul_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
LVul_pca10$ID <- paste0("ML", LVul_pca10$ID)

PVer_pca05 <- separate(data=PVer_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
PVer_pca05$ID <- paste0("ML", PVer_pca05$ID)
PVer_pca10 <- separate(data=PVer_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
PVer_pca10$ID <- paste0("ML", PVer_pca10$ID)

PVul_pca05 <- separate(data=PVul_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
PVul_pca05$ID <- paste0("ML", PVul_pca05$ID)
PVul_pca10 <- separate(data=PVul_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
PVul_pca10$ID <- paste0("ML", PVul_pca10$ID)

VNig_pca05 <- separate(data=VNig_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VNig_pca05$ID <- paste0("ML", VNig_pca05$ID)
VNig_pca10 <- separate(data=VNig_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VNig_pca10$ID <- paste0("ML", VNig_pca10$ID)

VTha_pca05 <- separate(data=VTha_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VTha_pca05$ID <- paste0("ML", VTha_pca05$ID)
VTha_pca10 <- separate(data=VTha_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VTha_pca10$ID <- paste0("ML", VTha_pca10$ID)

VHir_pca05 <- separate(data=VHir_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VHir_pca05$ID <- paste0("ML", VHir_pca05$ID)
VHir_pca10 <- separate(data=VHir_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VHir_pca10$ID <- paste0("ML", VHir_pca10$ID)

VOdo_pca05 <- separate(data=VOdo_pca05, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VOdo_pca05$ID <- paste0("ML", VOdo_pca05$ID)
VOdo_pca10 <- separate(data=VOdo_pca10, col=1, into=c("class","ID"), sep="_ML", convert=TRUE)
VOdo_pca10$ID <- paste0("ML", VOdo_pca10$ID)




# sort out the individual class and pops
# class
GRiv_class05 <- rep(NA, length(GRiv_pca05$class))
GRiv_class05[grep("rivale", GRiv_pca05$class)] <- "Geum rivale"
GRiv_class10 <- rep(NA, length(GRiv_pca10$class))
GRiv_class10[grep("rivale", GRiv_pca10$class)] <- "Geum rivale"


GUrb_class05 <- rep(NA, length(GUrb_pca05$class))
GUrb_class05[grep("urbanum", GUrb_pca05$class)] <- "Geum urbanum"
GUrb_class10 <- rep(NA, length(GUrb_pca10$class))
GUrb_class10[grep("urbanum", GUrb_pca10$class)] <- "Geum urbanum"


LRep_class05 <- rep(NA, length(LRep_pca05$class))
LRep_class05[grep("rep", LRep_pca05$class)] <- "Linaria repens"
LRep_class10 <- rep(NA, length(LRep_pca10$class))
LRep_class10[grep("rep", LRep_pca10$class)] <- "Linaria repens"


LVul_class05 <- rep(NA, length(LVul_pca05$class))
LVul_class05[grep("vulgaris", LVul_pca05$class)] <- "Linaria vulgaris"
LVul_class10 <- rep(NA, length(LVul_pca10$class))
LVul_class10[grep("vulgaris", LVul_pca10$class)] <- "Linaria vulgaris"


PVer_class05 <- rep(NA, length(PVer_pca05$class))
PVer_class05[grep("veris", PVer_pca05$class)] <- "Primula veris"
PVer_class10 <- rep(NA, length(PVer_pca10$class))
PVer_class10[grep("veris", PVer_pca10$class)] <- "Primula veris"


PVul_class05 <- rep(NA, length(PVul_pca05$class))
PVul_class05[grep("vulgaris", PVul_pca05$class)] <- "Primula vulgaris"
PVul_class10 <- rep(NA, length(PVul_pca10$class))
PVul_class10[grep("vulgaris", PVul_pca10$class)] <- "Primula vulgaris"


VTha_class05 <- rep(NA, length(VTha_pca05$class))
VTha_class05[grep("thapsus", VTha_pca05$class)] <- "Verbascum thapsus"
VTha_class10 <- rep(NA, length(VTha_pca10$class))
VTha_class10[grep("thapsus", VTha_pca10$class)] <- "Verbascum thapsus"


VNig_class05 <- rep(NA, length(VNig_pca05$class))
VNig_class05[grep("nigrum", VNig_pca05$class)] <- "Verbascum nigrum"
VNig_class10 <- rep(NA, length(VNig_pca10$class))
VNig_class10[grep("nigrum", VNig_pca10$class)] <- "Verbascum nigrum"


VHir_class05 <- rep(NA, length(VHir_pca05$class))
VHir_class05[grep("hirta", VHir_pca05$class)] <- "Viola hirta"
VHir_class10 <- rep(NA, length(VHir_pca10$class))
VHir_class10[grep("hirta", VHir_pca10$class)] <- "Viola hirta"


VOdo_class05 <- rep(NA, length(VOdo_pca05$class))
VOdo_class05[grep("odorata", VOdo_pca05$class)] <- "Viola odorata"
VOdo_class10 <- rep(NA, length(VOdo_pca10$class))
VOdo_class10[grep("odorata", VOdo_pca10$class)] <- "Viola odorata"



# remake data.frame
GRiv_pca05 <- as_tibble(data.frame(GRiv_pca05, GRiv_class05))
GRiv_pca10 <- as_tibble(data.frame(GRiv_pca10, GRiv_class10))
GUrb_pca05 <- as_tibble(data.frame(GUrb_pca05, GUrb_class05))
GUrb_pca10 <- as_tibble(data.frame(GUrb_pca10, GUrb_class10))

LRep_pca05 <- as_tibble(data.frame(LRep_pca05, LRep_class05))
LRep_pca10 <- as_tibble(data.frame(LRep_pca10, LRep_class10))
LVul_pca05 <- as_tibble(data.frame(LVul_pca05, LVul_class05))
LVul_pca10 <- as_tibble(data.frame(LVul_pca10, LVul_class10))

PVer_pca05 <- as_tibble(data.frame(PVer_pca05, PVer_class05))
PVer_pca10 <- as_tibble(data.frame(PVer_pca10, PVer_class10))
PVul_pca05 <- as_tibble(data.frame(PVul_pca05, PVul_class05))
PVul_pca10 <- as_tibble(data.frame(PVul_pca10, PVul_class10))

VTha_pca05 <- as_tibble(data.frame(VTha_pca05, VTha_class05))
VTha_pca10 <- as_tibble(data.frame(VTha_pca10, VTha_class10))
VNig_pca05 <- as_tibble(data.frame(VNig_pca05, VNig_class05))
VNig_pca10 <- as_tibble(data.frame(VNig_pca10, VNig_class10))

VHir_pca05 <- as_tibble(data.frame(VHir_pca05, VHir_class05))
VHir_pca10 <- as_tibble(data.frame(VHir_pca10, VHir_class10))
VOdo_pca05 <- as_tibble(data.frame(VOdo_pca05, VOdo_class05))
VOdo_pca10 <- as_tibble(data.frame(VOdo_pca10, VOdo_class10))

# Plotting
# first convert to percentage variance explained
GRiv_pve05 <- data.frame(PC = 1:17, GRiv_pve05 = GRiv_eigenval05/sum(GRiv_eigenval05)*100)
GRiv_pve10 <- data.frame(PC = 1:17, GRiv_pve10 = GRiv_eigenval10/sum(GRiv_eigenval10)*100)
GUrb_pve05 <- data.frame(PC = 1:20, GUrb_pve05 = GUrb_eigenval05/sum(GUrb_eigenval05)*100)
GUrb_pve10 <- data.frame(PC = 1:20, GUrb_pve10 = GUrb_eigenval10/sum(GUrb_eigenval10)*100)

LRep_pve05 <- data.frame(PC = 1:7, LRep_pve05 = LRep_eigenval05/sum(LRep_eigenval05)*100)
LRep_pve10 <- data.frame(PC = 1:7, LRep_pve10 = LRep_eigenval10/sum(LRep_eigenval10)*100)
LVul_pve05 <- data.frame(PC = 1:7, LVul_pve05 = LVul_eigenval05/sum(LVul_eigenval05)*100)
LVul_pve10 <- data.frame(PC = 1:7, LVul_pve10 = LVul_eigenval10/sum(LVul_eigenval10)*100)

PVer_pve05 <- data.frame(PC = 1:18, PVer_pve05 = PVer_eigenval05/sum(PVer_eigenval05)*100)
PVer_pve10 <- data.frame(PC = 1:18, PVer_pve10 = PVer_eigenval10/sum(PVer_eigenval10)*100)
PVul_pve05 <- data.frame(PC = 1:18, PVul_pve05 = PVul_eigenval05/sum(PVul_eigenval05)*100)
PVul_pve10 <- data.frame(PC = 1:18, PVul_pve10 = PVul_eigenval10/sum(PVul_eigenval10)*100)

VNig_pve05 <- data.frame(PC = 1:7, VNig_pve05 = VNig_eigenval05/sum(VNig_eigenval05)*100)
VNig_pve10 <- data.frame(PC = 1:7, VNig_pve10 = VNig_eigenval10/sum(VNig_eigenval10)*100)
VTha_pve05 <- data.frame(PC = 1:14, VTha_pve05 = VTha_eigenval05/sum(VTha_eigenval05)*100)
VTha_pve10 <- data.frame(PC = 1:14, VTha_pve10 = VTha_eigenval10/sum(VTha_eigenval10)*100)

VHir_pve05 <- data.frame(PC = 1:5, VHir_pve05 = VHir_eigenval05/sum(VHir_eigenval05)*100)
VHir_pve10 <- data.frame(PC = 1:5, VHir_pve10 = VHir_eigenval10/sum(VHir_eigenval10)*100)
VOdo_pve05 <- data.frame(PC = 1:8, VOdo_pve05 = VOdo_eigenval05/sum(VOdo_eigenval05)*100)
VOdo_pve10 <- data.frame(PC = 1:8, VOdo_pve10 = VOdo_eigenval10/sum(VOdo_eigenval10)*100)


# make plots
Geum1V_05 <- ggplot(GRiv_pve05, aes(PC, GRiv_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Geum rivale eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Geum2V_05 <- ggplot(GUrb_pve05, aes(PC, GUrb_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Geum urbanum eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Geum1V_10 <- ggplot(GRiv_pve10, aes(PC, GRiv_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Geum rivale eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")
Geum2V_10 <- ggplot(GUrb_pve10, aes(PC, GUrb_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Geum urbanum eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")

Lina1V_05 <- ggplot(LRep_pve05, aes(PC, LRep_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Linaria repens eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Lina2V_05 <- ggplot(LVul_pve05, aes(PC, LVul_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Linaria vulgaris eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Lina1V_10 <- ggplot(LRep_pve10, aes(PC, LRep_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Linaria repens eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")
Lina2V_10 <- ggplot(LVul_pve10, aes(PC, LVul_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Linaria vulgaris eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")

Prim1V_05 <- ggplot(PVer_pve05, aes(PC, PVer_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Primula veris eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Prim2V_05 <- ggplot(PVul_pve05, aes(PC, PVul_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Primula vulgaris eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Prim1V_10 <- ggplot(PVer_pve10, aes(PC, PVer_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Primula veris eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")
Prim2V_10 <- ggplot(PVul_pve10, aes(PC, PVul_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Primula vulgaris eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")

Verb1V_05 <- ggplot(VNig_pve05, aes(PC, VNig_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Verbascum nigrum eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Verb2V_05 <- ggplot(VTha_pve05, aes(PC, VTha_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Verbascum thapsus eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Verb1V_10 <- ggplot(VNig_pve10, aes(PC, VNig_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Verbascum nigrum eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")
Verb2V_10 <- ggplot(VTha_pve10, aes(PC, VTha_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Verbascum thapsus eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")

Viol1V_05 <- ggplot(VHir_pve05, aes(PC, VHir_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Viola hirta eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Viol2V_05 <- ggplot(VOdo_pve05, aes(PC, VOdo_pve05)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Viola odorata eigenvalues --indep-pairwise 50 5 0.2", y ="Percentage variance explained")
Viol1V_10 <- ggplot(VHir_pve10, aes(PC, VHir_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Viola hirta  eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")
Viol2V_10 <- ggplot(VOdo_pve10, aes(PC, VOdo_pve10)) + geom_bar(stat = "identity") + theme_light() +
  labs(title = "Viola odorata eigenvalues --indep-pairwise 50 10 0.1", y ="Percentage variance explained")

# print plots to a PDF
pdffn = "All_PLINK_eigenvalues.pdf"
pdf(pdffn, width=10, height=10)

P <- ggarrange(Geum1V_05,Geum2V_05,Geum1V_10,Geum2V_10,
               Lina1V_05,Lina2V_05,Lina1V_10,Lina2V_10,
               Prim1V_05,Prim2V_05,Prim1V_10,Prim2V_10,
               Verb1V_05,Verb2V_05,Verb1V_10,Verb2V_10,
               Viol1V_05,Viol2V_05,Viol1V_10,Viol2V_10, ncol=2, nrow=2)
P

dev.off()


# calculate the cumulative sum of the percentage variance explained
cumsum(GRiv_pve05$GRiv_pve05)
cumsum(GUrb_pve05$GUrb_pve05)
cumsum(GRiv_pve10$GRiv_pve10)
cumsum(GUrb_pve10$GUrb_pve10)

cumsum(LRep_pve05$LRep_pve05)
cumsum(LVul_pve05$LVul_pve05)
cumsum(LRep_pve10$LRep_pve10)
cumsum(LVul_pve10$LVul_pve10)

cumsum(PVer_pve05$PVer_pve05)
cumsum(PVul_pve05$PVul_pve05)
cumsum(PVer_pve10$PVer_pve10)
cumsum(PVul_pve10$PVul_pve10)

cumsum(VTha_pve05$VTha_pve05)
cumsum(VNig_pve05$VNig_pve05)
cumsum(VTha_pve10$VTha_pve10)
cumsum(VNig_pve10$VNig_pve10)

cumsum(VHir_pve05$VHir_pve05)
cumsum(VOdo_pve05$VOdo_pve05)
cumsum(VHir_pve10$VHir_pve10)
cumsum(VOdo_pve10$VOdo_pve10)


# plot PCA
col <- c("Geum rivale" = "#7470AF", "Geum urbanum" = "#087234",
         "Linaria vulgaris" = "#B9974B", "Linaria repens" = "#B46BA2",
         "Primula vulgaris" = "#FFC000", "Primula veris" = "#ED7D31",
         "Verbascum thapsus" = "#6B4215", "Verbascum nigrum" = "#7A1751",
         "Viola odorata" = "#7A93FF", "Viola hirta" = "#433B95")


Geum1P_05 <- ggplot(GRiv_pca10, aes(PC1, PC2, col = GRiv_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(GRiv_pve05$GRiv_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(GRiv_pve05$GRiv_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Geum2P_05<- ggplot(GUrb_pca10, aes(PC1, PC2, col = GUrb_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(GUrb_pve05$GUrb_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(GUrb_pve05$GUrb_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Geum1P_10<- ggplot(GRiv_pca10, aes(PC1, PC2, col = GRiv_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(GRiv_pve10$GRiv_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(GRiv_pve10$GRiv_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Geum2P_10<- ggplot(GUrb_pca10, aes(PC1, PC2, col = GUrb_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(GUrb_pve10$GUrb_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(GUrb_pve10$GUrb_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))


Lina1P_05<- ggplot(LRep_pca10, aes(PC1, PC2, col = LRep_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(LRep_pve05$LRep_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(LRep_pve05$LRep_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Lina2P_05<- ggplot(LVul_pca10, aes(PC1, PC2, col = LVul_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(LVul_pve05$LVul_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(LVul_pve05$LVul_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Lina1P_10<- ggplot(LRep_pca10, aes(PC1, PC2, col = LRep_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(LRep_pve10$LRep_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(LRep_pve10$LRep_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Lina2P_10<- ggplot(LVul_pca10, aes(PC1, PC2, col = LVul_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(LVul_pve10$LVul_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(LVul_pve10$LVul_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))

Prim1P_05<- ggplot(PVer_pca10, aes(PC1, PC2, col = PVer_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(PVer_pve05$PVer_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(PVer_pve05$PVer_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Prim2P_05<- ggplot(PVul_pca10, aes(PC1, PC2, col = PVul_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(PVul_pve05$PVul_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(PVul_pve05$PVul_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Prim1P_10<- ggplot(PVer_pca10, aes(PC1, PC2, col = PVer_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(PVer_pve10$PVer_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(PVer_pve10$PVer_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Prim2P_10<- ggplot(PVul_pca10, aes(PC1, PC2, col = PVul_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(PVul_pve10$PVul_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(PVul_pve10$PVul_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))

Verb1P_05<- ggplot(VNig_pca10, aes(PC1, PC2, col = VNig_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VNig_pve05$VNig_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VNig_pve05$VNig_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Verb2P_05<- ggplot(VTha_pca10, aes(PC1, PC2, col = VTha_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VTha_pve05$VTha_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VTha_pve05$VTha_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Verb1P_10<- ggplot(VNig_pca10, aes(PC1, PC2, col = VNig_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VNig_pve10$VNig_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VNig_pve10$VNig_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Verb2P_10<- ggplot(VTha_pca10, aes(PC1, PC2, col = VTha_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VTha_pve10$VTha_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VTha_pve10$VTha_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))

Viol1P_05<- ggplot(VHir_pca10, aes(PC1, PC2, col = VHir_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VHir_pve05$VHir_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VHir_pve05$VHir_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Viol2P_05<- ggplot(VOdo_pca10, aes(PC1, PC2, col = VOdo_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VOdo_pve05$VOdo_pve05[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VOdo_pve05$VOdo_pve05[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 5 SNPs; keep " ~r^2 < 0.2)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Viol1P_10<- ggplot(VHir_pca10, aes(PC1, PC2, col = VHir_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VHir_pve10$VHir_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VHir_pve10$VHir_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))
Viol2P_10<- ggplot(VOdo_pca10, aes(PC1, PC2, col = VOdo_class10, label = ID)) + geom_point(size = 2) +
  scale_colour_manual(values = col) + theme_light() +
  xlab(paste0("PC1 (", signif(VOdo_pve10$VOdo_pve10[1], 3), "%)")) +
  ylab(paste0("PC2 (", signif(VOdo_pve10$VOdo_pve10[2], 3), "%)")) +
  ggtitle(bquote("PLINK: Window size 50 Kb, step size 10 SNPs; keep " ~r^2 < 0.1)) +
  geom_text_repel(max.overlaps = Inf, size=5) +
  labs(color = "Species") +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text.x = element_text(face="bold", size=10),
        axis.text.y = element_text(face="bold", size=10),
        plot.title = element_text(face="bold", size =12),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size =12),
        legend.text = element_text(face="italic", size = 12),
        legend.title = element_text(size = 12))


# print plots to a PDF
pdffn = "All_PCA_PLNIK.pdf"
pdf(pdffn, width=12, height=10)


Q <- ggarrange(Geum1P_05,Geum2P_05,Geum1P_10,Geum2P_10,
               Lina1P_05,Lina2P_05,Lina1P_10,Lina2P_10,
               Prim1P_05,Prim2P_05,Prim1P_10,Prim2P_10,
               Verb1P_05,Verb2P_05,Verb1P_10,Verb2P_10,
               Viol1P_05,Viol2P_05,Viol1P_10,Viol2P_10, ncol=2, nrow=2)
Q

dev.off()

pdffn = "Prim_PCA_PLNIK.pdf"
pdf(pdffn, width=12, height=10)

Prim <- ggarrange(Prim1P_05,Prim2P_05,Prim1P_10,Prim2P_10, ncol=2, nrow=2)
Prim

dev.off()


