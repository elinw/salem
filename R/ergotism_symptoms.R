#'
#' Ergotism symptoms
#'
#' A dataset containing the ergotism data presented in Spanos and Gottlieb
#' (1976) Table 1. The dataframe records the symptoms possible symptoms of
#' ergotism reported about 22 individuals.
#'
#' Spanos and Gottlieb, with one exeption (E. Keysar), drew the data from depositions in
#' the _Records of the Salem Witchcraft_ collection. Details of data collection
#' are provided in the article. The data set indicates the volume and page
#' of the individual report.
#' J. Doritch is also mentioned in volume 2 page 179 of _RSW_.
#'
#' The article is an attempt to compare the actual symptoms reported to a
#' list of symptoms of ergotism.
#' For each variable a 1 inidicates that the symptom was reported, while a
#' 0 indicated it was not reported. They conclude that "We examined
#'  these 112 depositions looking for behavior that, even in a broad sense,
#'  might possibly represent symptoms of convulsive ergotism."
#'
#' @format A data frame with 22 rows and 20 variables:
#' \describe{
#'   \item{name}{Name of the sufferer}
#'   \item{rsw_volume}{Volume number of RSW}
#'   \item{rsw_page}{Page number}
#'   \item{vomitting}{Vomitting }
#'   \item{diarrhea}{Diarrhea }
#'   \item{livid_skin}{Livid skin }
#'   \item{permanent_contractures}{Permanent contractures }
#'   \item{pain_in_extremities}{Pain in extremities }
#'   \item{death}{Death }
#'   \item{temporary_muscle_stiffness}{Temporary muscle stiffness }
#'   \item{convulsions}{Convulsions Cases Spanos and Gottlieb considered uncertain are coded missing.}
#'   \item{ravenous_appetite}{Ravenous appetite }
#'   \item{perceptual_disturbances}{Perceptual disturbances Cases Spanos and Gottlieb considered uncertain are coded missing. }
#'   \item{apparitions}{Apparitions }
#'   \item{sensations_of_hot_and_cold}{Sensations of hot & cold}
#'   \item{skin_sensations}{Skin sensations}
#'   \item{stomach_pain}{Stomach pain}
#'   \item{choking_sensations}{Choking sensations}
#'   \item{inability_to_speak}{Temporary inability to speak}
#'   \item{total}{Total number of symptoms}
#' }
#' @source Spanos, N. P., & Gottlieb, J. (1976). Ergotism and the Salem Village
#'         Witch Trials. Science, 194(4272), 1390–1394.
"ergotism_symptoms"