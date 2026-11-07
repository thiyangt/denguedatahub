#####
## Nov 2026
library(denguedatahub)
library(tidyverse)
library(here)
link2026 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_53")
length(link2026)#38
#link2026[[1]][1] ## No 1 WER
#link2026[[2]][1] ## No 1 WER
#link2026[[21]][1] ## No 20WER

link2026[[22]][1] ## No 22 WER
link2026[[38]][1] ## No 38 WER


data2026.part2 <- convert_slwer_to_tidy(year=2026, 
                                        reports.url=link2026, 
                                        start.date.first = "2025-05-18",
                                        end.date.first = "2025-05-24",
                                        start.date.last = "2026-09-07", 
                                        end.date.last = "2026-09-13",
                                        week.no=c(21:37))

View(data2026.part2)
tail(data2026.part2)
library(here)
library(readr)
write_csv(data2026.part2, file=here("data-raw",
                                    "sl",
                                    "data2026.part2.csv"))

######
library(denguedatahub)
data("srilanka_weekly_data")
head(srilanka_weekly_data)
tail(srilanka_weekly_data)
View(srilanka_weekly_data)
data2026.part1 <- read_csv(here("data-raw",
                                "sl",
                                "data2026.part1.csv"))
data2026.part1$district <- dplyr::recode(data2026.part1$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2026.part1$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2026.part1$year <- as.numeric(data2026.part1$year)
data2026.part1$week <- as.numeric(data2026.part1$week)
data2026.part1$start.date <- as.character(data2026.part1$start.date)
data2026.part1$end.date <- as.character(data2026.part1$end.date)
data2026.part1$district <- as.character(data2026.part1$district)
data2026.part1$cases <- as.numeric(data2025.part2$cases)
head(data2026.part1)
tail(data2026.part1)

srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2026.part1)
View(srilanka_weekly_data)
tail(srilanka_weekly_data)
table(srilanka_weekly_data$district)
summary(srilanka_weekly_data$cases)
# Fill missing manually
srilanka_weekly_data <- readr::write_csv(srilanka_weekly_data, file = here::here("data-raw", "srilanka_weekly_data.csv"))

usethis::use_data(srilanka_weekly_data, overwrite = TRUE)

