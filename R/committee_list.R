#' Committee list
#'
#' A dataset containing list of Salem Village Committee members 1685-1698.
#' Given in long format, with one row per member per year.
#' In 1688 there were only 4 members; in all other years there were five.
#'
#' @format A data frame with 69 rows and 5 variables:
#' \describe{
#'   \item{Committee.Members}{Name of committee member}
#'   \item{Social}{Their social position (3 groups)}
#'   \item{Petition}{Did this person sign either the pro- or anti-Parris petition in 1695}
#'   \item{Sort}{ID from original data set}
#'   \item{Year}{Year of membership}
#' }
#' @source \url{https://www.tulane.edu/~salem/Committee%20List%20Data%20Set.html}
"committee_list"