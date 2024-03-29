if (!require("remotes")) {
  install.packages("remotes")
}

# use link.R file


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
#'

filter_year_wer <- function(year, address){

filter_year <- function(year, address){
  grepl(year, address, fixed=TRUE)
}

arg <- list(year, address)
required.years <- unlist(purrr::pmap(arg, filter_year)) 
required.num <- which(required.years == TRUE)
address[required.num]

}


filter_year_wer(2023, ad.list[1])

a <- "https://www.epid.gov.lk"


convert_wer_to_tidy <- function(starting.date, starting.week){

combine <- function(url.part2){
  paste("https://www.epid.gov.lk",url.part2,sep="")
}
reports.url <- purrr::map(ad.list, combine)

read_data <- function(url){
  table2 <- tabulizer::extract_tables(url,
                          pages = 3, 
                          guess = FALSE, 
                          output = "data.frame")
  tbl <- tibble::tibble(x =table2[1][[1]][2:27, 1])
  tbl2 <- tidyr::separate(tbl,x, c("district", "count"))
  tbl2$count <- as.numeric(tbl2$count)
  tbl2
}

tidy.list <- purrr::map(reports.url, read_data)

}



# elsewhere
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))
library(tabulizer)

read_data <- function(url){
table <- extract_tables(url,
                        pages = 3, 
                        guess = FALSE, 
                        output = "data.frame")
tbl <- tibble::tibble(x =table2[1][[1]][2:27, 1])
tbl2 <- tidyr::separate(tbl,x, c("district", "count"))
tbl2$count <- as.numeric(tbl2$count)
tbl2
}




b <- list1[1]



table2 <- extract_tables(url2[1],
                        pages = 3, 
                        guess = FALSE, 
                        output = "data.frame")
class(table2[1][[1]]) #dataframe
table2[1][[1]][2:27, 1]

tbl <- tibble::tibble(x =table2[1][[1]][2:27, 1])
tbl
tbl2 <- tidyr::separate(tbl,x, c("district", "count"))
tbl2$count <- as.numeric(tbl2$count)
