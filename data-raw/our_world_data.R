# source: https://ourworldindata.org/grapher/dengue-incidence
# lase accesses: 10 March 2023

library(readr)
library(here)
world_annual <- read_csv(here("data-raw", "dengue-incidence.csv"))
head(world_annual)
dim(world_annual)
colnames(world_annual)
View(world_annual)
colnames(world_annual) <- c("entity", "code", "year", "incidence")
#save(world_annual, file=here("data", "world_annual.rda"))
usethis::use_data(world_annual, overwrite = TRUE)
