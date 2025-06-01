#####
## 01 June 2025
library(denguedatahub)
link2025 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_52")
length(link2025)#16
link2025[[1]][1] ## No 1 WER
link2025[[11]][1] ## No 11 WER
link2025.part1 <- link2025[1:11]
data2025.part1 <- convert_slwer_to_tidy(year=2025, 
                                        reports.url=link2025.part1, 
                                        start.date.first = "2024-12-21",
                                        end.date.first = "2024-12-27",
                                        start.date.last = "2025-03-01", 
                                        end.date.last = "2025-03-07",
                                        week.no=c(1:11))
View(data2025.part1)
library(here)
library(readr)
write_csv(data2025.part1, file=here("data-raw",
                                    "sl",
                                    "data2025.part1.csv"))
data2025.part1$district <- dplyr::recode(data2025.part1$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2025.part1$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2025.part1$year <- as.numeric(data2025.part1$year)
data2025.part1$week <- as.numeric(data2025.part1$week)
data2025.part1$start.date <- as.Date(data2025.part1$start.date)
data2025.part1$end.date <- as.Date(data2025.part1$end.date)
data2025.part1$district <- as.character(data2025.part1$district)
data2025.part1$cases <- as.numeric(data2025.part1$cases)

### June 1, 2025
link2025[[12]][1] ## No 12 WER
link2025[[16]][1] ## No 16 WER
link2025.part2 <- link2025[12:16]
data2025.part2 <- convert_slwer_to_tidy(year=2025, 
                                        reports.url=link2025.part1, 
                                        start.date.first = "2024-12-21",
                                        end.date.first = "2024-12-27",
                                        start.date.last = "2025-03-01", 
                                        end.date.last = "2025-03-07",
                                        week.no=c(1:11))
View(data2025.part1)
library(here)
library(readr)
write_csv(data2025.part1, file=here("data-raw",
                                    "sl",
                                    "data2025.part1.csv"))
data2025.part1$district <- dplyr::recode(data2025.part1$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2025.part1$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2025.part1$year <- as.numeric(data2025.part1$year)
data2025.part1$week <- as.numeric(data2025.part1$week)
data2025.part1$start.date <- as.Date(data2025.part1$start.date)
data2025.part1$end.date <- as.Date(data2025.part1$end.date)
data2025.part1$district <- as.character(data2025.part1$district)
data2025.part1$cases <- as.numeric(data2025.part1$cases)

data("srilanka_weekly_data")
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2025.part1)
View(srilanka_weekly_data)
usethis::use_data(srilanka_weekly_data, overwrite = TRUE)

