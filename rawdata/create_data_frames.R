# This file documents the creation of the data sets in R.
# This file and the raw data are not included in the R package but
# are in the repository for reproducability purposes.

accused_witches <- read.table("rawdata/Accused_Witches_Data_Set.txt", sep = '\t',header = TRUE)
accused_witches$Month.of.Accusation[accused_witches$Month.of.Accusation == -1] <- NA
accused_witches$Month.of.Accusation.Name <- factor(
              accused_witches$Month.of.Accusation,
              levels = as.character(c(1:12)),
              labels = c("January", "February", "March", "April", "May",
                         "June", "July", "August", "September", "October",
                         "November", "December"),
              ordered = TRUE
 )
accused_witches$Month.of.Execution.Name <- factor(
  accused_witches$Month.of.Execution,
  levels = as.character(c(1:12)),
  labels = c("January", "February", "March", "April", "May",
             "June", "July", "August", "September", "October",
             "November", "December"),
  ordered = TRUE
)
accused_witches$executed <- ifelse(is.na(accused_witches$Month.of.Execution),
                                   "No", "Yes")
accused_witches$Residence <- trimws(accused_witches$Residence)
save(accused_witches, file = "data/accused_witches.rda")

# Data reproduced in other data sets
#towns <- read.table("rawdata/Towns_Data_Set.txt", sep = '\t',header = TRUE)
#save(towns, file = "data/towns.rda")

pro_parris <- read.table("rawdata/Pro-Parris_Social_Data_Set.txt", sep = '\t',header = TRUE)
pro_parris$view <- "Pro-Parris"
#save(pro_parris, file = "data/pro_parris.rda")

anti_parris <- read.table("rawdata/Anti-Parris_Social_Data_Set.txt", sep = '\t',header = TRUE)
anti_parris$view <- "Anti-Parris"
anti_parris$Identification[anti_parris$Identification == "[Church] Member"] <-
           "Church-Member"
#save(anti_parris, file = "data/anti_parris.rda")

parris_social <- rbind(pro_parris, anti_parris)
parris_social$view <- as.factor(parris_social$view)
parris_social$Sex <- as.factor(parris_social$Sex)
parris_social$Identification <- as.factor(parris_social$Identification)

save(parris_social, file = "data/parris_social.rda")

salem_village <- read.table("rawdata/Salem_Village_Data_Set.txt", sep = '\t',header = TRUE)
salem_village$Petition <- as.factor(salem_village$Petition)
salem_village$Church.to.1696 <- as.factor(salem_village$Church.to.1696)
save(parris_social, file = "data/parris_social.rda")

# not needed this is is a wide version of committee_list
#committee_yearly <- read.table("rawdata/Committee_Yearly_Data_Set.txt", sep = '\t',header = TRUE)
#save(committee_yearly, file = "data/committee_yearly.rda")

committee_list <- read.table("rawdata/Committee_List_Data_Set.txt", sep = '\t',header = TRUE)
committee_list$Social <- as.factor(committee_list$Social)
committee_list$Petition <- as.factor(committee_list$Petition)
committee_list <- tidyr::pivot_longer(data = committee_list,
                                      cols = starts_with("X"),
                                      values_to  = "Year",
                                      names_to = "original_var_name",
                                      values_drop_na = TRUE) %>%
                                      select(-original_var_name)
save(committee_list, file = "data/committee_list.rda")

# We just need to do this because we can subset this to get the individual years.
tax_comparison <- read.table("rawdata/Tax_Comparison_Data_Set.txt", sep = '\t',header = TRUE)
tax_comparison <- tax_comparison %>%
                  tidyr::pivot_longer(
                                      cols = starts_with("X"),
                                      values_to  = "Tax",
                                      names_prefix = "X",
                                      names_to = "Year",
                                      values_drop_na = TRUE)


save(tax_comparison, file = "data/tax_comparison.rda")


