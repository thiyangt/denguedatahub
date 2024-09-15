# 2024 Aug 31
## 2024 Sep 14
## 2023: Volume 50

library(rlang)
library(denguedatahub)
library(purrr)
library(here)
library(dplyr)
library(data.table)
library(rvest)
library(stringr)

download_pdfwer_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", folder.name="dengue2023", volume.number="Vol_50")

## Extract tidydata from PDF
##Step 1:  Get PDF links corresponds to 2023
library(denguedatahub)
link2023 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_50")
length(link2023) # 52
link2023[[1]][1] ## No 1 WER
link2023[[52]][1] ## No 52 WER
data2023 <- convert_slwer_to_tidy(year=2023, 
                                         reports.url=link2023, 
                                         start.date.first = "2022-12-24",
                                         end.date.first = "2022-12-30",
                                         start.date.last = "2023-12-16", 
                                         end.date.last = "2023-12-22",
                                         week.no=c(52, 1:51))
View(data2023)
library(here)
library(readr)
save(data2023, file=here("data-raw","sl" ,"data2023.rda"))
write_csv(data2023, file=here("data-raw", "sl", "data2023old.csv"))
## After that I manually fill missing values (2024 Sep 15)
library(readr)
data2023 <- read_csv("data-raw/sl/data2023.csv")
View(data2023)
save(data2023, file=here("data-raw","sl" ,"data2023.rda"))
