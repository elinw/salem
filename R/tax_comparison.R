#' Tax list data fo Salem
#'
#' A dataset containing tax list data for Salem, MA, 1681-1700.
#' Payments are in shillings (converted from original records).
#' Petition refers to Pro-Parris, Anti-Parris and No Signature.
#' Data are in long format with one record per person per year.
#'
#' @format A data frame with 200 rows and 9 variables:
#' \describe{
#'   \item{Name}{Name of the tax payer}
#'   \item{Petition}{Stance on Petition}
#'   \item{Year}{Year of payment}
#'   \item{Tax}{Tax paid}
#'   \item{Sort}{ID from original data set}
#' }
#' @source \url{https://www.tulane.edu/~salem}
"tax_comparison"