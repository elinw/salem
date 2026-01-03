#' Simple Features data for Salem
#'
#' A dataset containing map information for the three counties
#' represented in the accused_witches data set (not including present-day
#' Maine locations) in simple features format. It also includes associated
#' data on accusations. This data should _never_ be used to analyze accusations.
#' The data is based on modern town boundaries from the Massachuessetts
#' Document Repository.  Some simple cleaning has been done to facilitate
#' basic mapping. Specifically, the names Salem Town and Salem Village are used
#' rather than the modern Salem and Danvers. Additionally, a field, TOWN_LABEL
#' is attached to the largest area for each town or community.
#'
#' Complex analyses require the sf package, but simple mapping can be
#' done using ggplot2.
#'
#' FIPS refers to the Federal Information Processing Standard
#'
#' @format A simple features data frame with 437 rows and 28 variables:
#' \describe{
#'   \item{geometry}{Simple Features geometry}
#'   \item{TOWN}{Name of town in upper case letters}
#'   \item{TOWN_ID}{ID of town}
#'   \item{TYPE}{Type of municipality C = City or T = Town}
#'   \item{ISLAND}{Indicator for islands. Note that many towns have multiple polygons}
#'   \item{COASTAL_PO}{YES for ocean polygon within town limits, NO otherwise}
#'   \item{FOURCOLOR}{Codes allowing shading of all towns with 4 symbols}
#'   \item{FIPS_STCO}{FIPS for state  and county}
#'   \item{CCD_MCD}{US Census town code}
#'   \item{FIPS_PLACE}{FIPS town code}
#'   \item{FIPS_MCD}{FIPS State & County & Census Town Code concatenated}
#'   \item{FIPS_COUNT}{FIPS County}
#'   \item{ACRES}{Area in acres}
#'   \item{SQUARE_MIL}{Area in square miles}
#'   \item{SHAPE_Leng}{The perimeter in meters}
#'   \item{SHAPE_Area}{The polygon area in square meters}
#'   \item{n_accused}{Total accused}
#'   \item{February}{Number accused in February}
#'   \item{March}{Number accused in March}
#'   \item{April}{Number accused in April}
#'   \item{May}{Number accused in May}
#'   \item{June}{Number accused in June}
#'   \item{July}{Number accused in July}
#'   \item{August}{Number accused in August}
#'   \item{September}{Number accused in September}
#'   \item{October}{Number accused in October}
#'   \item{November}{Number accused in November}
#'   \item{TOWN_LABEL}{Town name to be used for labelling}
#' }
#' @source \url{https://docs.digital.mass.gov/dataset/massgis-data-community-boundaries-towns-survey-points}
"salem_region"
