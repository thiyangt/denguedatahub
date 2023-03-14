# Source: https://www3.paho.org/data/index.php/en/mnu-topics/indicadores-dengue-en/dengue-nacional-en/252-dengue-pais-ano-en.html
# Last accesses: 30 January 2023

## reading general r codes
library(here)
source(here("data-raw", "1_general_codes.R"))


### Dengue and severe dengue cases and deaths for subregions of the Americas
url <- "https://www3.paho.org/data/index.php/en/mnu-topics/indicadores-dengue-en/dengue-regional-en/261-dengue-reg-ano-en.html"

## Download the data from the following location
#https://phip.paho.org/vizql/w/PLISAREGCasosymortalidadpordengue_tben/v/Summary/viewData/sessions/9E245C4B6C3041C4AA9295713550B302-1:0/views/2676828700685879255_618587353040163851?maxrows=200&viz=%7B%22worksheet%22%3A%22W_Resumen%22%2C%22dashboard%22%3A%22Summary%22%7D
# downloaded file 
# data-raw -> W_Resumen_data.csv

library(tidyverse)
library(here)
americas_annual_data <- read_csv(here("data-raw", "americas.csv"))
View(americas_annual_data)


colnames_americas_annual_data <- colnames(americas_annual_data)
colnamedf <- data.frame(name=colnames_americas_annual_data)
colnamedf <- colnamedf %>% separate(name, "year")

america_data_year <- americas_annual_data[3:54, ]
view(america_data_year)
dim(america_data_year) # 52 222
colnames(america_data_year) <- c("Region", "Country", colnamedf$year[-c(1, 2)])
view(america_data_year)
dim(america_data_year)
america_data_year_long <- america_data_year %>%
  pivot_longer(!c("Region", "Country"), names_to = "year", values_to = "count")
view(america_data_year_long)

america_data_type <- americas_annual_data[3:54, ]
view(america_data_type)
dim(america_data_type) # 52 222
colnames(america_data_type) <- americas_annual_data[1, ]
view(america_data_type)
dim(america_data_type)
america_data_type_long <- america_data_type %>%
  pivot_longer(!c("Region", "Country"), names_to = "type", values_to = "count")
view(america_data_type_long)

americas_annual_data <- left_join(america_data_type_long, america_data_year_long)
view(americas_annual_data)
save(americas_annual_data, file=here("data", "americas_annual_data.rda"))

americas_annual_data.rda <- load(here("data", "americas_annual_data.rda"))
colnames(americas_annual_data)
americas_annual_data <- americas_annual_data %>%
  rename(c(region = Region,
           country = Country,
           cases = count))
save(americas_annual_data, file=here("data", "americas_annual_data.rda"))

usethis::use_data(americas_annual_data, overwrite = TRUE)
