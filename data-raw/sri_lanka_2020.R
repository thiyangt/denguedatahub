# 2024 Aug 31
## 2022: Volume 50

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
##Step 1:  Get PDF links corresponds to 2020
library(denguedatahub)
link2020 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="vol_47")
length(link2020) # 52
link2020[[2]][1] ## No 1 WER
link2020[[52]][1] ## No 52 WER
link2020 <- link2020[-1]
length(link2020) #51
link2020[[1]][1]
data2020 <- convert_slwer_to_tidy(year=2020, 
                                         reports.url=link2020, 
                                         start.date.first = "2019-12-28",
                                         end.date.first = "2020-01-03",
                                         start.date.last = "2020-12-12", 
                                         end.date.last = "2020-12-18",
                                         week.no=c(53, 1:51))
View(data2020)
library(here)
save(data2020, file=here("data-raw","sl" ,"data2020.rda"))
