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
                                      values_drop_na = TRUE) |>
                                      select(-original_var_name)
save(committee_list, file = "data/committee_list.rda")

# We just need to do this because we can subset this to get the individual years.
tax_comparison <- read.table("rawdata/Tax_Comparison_Data_Set.txt", sep = '\t',header = TRUE)
tax_comparison <- tax_comparison |>
                  tidyr::pivot_longer(
                                      cols = starts_with("X"),
                                      values_to  = "Tax",
                                      names_prefix = "X",
                                      names_to = "Year",
                                      values_drop_na = TRUE)


save(tax_comparison, file = "data/tax_comparison.rda")

# This section describes how the map file was created. However the raw data
# is not included in the package. This should be downloaded from
# https://docs.digital.mass.gov/dataset/massgis-data-community-boundaries-towns-survey-points
# using the TOWNSURVEYPOLY data.
# The sf package is required.
library(sf)
library(dplyr)
MA_towns <-st_read("rawdata/towns/townssurvey_shp/townsurvey_poly/TOWNSSURVEY_POLY.shp")
# Select just the three counties with towns in the other data sets.
# Note that towns in present day Maine wil not be mapped here.
salem_region <- MA_towns |> dplyr::filter(FIPS_STCO %in% c(25009, 25017, 25025))
# We need to do this because of an issue in the shape file.
salem_region <- sf::st_buffer(salem_region, dist = 0)
#change Danvers to "SALEM VLLAGE" and Salem to "SALEM TOWN to match
# the other data sets.
salem_region$TOWN[salem_region$TOWN == "DANVERS"] <- "SALEM VILLAGE"
salem_region$TOWN[salem_region$TOWN == "SALEM"] <- "SALEM TOWN"

accused_towns <- accused_witches |>
  mutate(TOWN = toupper(Residence)) |>
  group_by(TOWN) |>
  summarize(n_accused = n())

# Add the total number accused to each town
salem_region <- merge(salem_region, accused_towns, by = "TOWN", all = TRUE) |>
                  relocate(geography)

# Add the total number of accused by month.
accused_town_monthly <- accused_witches |>
  tidyr::pivot_wider(id_cols = c(Accused.Witch, Residence),
                     names_from = Month.of.Accusation.Name,
                     values_from = Month.of.Accusation.Name) |>
  mutate(TOWN = toupper(Residence)) |>
  group_by(TOWN) |>
  summarize(
    February = sum(!is.na(February)),
    March = sum(!is.na(March)),
    April = sum(!is.na(April)),
    May = sum(!is.na(May)),
    June = sum(!is.na(June)),
    July = sum(!is.na(July)),
    August = sum(!is.na(August)),
    September = sum(!is.na(September)),
    October = sum(!is.na(October)),
    November = sum(!is.na(November))
  )
salem_region <- merge(salem_region, accused_town_monthly,
                      by = "TOWN", all = TRUE)

# Many towns have more than one row. This code creates a
# TOWN_LABEL variable that is assigned to the largest area represented
# in the records for the town.
salem_region_max <- as.data.frame(salem_region) |> group_by(TOWN)  |>
  summarize(max_sqm = max(SQUARE_MIL))

salem_region <- merge(salem_region, salem_region_max, by = "TOWN", all = TRUE)
salem_region$TOWN_LABEL <- ifelse(salem_region$SQUARE_MIL != salem_region$max_sqm,
                                  "",
                                  salem_region$TOWN
)

# Drop the twentieth century data
salem_region <- salem_region |> select(-starts_with("POP"), -max_sqm)
save(salem_region, file = "data/salem_region.rda")


# Compensation data
compensation <- read.delim(file = "rawdata/compensation.txt")
compensation$total_amount <-20*compensation$lb. + compensation$s. +
  compensation$d./12
compensation$gender <- c("Female", "Male", "Female", "Male", "Couple", "Female",
            "Male", "Female", "Female", "Couple", "Couple", "Female", "Female",
            "Female", "Female",
            "Female", "Female", "Female", "Female")

