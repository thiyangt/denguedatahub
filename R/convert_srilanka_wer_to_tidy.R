#' Read weekly epidemiological reports and convert dengue data into tidy format
#' @param year year 
#' @param url.part1 first part of the URL, by default "https://www.epid.gov.lk"
#' @param url.part2 URL address vector obtained from filter_year_wer_link
#' @param start.date.first starting date of the first report week (format "2006-12-23")
#' @param end.date.first endinging date of the first report week (format "2006-12-23")
#' @param start.date.last starting date of the last report week (format "2006-12-23")
#' @param end.date.last endinging date of the first report week (format "2006-12-23")
#' @param week.no report number vector
#' @importFrom dplyr select
#' @importFrom dplyr bind_rows 
#' @importFrom magrittr %>% 
#' @export
convert_srilanka_wer_to_tidy <- function(year, url.part1="https://www.epid.gov.lk",
                                        url.part2, start.date.first, end.date.first,start.date.last, end.date.last,week.no){
  
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
    if(tbl$x[[1]] == "Colombo"){
      tbl2 <- tibble::tibble("district" =table2[1][[1]][2:27, 1])
      cases1 <- tibble::tibble(x =table2[1][[1]][2:27, 2])
      cases2 <- tidyr::separate(cases1, x, "cases")
      tbl2$cases <- cases2$cases
    } else {
    tbl2 <- tidyr::separate(tbl,x, c("district", "cases"))
    tbl2$cases <- as.numeric(tbl2$cases)
    
    }
    tbl2
  }
  
  reports.url <- unlist(reports.url)
  tidy.list <- purrr::map(reports.url, read_data)
  
  ## week variable
  dim.row <- function(df){
    dim(df)[1]
  }
  nrow <- unlist(purrr::map(tidy.list, dim.row))
  week <- rep(week.no, times=nrow)
  
  ## start.date
  start.date1 <- seq(as.Date(start.date.first),as.Date(start.date.last), by = "1 week")
  start.date <- rep(start.date1, times=nrow)
  
  ## end.date
  end.date1 <- seq(as.Date(end.date.first),as.Date(end.date.last), by = "1 week")
  end.date <- rep(end.date1, times=nrow)
  
  ## cobmine tibbles in the list corresponds to each week
  final <- map_dfr(tidy.list, dplyr::bind_rows)  
  
  #year
  year <- rep(year, dim(final)[1])
  
  final$year <- year
  final$start.date <- start.date
  final$end.date  <- end.date
  final$week <- week
  
  # reorder columns
  
  final %>% dplyr::select(year, 
                   week,
                   start.date,
                   end.date,
                   district,
                   cases)
  

    
    
    
  }
  

#'@examples
#'ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
#'wer2023url <- filter_year_wer(2023, ad.list[1:9])
#'data2023 <- convert_srilanka_wer_to_tidy(year=2023, url.part2=wer2023url, 
#'start.date.first = "2022-12-31",
#'end.date.first = "2023-01-06",
#'start.date.last = "2023-01-28", 
#'end.date.last = "2023-02-03",
#'week.no=c(52, 1:4))
#'data2023
