# 2024 Aug 31
load("~/denguedatahub/data-raw/sl_version1/data2020.rda")
View(data2020)
data2020 <- filter(data2020, week !=52)
View(data2020)
## Week 1 -> 53 (Note: THere is an error in
## Epidemiology website. There is no report corresponds to 
## week 1, instead it named as 53. Instead we name it as week 1)
## Correction made in sri_lanka_using_denguedatahub_pkg