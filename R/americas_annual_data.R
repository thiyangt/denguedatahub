#' Dengue and severe dengue cases and deaths for subregions of the Americas
#' @description Region/Country-wise dengue and severe dengue cases and deaths since 1980 (Last accessed from the source on 30 January 2023). 
#' @format A tibble with 899134 rows and 5 variables:
#' \describe{
#'   \item{region}{Name of the affected region}
#'   \item{country}{Name of the country} 
#'   \item{type}{An indicator for the type of cases (deaths, cases)}
#'   \item{cases}{cases}
#'   \item{year}{year}
#'    }
#' @source \url{https://www3.paho.org/data/index.php/en/mnu-topics/indicadores-dengue-en/dengue-regional-en/261-dengue-reg-ano-en.html}
#' @examples 
#' head(americas_annual_data)
"americas_annual_data"