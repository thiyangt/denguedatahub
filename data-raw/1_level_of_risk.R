# web: https://www.cdc.gov/dengue/areaswithrisk/around-the-world.html
# last accesses: 16 January 2023


library(rvest)
library(tidyverse)
library(magrittr)

## General function
## General function

read_data_web <- function(url, selector){
  url %>% 
    read_html() %>% 
    html_element(css = selector) %>%
    html_table()
  
}

## Read data

url <- "https://www.cdc.gov/dengue/areaswithrisk/around-the-world.html"
## Africa
africa_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(5) > table"
## Asia
asia_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(8)"
## Europe 
europe_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(11) > table > tbody"
## Americas
america_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(13)"
## Oceania/Pacific Islands
oceania_selector <- ""




