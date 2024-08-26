#' Get URLs of weekly epidemiological reports from Epidemiology Unit, Ministry of Health, Sri Lanka (url https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report)
#'
#' @param url url of the webpage that you intend to download files. The default is URL of the weekly epidemiological reports page
#' @param volume.number Volume number of the epidemiological reports (Volumes corresponds to year)
#' @return URLS of PDF files corresponds to the volume number
#' @importFrom rvest read_html
#' @importFrom rvest html_nodes
#' @importFrom rvest html_attr
#' @importFrom rvest html_nodes
#' @importFrom stringr str_subset
#' @author Thiyanga S Talagala
#' @export
get_pdflinks_srilanka <- function(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report",volume.number){
  base_url <- url
  # Read the webpage content
  webpage <- read_html(base_url)
  
  # Extract all the PDF links
  pdf_links <- webpage |>
    html_nodes("a") |>          # Extract all <a> tags
    html_attr("href") |>       # Get href attributes
    str_subset("\\.pdf$")        # Keep only those that link to PDFs
  
  # Filter to keep only PDFs from the specified volume number
  volume_links <- pdf_links[grepl(volume.number, pdf_links)]
  rev(volume_links)
}
#'@examples
#'get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_51")

