#' All dengue cases by jurisdiction of residence in US states and territories, 2010 - 2023
#' @description All dengue cases by jurisdiction of residence in US states and territories, 2010 - 2023 published by the US Centers for Disease Control and Prevention (CDC)
#' @format A tibble with 742 rows and 4 variables:
#' \describe{
#'   \item{Year}{Year} 
#'   \item{Travel.status}{Travel status}
#'   \item{Jurisdiction}{Jurisdiction}
#'   \item{Count}{Dengue counts}
#'   \item{Legend}{Categorization of counts for easy plotting}
#'   \item{Notes}{Additional notes regarding the observation record}
#'   }
#' @source Accessed from \url{https://www.cdc.gov/dengue/data-research/facts-stats/historic-data.html}. Last accessed (Sep 3, 2024)
#' @examples 
#' head(cdc_dengue_casesbyjurisdiction)
"cdc_dengue_casesbyjurisdiction"