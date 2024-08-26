# 2024 Aug 20

library(rlang)
library(denguedatahub)
library(purrr)
library(here)
library(dplyr)
library(data.table)
library(rvest)
library(stringr)


# The URL of the weekly epidemiological reports page
base_url <- "https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report"

# Read the webpage content
webpage <- read_html(base_url)

# Extract all the PDF links
pdf_links <- webpage |>
  html_nodes("a") |>     # Extract all <a> tags
  html_attr("href") |>   # Get href attributes
  str_subset("\\.pdf$")    # Keep only those that link to PDFs

# Filter to keep only 2024 reports (based on a pattern in the URL or link name)
# Filter to keep only PDFs from Volume 51
vol_51_links <- pdf_links[grepl("Vol_51", pdf_links)]

# Download the PDFs
for (link in vol_51_links) {
  pdf_name <- basename(link)
  download.file(link, destfile = pdf_name, mode = "wb")
  message(paste("Downloaded:", pdf_name))
}

## Extract tidydata from PDF
##Step 1:  Get PDF links corresponds to 2024
library(denguedatahub)
link2024 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_51")
data2024 <- convert_srilanka_wer_to_tidy(year=2024, url.part2=link2024, 
                                         start.date.first = "2023-12-23",
                                         end.date.first = "2023-12-29",
                                         start.date.last = "2024-06-15", 
                                         end.date.last = "2024-06-21",
                                         week.no=c(52, 1:25))
