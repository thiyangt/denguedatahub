#' Read weekly epidemiological reports and convert dengue data into tidy format
#' @param url.part1 first part of the URL, by default "https://www.epid.gov.lk"
#' @param url.part2 URL address vector obtained from filter_year_wer_link
#' @param start.date.begin starting date of the first report week (format "2006-12-23")
#' @param end.date.begin endinging date of the first report week (format "2006-12-23")
#' @param start.date.last starting date of the last report week (format "2006-12-23")
#' @param end.date.last endinging date of the first report week (format "2006-12-23")
#' @param week.no report number vector
#' @export
convert_srilanka_wer_to_tidy <- function(url.part1="https://www.epid.gov.lk",
                                        url.part2, start.date.begin, end.data.begin,sart.date.last, end.data.last,week.no){
  
  combine <- function(url.part2){
    paste(url.part1,url.part2,sep="")
  }
  reports.url <- purrr::map(url.part2, combine)
  
  read_data <- function(url){
    table2 <- tabulizer::extract_tables(url,
                                        pages = 3, 
                                        guess = FALSE, 
                                        output = "data.frame")
    tbl <- tibble::tibble(x =table2[1][[1]][2:27, 1])
    tbl2 <- tidyr::separate(tbl,x, c("district", "cases"))
    tbl2$count <- as.numeric(tbl2$count)
    tbl2
  }
  
  reports.url <- unlist(reports.url)
  tidy.list <- purrr::map(reports.url, read_data)
  
  ## week variable
  nrow <- unlist(map(tidy.list, nrow))
  week <- rep(week.no, times=nrow)
  
  ## start.date
  start.date1 <- seq(as.Date(start.data.frist),as.Date(end.date.first), by = "1 week")
  start.date <- rep(start.date1, times=nrow)
  
  ## end.date
  end.date1 <- seq(as.Date(start.data.last),as.Date(end.date.last), by = "1 week")
  end.date <- rep(end.date1, times=nrow)
  
  ## 
  #year
  year <- rep(year, )
  
}
#'@examples
#'ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
#'wer2023url <- filter_year_wer(2023, ad.list[1:9])

convert_srilanka_wer_to_tidy(url.part2=wer2023url)