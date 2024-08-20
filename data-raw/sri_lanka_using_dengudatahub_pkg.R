# Note 2024 (get_addresses is now not available in the current version)

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
