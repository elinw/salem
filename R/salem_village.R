#' Salem village
#'
#' A dataset containing tax list of everyone who appeared on
#' the tax assessment rolls for 1690, 1695, and 1697. This is a "a good, though
#' imperfect, indicator of the village's adult male population plus some widows
#' (and excluding young men who were not independent).
#'
#' May be merged with the tax_comparison data set based on name matching,
#'  but care should be taken to review and make judgements about matching.
#'
#' @format A data frame with 137 rows and 5 variables:
#' \describe{
#'   \item{Name}{Name of taxpayer (may be a family)}
#'   \item{Petition}{Did this person sign either the pro- or anti-Parris petition in 1695}
#'   \item{Church.to.1696}{Was the person a member of any church through 1696}
#'   \item{Sort}{ID from original data set}
#' }
#' @source \url{https://www.tulane.edu/~salem}
"salem_village"