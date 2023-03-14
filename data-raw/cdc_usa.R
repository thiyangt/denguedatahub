# https://data.cdc.gov/browse.php?federation_filter=85&format=php&sortBy=alpha&tags=dengue
rm(list=ls())
library(here)
library(tidyverse)
library(readr)
y2022 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue.csv")
y2021 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue (1).csv")
y2020 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue (2).csv")
y2019 <- read_csv("data-raw/cdc/NNDSS_-_TABLE_1J._Dengue_virus_infections__Dengue_to_Severe_dengue (3).csv")



select_var <- c("Reporting Area", "MMWR Year","MMWR Week", "Dengue virus infections, Dengue, Current week", "Dengue virus infections, Dengue-like illness, Current week", "Dengue virus infections, Severe dengue, Current week")


y2022new <- y2022 %>% select(all_of(select_var))
y2021new <- y2021 %>% select(all_of(select_var))
y2020new <- y2020 %>% select(all_of(select_var))

select_var2 <- c("Reporting Area", "MMWR Year","MMWR Week", "Dengue virus infections§ , Dengue, Current week", "Dengue virus infections§ s, Dengue-like illness, Current week", "Dengue virus infections§ , Severe dengue, Current week")

y2019new <- y2019 %>% select(all_of(select_var2))

y2019new <- y2019new %>%
  rename(c("Dengue virus infections, Dengue, Current week" = "Dengue virus infections§ , Dengue, Current week", 
  "Dengue virus infections, Dengue-like illness, Current week" = "Dengue virus infections§ s, Dengue-like illness, Current week", 
  "Dengue virus infections, Severe dengue, Current week" = "Dengue virus infections§ , Severe dengue, Current week"))


cdc_usa <- bind_rows(y2022new, y2021new)
cdc_usa <- bind_rows(cdc_usa, y2020new)
cdc_usa <- bind_rows(cdc_usa, y2019new)

cdc_usa <- cdc_usa %>%
  filter(`Reporting Area` != "TOTAL")

cdc_usa <- cdc_usa %>%
  rename(c(area = `Reporting Area`,
  year = `MMWR Year`,
  week = `MMWR Week`,
  dengue_cases = `Dengue virus infections, Dengue, Current week`,
  dengue_like_illness = `Dengue virus infections, Dengue-like illness, Current week`,
  severe_dengue = `Dengue virus infections, Severe dengue, Current week`))

view(cdc_usa)
cdc_usa_dengue_infection <- cdc_usa
view(cdc_usa_dengue_infection)
save(cdc_usa_dengue_infection, 
     file=here("data", 
               "cdc_usa_dengue_infection.rda"))

