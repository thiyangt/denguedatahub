#' Annual number of dengue fever infections around the world
#' @description Annual incidence of dengue around the world
#' @format A tibble with 6750 rows and 4 variables:
#' \describe{
#'   \item{longitude}{Longitude}
#'   \item{latitude}{Latitude} 
#'   \item{group}{group variable}
#'   \item{order}{collect in order} 
#'   \item{region}{regions}
#'   \item{subregion}{subregions}
#'   \item{code}{Country or area code} 
#'   \item{year}{year}
#'   \item{incidence}{Number of dengue incidence across all ages}
#'   #'   \item{dengue.present}{whetherdengue cases present or not}
#'    }
#' @source \url{https://ourworldindata.org/grapher/dengue-incidence}
#' @examples 
#' head(world_annual)
"world_annual"