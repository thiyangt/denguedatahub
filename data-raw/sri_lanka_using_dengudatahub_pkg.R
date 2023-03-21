library(denguedatahub)



# 2020
link2020 <- filter_year_wer(2020, ad.list[1:9])

# 2021
link2021 <- filter_year_wer(2021, ad.list[1:9])

# 2022
url2022 <- "https://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en"
ad.list2022 <- get_addresses(url2022)
link2022 <- filter_year_wer(2022, ad.list2022)
length(link2022) #52

# 2023
ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
ad.list
link2023 <- filter_year_wer(2023, ad.list)
data2023 <- convert_srilanka_wer_to_tidy(year=2023, url.part2=wer2023url, 
start.date.first = "2022-12-31",
end.date.first = "2023-01-06",
start.date.last = "2023-01-28", 
end.date.last = "2023-02-03",
week.no=c(52, 1:4))
data2023