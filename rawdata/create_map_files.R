# This script will create maps for what are now
#  Maine and Massachuesetts for 1692.
# It uses the Newberry Atlas Historical Counties data
library(sf)
MA_county_maps <-
  st_read("rawdata/newberryatlas/MA_AtlasHCB/MA_Historical_Counties")
#ME_county_maps <- st_read("rawdata/newberryatlas/ME_AtlasHCB/ME_Historical_Counties")


MA_county_maps_1691 <- MA_county_maps[  MA_county_maps$START_DATE > "1690-01-01" ,]

MA_county_maps_1691 <- MA_county_maps |>
         dplyr::filter(
           mdy("01-01-1692") %within% interval(start = MA_county_maps$START_DATE,
                                                              end= MA_county_maps$END_DATE)
           )

MA_county_maps$CHANGE

#x <- as.data.frame(ourcounties) |> dplyr::select(NAME, ID, START_DATE, END_DATE, CHANGE)

st_write(MA_county_maps_1691, "../data/MA_county_maps_1691.shp", append = FALSE)
library(sf)

library(sf)
library(dplyr)
MA_towns <-st_read("rawdata/towns/townssurvey_shp/townsurvey_poly/TOWNSSURVEY_POLY.shp")
salem_region <- MA_towns |> dplyr::filter(FIPS_STCO %in% c(25009, 25017, 25025))
# We need to do this because of an error in the shape file.
salem_region <- sf::st_buffer(salem_region, dist = 0)
#change Danvers to "SALEM VLLAGE"
salem_region$TOWN[salem_region$TOWN == "DANVERS"] <- "SALEM VILLAGE"
salem_region$TOWN[salem_region$TOWN == "SALEM"] <- "SALEM TOWN"

accused_towns <- accused_witches |>
                    mutate(TOWN = toupper(Residence)) |>
                    group_by(TOWN) |>
                   summarize(n_accused = n())

salem_region <- merge(salem_region, accused_towns, by = "TOWN", all = TRUE)


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

salem_region_max <- as.data.frame(salem_region) |> group_by(TOWN)  |>
                     summarize(max_sqm = max(SQUARE_MIL))

salem_region <- merge(salem_region, salem_region_max, by = "TOWN", all = TRUE)
salem_region$TOWN_LABEL <- ifelse(salem_region$SQUARE_MIL != salem_region$max_sqm,
                            "",
                            salem_region$TOWN
                            )
salem_region <- salem_region |> select(-starts_with("POP"), -max_sqm)
save(salem_region, file = "data/salem_region.rda")