# web: https://www.cdc.gov/dengue/areaswithrisk/around-the-world.html
# last accesses: 16 January 2023


library(rvest)
library(tidyverse)
library(magrittr)


url <- "https://www.cdc.gov/dengue/areaswithrisk/around-the-world.html"
data <- read_html(url) 
data

## Africa
africa_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(5) > table"
africa <- url %>% 
  read_html() %>% 
  html_element(css = africa_selector) %>%
  html_table()
dim(africa)
africa$Region <- rep("Africa", dim(africa)[1])
head(africa)

## Asia

asia_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(8)"
asia <- url %>% 
  read_html() %>% 
  html_element(css = asia_selector) %>%
  html_table()
dim(asia)
asia$Region <- rep("Asia", dim(asia)[1])
head(asia)

## General function

read_data_web <- functi
