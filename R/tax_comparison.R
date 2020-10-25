#' Tax list data for Salem
#'
#' A dataset containing tax list data for Salem, MA, 1681-1700.
#' Payments are in shillings (converted from original records).
#' Petition refers to Pro-Parris, Anti-Parris and No Signature.
#' Data are in long format with one record per person per year,
#' while the original data was in wide format with a variable for each year.
#' May be merged with the tax_comparison data set based on name matching,
#' but care should be taken to review and make judgements about matching. This
#' data set includes more years of tax records than salem_village.
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{Name}{Name of the tax payer}
#'   \item{Petition}{Stance on Petition}
#'   \item{Year}{Year of payment}
#'   \item{Tax}{Tax paid}
#'   \item{Sort}{ID from original data set}
#' }
#' @source \url{https://www.tulane.edu/~salem/Tax%20Comparison%20Data%20Set.html}
"tax_comparison"