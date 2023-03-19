#'
#'
#'
#'
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
