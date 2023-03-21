library(denguedatahub)

ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
ad.list

# 2020
link2020 <- filter_year_wer(2020, ad.list[1:9])

# 2021
link2021 <- filter_year_wer(2021, ad.list[1:9])

# 2022
link2022 <- filter_year_wer(2022, ad.list[1:9])

# 2023
link2023 <- filter_year_wer(2023, ad.list[1:9])