#' All dengue cases by county of residence in US states and territories, 2010 - 2023
#' @description Annual dengue cases by county of residence in US states and territories, 2010 - 2023 published by the US Centers for Disease Control and Prevention (CDC)
#' @format A tibble with 3900 rows and 7 variables:
#' \describe{
#'   \item{FullGeoName}{Reporting Area}
#'   \item{Year}{Year} 
#'   \item{Travel.status}{Travel status}
#'   \item{County}{County}
#'   \item{Legend}{Categorisation of counts for easy visualisations}
#'   \item{Notes}{Additional note about the area}
#'   }
#' @source Accessed from \url{https://www.cdc.gov/dengue/data-research/facts-stats/historic-data.html}. Last accessed (Sep 3, 2024)
#' @examples 
#' head(cdc_usa_dengue_infection)
"cdc_dengue_countyyear"