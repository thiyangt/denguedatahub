#####
## 2 May 2026
library(denguedatahub)
library(tidyverse)
library(here)
link2025 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_52")
length(link2025)#52
link2025[[12]][1] ## No 12 WER
link2025[[52]][1] ## No 52 WER
link2025.part1 <- link2025[12:52]
data2025.part2 <- convert_slwer_to_tidy(year=2025, 
                                        reports.url=link2025.part1, 
                                        start.date.first = "2025-03-08",
                                        end.date.first = "2025-03-14",
                                        start.date.last = "2025-12-13", 
                                        end.date.last = "2025-12-19",
                                        week.no=c(12:52))
View(data2025.part2)
library(here)
library(readr)
write_csv(data2025.part2, file=here("data-raw",
                                    "sl",
                                    "data2025.part2.csv"))

######
library(denguedatahub)
data("srilanka_weekly_data")
head(srilanka_weekly_data)
tail(srilanka_weekly_data)

data2025.part2 <- read_csv(here("data-raw",
                                "sl",
                                "data2025.part2.csv"))
data2025.part2$district <- dplyr::recode(data2025.part2$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2025.part2$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2025.part2$year <- as.numeric(data2025.part2$year)
data2025.part2$week <- as.numeric(data2025.part2$week)
data2025.part2$start.date <- as.character(data2025.part2$start.date)
data2025.part2$end.date <- as.character(data2025.part2$end.date)
data2025.part2$district <- as.character(data2025.part2$district)
data2025.part2$cases <- as.numeric(data2025.part2$cases)



srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2025.part2)
View(srilanka_weekly_data)
tail(srilanka_weekly_data)
table(srilanka_weekly_data$district)
summary(srilanka_weekly_data$cases)
# Fill missing manually
srilanka_weekly_data <- readr::write_csv(srilanka_weekly_data, file = here::here("data-raw", "srilanka_weekly_data.csv"))

usethis::use_data(srilanka_weekly_data, overwrite = TRUE)

# Manual update
link2025[[15]][1] 
link2025[[16]][1] 
link2025[[17]][1] 
link2025[[45]][1] 
link2025[[46]][1] 
link2025[[47]][1] 
link2025[[48]][1] 



data2025.part2 <- read_csv(here("data-raw",
                                "sl",
                                "data2025.part2.csv"))
data2025.part2$district <- dplyr::recode(data2025.part2$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2025.part2$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2025.part2$year <- as.numeric(data2025.part2$year)
data2025.part2$week <- as.numeric(data2025.part2$week)
data2025.part2$start.date <- as.character(data2025.part2$start.date)
data2025.part2$end.date <- as.character(data2025.part2$end.date)
data2025.part2$district <- as.character(data2025.part2$district)
data2025.part2$cases <- as.numeric(data2025.part2$cases)



srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2025.part2)
View(srilanka_weekly_data)
tail(srilanka_weekly_data)
table(srilanka_weekly_data$district)
summary(srilanka_weekly_data$cases)
# Fill missing manually
srilanka_weekly_data <- readr::write_csv(srilanka_weekly_data, file = here::here("data-raw", "srilanka_weekly_data.csv"))

usethis::use_data(srilanka_weekly_data, overwrite = TRUE)
