# 2024 Aug 20

library(rlang)
library(denguedatahub)
library(purrr)
library(here)
library(dplyr)
library(data.table)
library(rvest)
library(stringr)
library(lubridate)

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
summary(data2024)
library(here)
save(data2024, file=here("data-raw","sl" ,"data2024.rda"))


## Sep 14, 2024
#load("~/denguedatahub/data-raw/sl/data2024.rda")
#library(readr)
#library(here)
#write_csv(data2024, file=here("data-raw",
                              "sl",
                              "data2024.csv"))

## 8
#data2024_8 <- convert_slwer_to_tidy(year=2024, 
#                                  reports.url=link2024[[9]][1], 
#                                  start.date.first = "2024-02-17",
#                                  end.date.first = "2024-02-23",
#                                  start.date.last = "2024-02-17", 
#                                  end.date.last = "2024-02-23",
#                                  week.no=c(8))
#View(data2024_8)


## Feb 13, 2025
library(denguedatahub)
link2024 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_51")
length(link2024)#50
link2024[[33]][1] ## No 33 WER
link2024[[50]][1] ## No 50 WER
link2024.part2 <- link2024[33:50]
data2024.part2 <- convert_slwer_to_tidy(year=2024, 
                                  reports.url=link2024.part2, 
                                  start.date.first = "2024-08-03",
                                  end.date.first = "2024-08-09",
                                  start.date.last = "2024-11-30", 
                                  end.date.last = "2024-12-06",
                                  week.no=c(32:49))
View(data2024.part2)
library(here)
library(readr)
write_csv(data2024.part2, file=here("data-raw",
                              "sl",
                              "data2024.part2.csv"))
data2024.part2$district <- dplyr::recode(data2024.part2$district, 
                                   Hambantota = "Hambanthota")
bb <- unique(data2024.part2$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2024.part2$year <- as.numeric(data2024.part2$year)
data2024.part2$week <- as.numeric(data2024.part2$week)
data2024.part2$start.date <- as.Date(data2024.part2$start.date)
data2024.part2$end.date <- as.Date(data2024.part2$end.date)
data2024.part2$district <- as.character(data2024.part2$district)
data2024.part2$cases <- as.numeric(data2024.part2$cases)

data("srilanka_weekly_data")
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2024.part2)
View(srilanka_weekly_data)
usethis::use_data(srilanka_weekly_data, overwrite = TRUE)

## 2025 - June - 1--------------------
library(denguedatahub)
link2024 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_51")
length(link2024)#52
link2024[[51]][1] ## No 51 WER
link2024[[52]][1] ## No 52 WER
link2024.part3 <- link2024[51:52]
data2024.part3 <- convert_slwer_to_tidy(year=2024, 
                                        reports.url=link2024.part3, 
                                        start.date.first = "2024-12-07",
                                        end.date.first = "2024-12-13",
                                        start.date.last = "2024-12-14", 
                                        end.date.last = "2024-12-20",
                                        week.no=c(51:52))
View(data2024.part3)
library(here)
library(readr)
write_csv(data2024.part3, file=here("data-raw",
                                    "sl",
                                    "data2024.part3.csv"))
data2024.part3$district <- dplyr::recode(data2024.part3$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2024.part3$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2024.part3$year <- as.numeric(data2024.part3$year)
data2024.part3$week <- as.numeric(data2024.part3$week)
data2024.part3$start.date <- as.Date(data2024.part3$start.date)
data2024.part3$end.date <- as.Date(data2024.part3$end.date)
data2024.part3$district <- as.character(data2024.part3$district)
data2024.part3$cases <- as.numeric(data2024.part3$cases)

data("srilanka_weekly_data")
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2024.part3)


View(srilanka_weekly_data)
usethis::use_data(srilanka_weekly_data, overwrite = TRUE)




### 2024 data: read all again due to the gaps in data
library(denguedatahub)
link2024 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_51")
length(link2024)#52
link2024[[1]][1] ## No 1 WER
link2024[[52]][1] ## No 50 WER
link2024.all <- link2024[1:52]
data2024.all <- convert_slwer_to_tidy(year=2024, 
                                        reports.url=link2024.all, 
                                        start.date.first = "2023-12-23",
                                        end.date.first = "2023-12-29",
                                        start.date.last = "2024-12-14", 
                                        end.date.last = "2024-12-20",
                                        week.no=c(1:52))





View(data2024.all)
table(data2024.all$district)
library(here)
library(readr)
write_csv(data2024.all, file=here("data-raw",
                                    "sl",
                                    "data2024.all.csv"))
library(denguedatahub)
library(tidyverse)
library(here)
data2024.all <- read_csv(here("data-raw",
                              "sl",
                              "data2024.all.csv"))
data("srilanka_weekly_data")
data2024.all$district <- dplyr::recode(data2024.all$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2024.all$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2024.all$year <- as.numeric(data2024.all$year)
data2024.all$week <- as.numeric(data2024.all$week)
data2024.all$start.date <- as.Date(data2024.all$start.date)
data2024.all$end.date <- as.Date(data2024.all$end.date)
data2024.all$district <- as.character(data2024.all$district)
data2024.all$cases <- as.numeric(data2024.all$cases)

data("srilanka_weekly_data")
#srilanka_weekly_data$start.date <- as.Date(srilanka_weekly_data$start.date)
#srilanka_weekly_data$end.date <- as.Date(srilanka_weekly_data$end.date)

srilanka_weekly_data <- srilanka_weekly_data |> filter(year!=2024)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2024.all)
View(srilanka_weekly_data)
tail(srilanka_weekly_data)
usethis::use_data(srilanka_weekly_data, overwrite = TRUE)
##
#filling gaps manually
#data("srilanka_weekly_data")
#readr::write_csv(srilanka_weekly_data, here::here("data-raw", "srilanka_weekly_data.csv"))


## -------------------
##
## Update manual edit
##
##----------------------
#srilanka_weekly_data <- read_csv(here::here("data-raw", "srilanka_weekly_data.csv"))
#View(srilanka_weekly_data)
#usethis::use_data(srilanka_weekly_data, overwrite = TRUE)
