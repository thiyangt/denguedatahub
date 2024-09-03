# Note 2024 (get_addresses is now not available in the current version)
# Following code is written older version of denguedatahub (Most of
# these functions are deprecated now as at of 2024 Aug 20)
library(rlang)
library(denguedatahub)
library(purrr)
library(here)
library(dplyr)
library(data.table)

# 2020 done
link2020 <- "https://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en"
ad.list2020 <- denguedatahub::get_addresses(link2020)
link2020 <- filter_year_wer(2020, ad.list2020)
length(link2020) #52
data2020 <- convert_srilanka_wer_to_tidy(year=2020, url.part2=link2020, 
                                         start.date.first = "2019-12-21",
                                         end.date.first = "2019-12-27",
                                         start.date.last = "2020-12-12", 
                                         end.date.last = "2020-12-18",
                                         week.no=c(52, 1:51))
View(data2020)
save(data2020, file=here("data-raw", "sl", "data2020.rda"))

#url.part1="https://www.epid.gov.lk"
#url.part2 = link2020[1]
# run function - part 1
#url <- reports.url[[1]][1]
#tbl <- tibble::tibble(x =table2[1][[1]][4:29, 1], y =table2[1][[1]][4:29, 2])

# 2021- done
link2021 <- "https://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en"
ad.list2021 <- get_addresses(link2021)
link2021 <- filter_year_wer(2021, ad.list2021)
length(link2021) # 53
data2021 <- convert_srilanka_wer_to_tidy(year=2021, url.part2=link2021, 
                                         start.date.first = "2020-12-19",
                                         end.date.first = "2020-12-25",
                                         start.date.last = "2021-12-18", 
                                         end.date.last = "2021-12-24",
                                         week.no=c(52, 1:52))

#year=2021
#url.part2=link2021
#start.date.first = "2020-12-19"
#end.date.first = "2020-12-25"
#start.date.last = "2021-12-18"
#end.date.last = "2021-12-24"
#week.no=c(52, 1:52)
#url.part1="https://www.epid.gov.lk"

# run the function body lines by lines

View(data2021)
summary(data2021)
save(data2021, file=here("data-raw", "sl", "data2021.rda"))



# 2022 - use function
url2022 <- "https://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en"
ad.list2022 <- get_addresses(url2022)
link2022 <- filter_year_wer(2022, ad.list2022)
length(link2022) #52
data2022 <- convert_srilanka_wer_to_tidy(year=2022, url.part2=link2022, 
                                         start.date.first = "2022-01-01",
                                         end.date.first = "2022-01-07",
                                         start.date.last = "2022-12-24", 
                                         end.date.last = "2022-12-30",
                                         week.no=c(53, 1:51))
View(data2022)
save(data2022, file=here("data-raw", "sl", "data2022.rda"))

# 2023 - use function
ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
ad.list
link2023 <- filter_year_wer(2023, ad.list)
data2023 <- convert_srilanka_wer_to_tidy(year=2023, url.part2=link2023, 
start.date.first = "2022-12-31",
end.date.first = "2023-01-06",
start.date.last = "2023-02-25", 
end.date.last = "2023-03-03",
week.no=c(52, 1:8))

save(data2023, file=here("data-raw", "sl", "data2023.rda"))


## Merging data
load("~/packages/denguedatahub/data/srilanka_weekly_data.rda")
load(here("data-raw", "sl", "data2020.rda"))
load(here("data-raw", "sl", "data2021.rda"))
load(here("data-raw", "sl", "data2022.rda"))
load(here("data-raw", "sl", "data2023.rda"))

srilanka_weekly_data <- srilanka_weekly_data[1:17654,]
srilanka_weekly_data$year <- as.numeric(srilanka_weekly_data$year)
srilanka_weekly_data$week <- as.numeric(srilanka_weekly_data$week)
srilanka_weekly_data$start.date <- as.Date(srilanka_weekly_data$start.date)
srilanka_weekly_data$end.date <- as.Date(srilanka_weekly_data$end.date)
srilanka_weekly_data$district <- as.character(srilanka_weekly_data$district)
srilanka_weekly_data$cases <- as.numeric(srilanka_weekly_data$cases)



srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, data2020)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, data2021)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, data2022)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, data2023)
View(srilanka_weekly_data)
save(srilanka_weekly_data, file=here("data", "srilanka_weekly_data.rda"))

load(here::here("data", "srilanka_weekly_data.rda"))

srilanka_weekly_data$district <- dplyr::recode(srilanka_weekly_data$district, 
                                        Anuradhapur = "Anuradhapura",
                                        Kurunagala = "Kurunegala")

save(srilanka_weekly_data, file=here("data", "srilanka_weekly_data.rda"))

# 4 April 2023

load(here::here("data", "srilanka_weekly_data.rda"))
srilanka_weekly_data$district <- dplyr::recode(srilanka_weekly_data$district, 
                                               Hambantota = "Hambanthota")

save(srilanka_weekly_data, file=here("data", "srilanka_weekly_data.rda"))

# 5 June 2023

data("srilanka_weekly_data")
srilanka_weekly_data <- srilanka_weekly_data[-(17655:17680),]
save(srilanka_weekly_data, file=here::here("data", "srilanka_weekly_data.rda"))


# 31 August 2024
library(tidyverse)
## Working on 2020 data
## Remove week 52 year==2020 data


## Working on 2021 data
## No errors

## Working on 2022 data
## No errors

## Working on 2023 data
data("srilanka_weekly_data")
dim(srilanka_weekly_data)
View(srilanka_weekly_data)
dim(srilanka_weekly_data) #21934     6
srilanka_weekly_data <- srilanka_weekly_data |>
  filter(year != 2023)
dim(srilanka_weekly_data) # 21700     6
unique(data2023$district)
a <- unique(data2023$district) == unique(srilanka_weekly_data$district)
table(a)
unique(data2023$district)[8]
unique(srilanka_weekly_data$district)[8]
data2023$district <- dplyr::recode(data2023$district, 
                                               Hambantota = "Hambanthota")
a <- unique(data2023$district) == unique(srilanka_weekly_data$district)
table(a)
data2023$year <- as.numeric(data2023$year)
data2023$week <- as.numeric(data2023$week)
data2023$start.date <- as.Date(data2023$start.date)
data2023$end.date <- as.Date(data2023$end.date)
data2023$district <- as.character(data2023$district)
data2023$cases <- as.numeric(data2023$cases)

## Working on 2024 data
b <- unique(data2024$district) == unique(srilanka_weekly_data$district)
table(b)
unique(data2024$district)[8]
unique(srilanka_weekly_data$district)[8]
data2024$district <- dplyr::recode(data2024$district, 
                                   Hambantota = "Hambanthota")
bb <- unique(data2024$district) == unique(srilanka_weekly_data$district)
table(bb)
data2024$year <- as.numeric(data2024$year)
data2024week <- as.numeric(data2024$week)
data2024$start.date <- as.Date(data2024$start.date)
data2024$end.date <- as.Date(data2024$end.date)
data2024$district <- as.character(data2024$district)
data2024$cases <- as.numeric(data2024$cases)

## Merge 2023 and 2024 data
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, data2023)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, data2024)
dim(srilanka_weekly_data) #23805     6
table(srilanka_weekly_data$year)

## Checking issues

y2018<- srilanka_weekly_data |> filter(year == 2018)
View(y2018)
unique(y2018$week)

y2019 <- srilanka_weekly_data |> filter(year == 2019)
View(y2019)
unique(y2019$week)


y2020 <- srilanka_weekly_data |> filter(year == 2020)
View(y2020)
unique(y2020$week)

y2021 <- srilanka_weekly_data |> filter(year == 2021)
View(y2021)
unique(y2021$week)


y2022 <- srilanka_weekly_data |> filter(year == 2022)
View(y2022)
unique(y2022$week)


## Correcting the data error since 2020
## September 3
## Packages
library(tidyverse)
library(here)
## Filter data upto 2019
load("~/denguedatahub/data/srilanka_weekly_data.rda")
srilanka_weekly_data <- srilanka_weekly_data |>
  filter(year < 2020)
View(srilanka_weekly_data)

