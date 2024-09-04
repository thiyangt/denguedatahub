# Sep 4, 2024

library(readr)
sl_annual <- read_csv("data-raw/sl_annual.csv")
View(sl_annual)
usethis::use_data(sl_annual, overwrite = TRUE)
