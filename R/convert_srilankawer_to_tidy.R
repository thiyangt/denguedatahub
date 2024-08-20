#' Read weekly epidemiological reports and convert dengue data into tidy format
#' 
#' 
#' @param report.url URL of all WER that you want to extract tables and convert into tidy
#' @param start.date.first starting date of the first report week (format "2006-12-23")
#' @param end.date.first endinging date of the first report week (format "2006-12-23")
#' @param start.date.last starting date of the last report week (format "2006-12-23")
#' @param end.date.last endinging date of the first report week (format "2006-12-23")
#' @param week.no report number vector
#' @importFrom dplyr select
#' @importFrom dplyr filter
#' @importFrom dplyr bind_rows 
#' @importFrom tabulizer extract_tables
#' @importFrom lifecycle deprecate_warn
#' @importFrom magrittr %>% 
#' @export
convert_srilanka_wer_to_tidy <- function(report.url, start.date.first, end.date.first,start.date.last, end.date.last,week.no){
  
  
  combine <- function(url.part2){
    paste(url.part1,url.part2,sep="")
  }
  reports.url <- purrr::map(url.part2, combine)
  
  read_data <- function(url){
    table2 <- tabulizer::extract_tables(url,
                                        pages = 3, 
                                        guess = FALSE, 
                                        output = "data.frame")
    if (year == 2020) {
      tbl <- tibble::tibble(x =table2[1][[1]][4:29, 1], y =table2[1][[1]][4:29, 2])
    } else {
      tbl <- tibble::tibble(x =table2[1][[1]][2:27, 1], y =table2[1][[1]][2:27, 2])}
    if(tbl$x[[1]] == "Colombo"){
      tbl2 <- tibble::tibble("district" =table2[1][[1]][2:27, 1])
      cases1 <- tibble::tibble(x =table2[1][[1]][2:27, 2])
      cases2 <- tidyr::separate(cases1, x, "cases")
      tbl2$cases <- as.numeric(cases2$cases)
      tbl4 <-tbl2
    } else {
      tbl2 <- tidyr::separate(tbl,x, c("district", "cases1"))
      tbl3 <- tidyr::separate(tbl2, y, c("cases2", "cases3", "cases4"))
      # replace missing value in cases1 from cases 2
      
      tbl4 <- tbl3 %>% 
        dplyr::mutate(cases = dplyr::coalesce(cases1, cases2))
      tbl4$cases <- as.numeric(tbl4$cases)
      tbl4 <- tbl4 %>% dplyr::select("district", "cases")
      
      
    }
    tbl4
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
  final <- purrr::map_dfr(tidy.list, dplyr::bind_rows)  
  
  #year
  year <- rep(year, dim(final)[1])
  
  final$year <- year
  final$start.date <- start.date
  final$end.date  <- end.date
  final$week <- week
  
  # reorder columns
  
  final2 <- final %>% dplyr::select(year, 
                                    week,
                                    start.date,
                                    end.date,
                                    district,
                                    cases)
  
  
  district.name <- c("Colombo", "Gampaha",    
                     "Kalutara", "Kandy", "Matale", "NuwaraEliya",
                     "Galle", "Hambantota", "Matara", "Jaffna",     
                     "Kilinochchi", "Mannar", "Vavuniya", 
                     "Mullaitivu", "Batticaloa", "Ampara","Trincomalee",
                     "Kurunegala",
                     "Puttalam",    "Anuradhapur", "Anuradhapura", 
                     "Polonnaruwa", "Badulla",  
                     "Monaragala", "Ratnapura", "Kegalle", "Kalmune")
  
  f3 <- dplyr::filter(final2, district %in% district.name)
  
  f3$district <- dplyr::recode(f3$district, 
                               Anuradhapur = "Anuradhapura",
                               Kurunagala = "Kurunegala")
  f3
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