## Year2020
#load("~/denguedatahub/data-raw/sl_version1/data2020.rda")
#View(data2020)
#data2020 <- data2020 |>
#  filter(start.date != "2019-12-21")
#View(data2020)

write.csv(data2020, here("data-raw", "sl", "data2020.csv"))
## After this I manually enter missing kegalle and kalmune values
data2020 <- read_csv(here("data-raw", "sl", "data2020.csv"))
View(data2020)
data2020 <- data2020 |> select(-1)
View(data2020)
data2020$year <- as.numeric(data2020$year)
data2020$week <- as.numeric(data2020$week)
data2020$start.date <- as.Date(data2020$start.date)
data2020$end.date <- as.Date(data2020$end.date)
data2020$district <- as.character(data2020$district)
data2020$cases <- as.numeric(data2020$cases)
colnames(data2020)

load("~/denguedatahub/data-raw/sl_version1/data2021.rda")
View(data2021)
week52.2020 <- data2021 |>
  filter(start.date == "2020-12-19")
length(week52.2020$year)
week52.2020$year <- rep(2020, 26)
View(week52.2020)
colnames(week52.2020)
week52.2020$year <- as.numeric(week52.2020$year)
week52.2020$week <- as.numeric(week52.2020$week)
week52.2020$start.date <- as.Date(week52.2020$start.date)
week52.2020$end.date <- as.Date(week52.2020$end.date)
week52.2020$district <- as.character(week52.2020$district)
week52.2020$cases <- as.numeric(week52.2020$cases)
data2020 <- dplyr::bind_rows(data2020, week52.2020)
save(data2020, file=here("data-raw", "sl", "data2020.rda"))

## Year2021
data2021 <- data2021 |>
  filter(start.date != "2020-12-19")
View(data2021)
dim(data2021)
load("~/denguedatahub/data-raw/sl_version1/data2022.rda")
View(data2022)
week53.2021 <- data2022 |>
  filter(week == 53)
dim(week53.2021) # 26 6
week53.2021$start.date <- as.Date(rep("2021-12-25", 26))
week53.2021$end.date <- as.Date(rep("2021-12-31", 26))
week53.2021$year <- rep(2021, 26)
week53.2021$year <- as.numeric(week53.2021$year)
week53.2021$week <- as.numeric(week53.2021$week)
week53.2021$start.date <- as.Date(week53.2021$start.date)
week53.2021$end.date <- as.Date(week53.2021$end.date)
week53.2021$district <- as.character(week53.2021$district)
week53.2021$cases <- as.numeric(week53.2021$cases)
View(week53.2021)

data2021 <- dplyr::bind_rows(data2021, week53.2021)
View(data2021)
save(data2021, file=here("data-raw", "sl", "data2021.rda"))


## Year 2022
load("~/denguedatahub/data-raw/sl_version1/data2022.rda")
View(data2022)
sd <- data2022$start.date
length(sd) # 1352
ed <- data2022$end.date
length(ed) #  1352
data2022 <- data2022 |>
  filter(week != 53)
dim(data2022) #1326  6
data2022$start.date <- as.Date(sd[1:1326])
data2022$end.date <- as.Date(ed[1:1326])
View(data2022)

data2022$year <- as.numeric(data2022$year)
data2022$week <- as.numeric(data2022$week)
data2022$start.date <- as.Date(data2022$start.date)
data2022$end.date <- as.Date(data2022$end.date)
data2022$district <- as.character(data2022$district)
data2022$cases <- as.numeric(data2022$cases)

load("~/denguedatahub/data-raw/sl_version1/data2023.rda")
View(data2023)
week52.2022 <- data2023 |>
  filter(start.date == "2022-12-24")
View(week52.2022)
week52.2022$year <- rep(2022, 26)
week52.2022$year <- as.numeric(week52.2022$year)
View(week52.2022)

week52.2022$year <- as.numeric(week52.2022$year)
week52.2022$week <- as.numeric(week52.2022$week)
week52.2022$start.date <- as.Date(week52.2022$start.date)
week52.2022$end.date <- as.Date(week52.2022$end.date)
week52.2022$district <- as.character(week52.2022$district)
week52.2022$cases <- as.numeric(week52.2022$cases)


