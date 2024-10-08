#' Filter links corresponds to a specific year using the function output get_address
#' 
#' @param year year that you want to extract the reports
#' @param address list or the outout from get_addess function
#' @importFrom lifecycle deprecate_warn
#' @author Thiyanga S Talagala
#' @export
filter_year_wer <- function(year, address){
  deprecate_warn("2.0.0", "filter_year_wer()", "get_pdflinks_srilanka()")
  filter_year <- function(year, address){
    grepl(year, address, fixed=TRUE)
  }
  
  arg <- list(year, address)
  required.years <- unlist(purrr::pmap(arg, filter_year)) 
  required.num <- which(required.years == TRUE)
  address[required.num]
  
}
#'@examples
#'ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
#'filter_year_wer(2023, ad.list[1:9])