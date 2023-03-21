library(denguedatahub)
library(purrr)
library(here)

# 2020
link2020 <- ""
ad.list2020 <- get_addresses(url2020)
link2020 <- filter_year_wer(2020, ad.list2020)
length(link2020) #52
data2020 <- convert_srilanka_wer_to_tidy(year=2020, url.part2=link2020, 
                                         start.date.first = "2022-01-01",
                                         end.date.first = "2022-01-07",
                                         start.date.last = "2022-12-24", 
                                         end.date.last = "2022-12-30",
                                         week.no=c(53, 1:51))
data2020


# 2021
link2021 <- ""
ad.list2021 <- get_addresses(url2021)
link2021 <- filter_year_wer(2021, ad.list2021)
length(link2021) #
data2021 <- convert_srilanka_wer_to_tidy(year=2021, url.part2=link2021, 
                                         start.date.first = "2022-01-01",
                                         end.date.first = "2022-01-07",
                                         start.date.last = "2022-12-24", 
                                         end.date.last = "2022-12-30",
                                         week.no=c(53, 1:51))
data2022



# 2022
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
data2022

# 2023
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
