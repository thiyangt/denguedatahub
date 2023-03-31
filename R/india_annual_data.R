#' DENGUE/DHF situation in India since 2017
#' @description State/Union Territory(UT)-wise dengue/DHF annual deaths and cases since 2017 (Last accessed from the source on 30 January 2023). 
#' @format A tibble with 432 rows and 5 variables:
#' \describe{
#'   \item{area}{Name of the affected states/UTs}
#'   \item{type}{An indicator for the type of cases (deaths, cases)} 
#'   \item{year}{Year}
#'   \item{additional_information}{Additional information regarding collected year period}
#'   \item{value}{Cases}
#'    }
#' @source National Center for Vector Borne Disease Control, Directorate General of Health Services, Ministry of Health and Family Welfare, Government of India.
#' @examples 
#' head(india_annual_data)
"india_annual_data"