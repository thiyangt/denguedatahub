# china
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8997546/table/ijerph-19-03910-t001/?report=objectonly

library(readr)
library(here)
china <- read_csv(here("data-raw", "china.csv"))
#View(china)
china$year <- as.integer(china$year)
head(china)
china_annual_data <- china
save(china_annual_data, file=here("data", "china_annual_data.rda"))
