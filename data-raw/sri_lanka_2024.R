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
