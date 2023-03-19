#' Extract links of all downloadable files on a webpage
#'
#' @param url url of the webpage that you intend to download files.
#' @return web addresses of all downloadable files
#' @importFrom magrittr %>%
#' @author Thiyanga S Talagala
#' @export
get_addresses <- function(url){
  page <- xml2::read_html(url)
  all.web.addresses <- page %>%
    rvest::html_nodes("a") %>%       # find all links
    rvest::html_attr("href") %>%     # get the url
    stringr::str_subset("\\.pdf")      # extract urls of the
  return(all.web.addresses)
  
}
#'@examples
#'ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
#'ad.list
