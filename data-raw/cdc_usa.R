# https://data.cdc.gov/browse.php?federation_filter=85&format=php&sortBy=alpha&tags=dengue
library(here)
library(tidyverse)
library(readr)
y2022 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue.csv")
y2021 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue (1).csv")
y2020 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue (2).csv")
y2019 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue (3).csv")

cdc_usa <- bind_rows(y2019, y2020)
cdc_usa <- bind_rows(cdc_usa, y2021)
cdc_usa <- bind_rows(cdc_usa, y2022)

columns_to_remove <- grep("flag", names(cdc_usa))
cdc_usa <- cdc_usa[,-columns_to_remove]
View(cdc_usa)
colnames(cdc_usa)
