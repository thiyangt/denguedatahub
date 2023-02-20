# china
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8997546/table/ijerph-19-03910-t001/?report=objectonly

library(readr)
library(here)
china <- read_csv(here("data-raw", "china.csv"))
#View(china)
china$year <- as.integer(china$year)
head(china)
save(china, file=here("data", "china.rda"))
