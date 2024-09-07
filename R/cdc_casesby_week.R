#' All dengue cases by week in US states and territories, 2010 - 2023
#' @description All dengue cases by week in US states and territories, 2010 - 2023 published by the US Centers for Disease Control and Prevention (CDC)
#' @format A tibble with 742 rows and 4 variables:
#' \describe{
#'   \item{Year}{Year} 
#'   \item{Travel.status}{Travel status}
#'   \item{Week}{Week}
#'   \item{Reported.cases}{Number of reported dengue cases}
#'   }
#' @source Accessed from \url{https://www.cdc.gov/dengue/data-research/facts-stats/historic-data.html}. Last accessed (Sep 3, 2024)
#' @examples 
#' head(cdc_casesby_week)
"cdc_casesby_week"