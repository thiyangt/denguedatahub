# source: https://ourworldindata.org/grapher/dengue-incidence
# lase accesses: 20 Feb 2023

library(readr)
library(here)
world.annual <- read_csv(here("data-raw", "dengue-incidence.csv"))
head(world.annual)
dim(world.annual)
colnames(world.annual)
View(world.annual)
colnames(world.annual) <- c("Entity", "Code", "Year", "Incidence")
save(world.annual, file=here("data", "world.annual.rda"))
