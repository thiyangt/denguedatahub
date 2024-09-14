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
length(link2024) #32
link2024[[1]][1] ## No 1 WER
link2024[[32]][1] ## No 30 WER
data2024 <- convert_slwer_to_tidy(year=2024, 
                                         reports.url=link2024, 
                                         start.date.first = "2023-12-23",
                                         end.date.first = "2023-12-29",
                                         start.date.last = "2024-07-27", 
                                         end.date.last = "2024-08-02",
                                         week.no=c(52, 1:31))
View(data2024)
library(here)
#save(data2024, file=here("data-raw","sl" ,"data2024.rda"))


## Sep 14, 2024
#load("~/denguedatahub/data-raw/sl/data2024.rda")
#library(readr)
#library(here)
write_csv(data2024, file=here("data-raw",
                              "sl",
                              "data2024.csv"))

## 8
data2024_8 <- convert_slwer_to_tidy(year=2024, 
                                  reports.url=link2024[[9]][1], 
                                  start.date.first = "2024-02-17",
                                  end.date.first = "2024-02-23",
                                  start.date.last = "2024-02-17", 
                                  end.date.last = "2024-02-23",
                                  week.no=c(8))
View(data2024_8)
