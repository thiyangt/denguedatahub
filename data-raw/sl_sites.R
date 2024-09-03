## 2024 Sep 3
library(readr)
sl_sites <- read_csv("data-raw/sl_sites.csv")
View(sl_sites)
usethis::use_data(sl_sites, overwrite = TRUE)






