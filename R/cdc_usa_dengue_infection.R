#' Annual number of dengue fever infections in the USA
#' @description Annual cases of dengue in different areas of the USA
#' @format A tibble with 9170 rows and 38 variables:
#' \describe{
#'   \item{area}{Reporting Area}
#'   \item{year}{Year} 
#'   \item{week}{Week}
#'   \item{dengue_cases}{Dengue cases in the current week}
#'   \item{dengue_like_illness}{Dengue like illness cases in the current week}
#'   \item{severe_dengue}{Severe dengue cases in the current week}
#'   }
#' @source \url{https://data.cdc.gov/browse.php?federation_filter=85&format=php&sortBy=alpha&tags=dengue}
#' @examples 
#' head(cdc_usa_dengue_infection)
"cdc_usa_dengue_infection"