#' All dengue cases by age group and sex in US states and territories, 2010 - 2023
#' @description Annual dengue cases by age group and sex in US states and territories, 2010 - 2023 published by the US Centers for Disease Control and Prevention (CDC)
#' @format A tibble with 3900 rows and 7 variables:
#' \describe{
#'   \item{Year}{Year} 
#'   \item{Travel.status}{Travel status}
#'   \item{Age}{Age group}
#'   \item{Male}{Number of male dengue cases}
#'   \item{Female}{Number of female dengue cases}
#'   }
#' @source Accessed from \url{https://www.cdc.gov/dengue/data-research/facts-stats/historic-data.html}. Last accessed (Sep 3, 2024)
#' @examples 
#' head(cdc_dengue_agesex)
"cdc_dengue_agesex"