data2022 <- dplyr::bind_rows(data2022, week52.2022)
View(data2022)
save(data2022, file=here("data-raw", "sl", "data2022.rda"))


## Year 2023
load("~/denguedatahub/data-raw/sl_version1/data2023.rda")
View(data2023)
data2023 <- data2023 |>
  filter(start.date != "2022-12-24")
View(data2023)
dim(data2023) #1326  6
load("~/denguedatahub/data-raw/sl_version1/data2024.rda")
week52.2023 <- data2024 |>
  filter(start.date == "2023-12-23")
week52.2023$year <- rep(2023, 26)
week52.2023$year <- as.numeric(week52.2023$year)
week52.2023$week <- as.numeric(week52.2023$week)
week52.2023$start.date <- as.Date(week52.2023$start.date)
week52.2023$end.date <- as.Date(week52.2023$end.date)
week52.2023$district <- as.character(week52.2023$district)
week52.2023$cases <- as.numeric(week52.2023$cases)

data2023$year <- as.numeric(data2023$year)
data2023$week <- as.numeric(data2023$week)
data2023$start.date <- as.Date(data2023$start.date)
data2023$end.date <- as.Date(data2023$end.date)
data2023$district <- as.character(data2023$district)
data2023$cases <- as.numeric(data2023$cases)


data2023 <- dplyr::bind_rows(data2023, week52.2023)
View(data2023)
dim(data2023) # 1352   6
save(data2023, file=here("data-raw", "sl", "data2023.rda"))


## Year 2024
load("~/denguedatahub/data-raw/sl_version1/data2024.rda")
data2024 <- data2024 |>
  filter(start.date != "2023-12-23")
View(data2024)
save(data2024, file=here("data-raw", "sl", "data2024.rda"))


##
rm(list = ls())
library(tidyverse)
library(here)
load("~/denguedatahub/data/srilanka_weekly_data.rda")
srilanka_weekly_data <- srilanka_weekly_data |>
  filter(year < 2020)
table(srilanka_weekly_data$year)

load("~/denguedatahub/data-raw/sl/data2020.rda")
load("~/denguedatahub/data-raw/sl/data2021.rda")
load("~/denguedatahub/data-raw/sl/data2022.rda")
load("~/denguedatahub/data-raw/sl/data2023.rda")
load("~/denguedatahub/data-raw/sl/data2024.rda")


data2023$district <- dplyr::recode(data2023$district, 
                                   Hambantota = "Hambanthota")
a <- unique(data2023$district) == unique(srilanka_weekly_data$district)
table(a)
data2023$year <- as.numeric(data2023$year)
data2023$week <- as.numeric(data2023$week)
data2023$start.date <- as.Date(data2023$start.date)
data2023$end.date <- as.Date(data2023$end.date)
data2023$district <- as.character(data2023$district)
data2023$cases <- as.numeric(data2023$cases)

data2024$district <- dplyr::recode(data2024$district, 
                                   Hambantota = "Hambanthota")
bb <- unique(data2024$district) == unique(srilanka_weekly_data$district)
table(bb)
data2024$year <- as.numeric(data2024$year)
data2024week <- as.numeric(data2024$week)
data2024$start.date <- as.Date(data2024$start.date)
data2024$end.date <- as.Date(data2024$end.date)
data2024$district <- as.character(data2024$district)
data2024$cases <- as.numeric(data2024$cases)

srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2020)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2021)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2022)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2023)
srilanka_weekly_data <- dplyr::bind_rows(srilanka_weekly_data, 
                                         data2024)
sort(unique(srilanka_weekly_data$district))
srilanka_weekly_data$district <- dplyr::recode(srilanka_weekly_data$district, 
                                               Anuradhapur = "Anuradhapura" )
srilanka_weekly_data$district <- dplyr::recode(srilanka_weekly_data$district, 
                                   Hambantota = "Hambanthota")
sort(unique(srilanka_weekly_data$district))

save(srilanka_weekly_data, file=here("data",  "srilanka_weekly_data.rda"))
table(srilanka_weekly_data$year)
