# This file documents the creation of the data sets in R.
# This file and the raw data are not included in the R package but
# are in the repository for reproducability purposes.

accused_witches <- read.table("rawdata/Accused_Witches_Data_Set.txt", sep = '\t',header = TRUE)
accused_witches$Month.of.Accusation[accused_witches$Month.of.Accusation == -1] <- NA
save(accused_witches, file = "data/accused_witches.rda")

# Data reproduced in other data sets
#towns <- read.table("rawdata/Towns_Data_Set.txt", sep = '\t',header = TRUE)
#save(towns, file = "data/towns.rda")

pro_parris <- read.table("rawdata/Pro-Parris_Social_Data_Set.txt", sep = '\t',header = TRUE)
pro_parris$view <- "Pro-Parris"
#save(pro_parris, file = "data/pro_parris.rda")

anti_parris <- read.table("rawdata/Anti-Parris_Social_Data_Set.txt", sep = '\t',header = TRUE)
anti_parris$view <- "Anti-Parris"
#save(anti_parris, file = "data/anti_parris.rda")

parris_social <- rbind(pro_parris, anti_parris)
parris_social$view <- as.factor(parris_social$view)
parris_social$view <- as.factor(parris_social$Identification)

save(parris_social, file = "data/parris_social.rda")

salem_village <- read.table("rawdata/Salem_Village_Data_Set.txt", sep = '\t',header = TRUE)
save(salem_village, file = "data/salem_village.rda")

# not needed this is is a wide version of committee_list
#committee_yearly <- read.table("rawdata/Committee_Yearly_Data_Set.txt", sep = '\t',header = TRUE)
#save(committee_yearly, file = "data/committee_yearly.rda")

committee_list <- read.table("rawdata/Committee_List_Data_Set.txt", sep = '\t',header = TRUE)
committee_list$Social <- as.factor(committee_list$Social)
committee_list$Petition <- as.factor(committee_list$Petition)
save(committee_list, file = "data/committee_list.rda")

# We just need to do this because we can subset this to get the individual years.
tax_comparison <- read.table("rawdata/Tax_Comparison_Data_Set.txt", sep = '\t',header = TRUE)
save(tax_comparison, file = "data/tax_comparison.rda")


