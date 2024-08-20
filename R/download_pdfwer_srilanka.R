#' Download and save weekly epidemiological reports from Epidemiology Unit, Ministry of Health, Sri Lanka (url https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report)
#'
#' @param url url of the webpage that you intend to download files. The default is URL of the weekly epidemiological reports page
#' @param folder.name create a folder with this name and save the pdf file inside this folder
#' @param volume.number Volume number of the epidemiological reports (Volumes corresponds to year)
#' @return Pdf files corresponds to the volume number you specified inside the folder.name
#' @importFrom rvest read_html
#' @importFrom rvest html_nodes
#' @importFrom rvest html_attr
#' @importFrom rvest html_nodes
#' @importFrom stringr str_subset
#' @importFrom utils download.file
#' @importFrom here here
#' @author Thiyanga S Talagala
#' @export
download_pdfwer_srilanka <- function(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report",folder.name , volume.number){
  base_url <- url
  dir.create(folder.name)
  # Read the webpage content
  webpage <- read_html(base_url)
  
  # Extract all the PDF links
  pdf_links <- webpage |>
    html_nodes("a") |>          # Extract all <a> tags
    html_attr("href") |>       # Get href attributes
    str_subset("\\.pdf$")        # Keep only those that link to PDFs
  
  # Filter to keep only PDFs from the specified volume number
  volume_links <- pdf_links[grepl(volume.number, pdf_links)]
  
  
  # Download the PDFs
  for (link in volume_links) {
    pdf_name <- basename(link)
    download.file(link, destfile = here(folder.name, pdf_name), mode = "wb")
    message(paste("Downloaded:", pdf_name))
  }
}
#'@examples
#'download_pdfwer_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", folder.name="dengue", volume.number="Vol_51")

