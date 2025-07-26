#' accused witches
#'
#' A dataset containing list of accused witches, the month of accusation,
#' whether they were executed and, if so, what month.
#'
#' @format A data frame with 152 rows and 8 variables:
#' \describe{
#'   \item{Accused.Witch}{Name of accused}
#'   \item{Residence}{Town of residence}
#'   \item{Month.of.Accusation}{Month of accusation as number}
#'   \item{Month.of.Execution}{Month of execution as number. Missing for those not executed.}
#'   \item{Sort}{ID from original data set}
#'   \item{Month.of.Accusation.Name}{Month of accusation as ordered factor}
#'   \item{Month.of.Execution.Name}{Month of execution as ordered factor. Missing for those not executed.}
#'   \item{executed}{Indicator of whether the accused was executed}
#' }
#' @source \url{https://www.tulane.edu/~salem/Accused%20Witches.html}
"accused_witches"