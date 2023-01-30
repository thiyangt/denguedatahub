## ---- load-packages
library(rvest)
library(tidyverse)
library(magrittr)
library(usethis)

## ---- read-data-web
read_data_web <- function(url, selector){
  url %>% 
    read_html() %>% 
    html_element(css = selector) %>%
    html_table()
  
}
