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
