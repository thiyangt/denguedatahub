# data source
# https://developers.google.com/public-data/docs/canonical/countries_csv

#----
library(rvest)
library(magrittr)
library(here)

#----
url <- "https://developers.google.com/public-data/docs/canonical/countries_csv"
css_selector <- "#gc-wrapper > main > devsite-content > article > div.devsite-article-body.clearfix"

world_longitude_latitude <- url %>%
  read_html() %>%
  html_element(css=css_selector) %>%
  html_table()

save(world_longitude_latitude, 
     file=here("data", 
               "world_longitude_latitude.rda"))  
