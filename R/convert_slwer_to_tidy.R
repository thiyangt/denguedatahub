#' Read weekly epidemiological reports and convert dengue data into tidy format
#' @param year year 
#' @param reports.url URL address vector obtained from get_pdflinks_srilanka
#' @param start.date.first starting date of the first report week (format "2006-12-23")
#' @param end.date.first endinging date of the first report week (format "2006-12-23")
#' @param start.date.last starting date of the last report week (format "2006-12-23")
#' @param end.date.last endinging date of the first report week (format "2006-12-23")
#' @param week.no report number vector
#' @importFrom dplyr select
#' @importFrom dplyr filter
#' @importFrom dplyr bind_rows 
#' @importFrom tabulapdf extract_tables
#' @importFrom lifecycle deprecate_warn
#' @importFrom magrittr %>% 
#' @export
convert_slwer_to_tidy <- function(year, reports.url, start.date.first, end.date.first,start.date.last, end.date.last,week.no){
  
  #combine <- function(url.part2){
  #  paste(url.part1,url.part2,sep="")
 # }
  #reports.url <- purrr::map(url.part2, combine)
  
  read_data <- function(url){
    table2 <- tabulapdf::extract_tables(url,
                                        pages = 3, 
                                        guess = FALSE, 
                                        output = "tibble")
    if (year == 2020) {
      tbl <- tibble::tibble(x =table2[1][[1]][4:29, 1], y =table2[1][[1]][4:29, 2])
    } else {
      tbl <- tibble::tibble(x =table2[1][[1]][2:27, 1], y =table2[1][[1]][2:27, 2])}
   # if(tbl$x[[1]] == "Colombo"){
   #   tbl2 <- tibble::tibble("district" =table2[1][[1]][2:27, 1])
   #   cases1 <- tibble::tibble(x =table2[1][[1]][2:27, 2])
   #   cases2 <- tidyr::separate(cases1, x, "cases")
   #   tbl2$cases <- as.numeric(cases2$cases)
   #   tbl4 <-tbl2
   # } else {
  if(tbl[1, 1] == "Colombo"){
    tbl2 <- tibble::tibble("district" =table2[1][[1]][2:27, 1])
    district <- as.vector(tbl2$district)[[1]]
 
    tbl2 <- tibble::tibble(district=district)
    cases1 <- tibble::tibble(x =table2[1][[1]][2:27, 2])
    df <- cases1$x[1]
    colnames(df) <- "x"
    cases2 <- tidyr::separate(df, x, c("cases"))
    tbl2$cases <- as.numeric(cases2$cases)
    tbl4 <- tbl2
    colnames(tbl4) <- c("district", "cases")
    nuwaraeliyarow <- which(tbl4$district == "Nuwara")
    tbl4$district[nuwaraeliyarow] <- "NuwaraEliya"
    tbl4$cases <- as.numeric(tbl4$cases)
    tbl4$district <- as.character(tbl4$district)
    } else {
      tbl2 <- tbl |>
        dplyr::select(1)   # Select the first column
      colnames(tbl2) <- "x"
      df <- as.vector(tbl2$x)[[1]]
      tbl3 <- tibble::tibble(x=df)

      tbl4 <- tidyr::separate(tbl3, x, c("District", "Cases1", "Cases2"))
      # replace missing value in cases1 from cases 2
      nuwaraeliyarow <- which(tbl4$District == "Nuwara")
      tbl4$District[nuwaraeliyarow] <- "NuwaraEliya"
      tbl4$Cases1[nuwaraeliyarow] <- as.numeric(tbl4$Cases2[nuwaraeliyarow])
      tbl4 <- tbl4 |> dplyr::select(1:2)
      colnames(tbl4) <- c("district", "cases")
      tbl4$cases <- as.numeric(tbl4$cases)
      tbl4$district <- as.character(tbl4$district)
   }
    tbl4
  }
  
  #reports.url <- unlist(reports.url)
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
#'link <- "https://www.epid.gov.lk/storage/post/pdfs/en_65fc47cc869e2_Vol_51_no_09-english.pdf"
#'data2024_8 <- convert_slwer_to_tidy(year=2024, 
#'                                    reports.url=link2024[[9]][1], 
#'                                    start.date.first = "2024-02-17",
#'                                    end.date.first = "2024-02-23",
#'                                    start.date.last = "2024-02-17", 
#'                                    end.date.last = "2024-02-23",
#'                                    week.no=c(8))
#'View(data2024_8)
