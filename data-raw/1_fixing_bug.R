library(denguedatahub)
library(purrr)
library(here)


link2021 <- "https://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en"
ad.list2021 <- get_addresses(link2021)
link2021 <- filter_year_wer(2021, ad.list2021)
length(link2021) # 53
data2021 <- convert_srilanka_wer_to_tidy(year=2021, url.part2=link2021[53], 
                                         start.date.first = "2022-12-17",
                                         end.date.first = "2022-12-23",
                                         start.date.last = "2022-12-17", 
                                         end.date.last = "2022-12-23",
                                         week.no=c(52))
View(data2021)


year=2021
url.part2=link2021[43] #, #37
start.date.first = "2022-12-17"
end.date.first = "2022-12-23"
start.date.last = "2022-12-17"
end.date.last = "2022-12-23"
week.no=c(52)


## 2023

ad.list2023 <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
ad.list2023
link2023 <- filter_year_wer(2023, ad.list2023)
length(link2023)
url.part2=link2023[1]
url <- reports.url[[1]][1]

## 2021
url.part2=link2021[52]
url <- reports.url[[1]][1]
