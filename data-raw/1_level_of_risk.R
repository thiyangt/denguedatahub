# web: https://www.cdc.gov/dengue/areaswithrisk/around-the-world.html
# last accesses: 16 January 2023
library(rvest)
library(tidyverse)
library(magrittr)
library(usethis)

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
oceania_selector <- "body > div.container.d-flex.flex-wrap.body-wrapper.bg-white > main > div:nth-child(3) > div > div:nth-child(4) > div:nth-child(3) > div > div:nth-child(16)"


## Reading data
africa <- read_data_web(url, africa_selector)
africa$Region <- rep("Africa", dim(africa)[1])

asia <- read_data_web(url, asia_selector)
asia$Region <- rep("Asia", dim(asia)[1])

europe <- read_data_web(url, europe_selector)
europe$Region <- rep("Europe", dim(europe)[1])

americas <- read_data_web(url, america_selector)
americas$Region <- rep("Americas", dim(americas)[1])

oceania <- read_data_web(url, oceania_selector)
oceania$Region <- rep("Oceania/Pacific Islands", dim(oceania)[1])

level_of_risk <- bind_rows(africa, asia, europe, americas, oceania)
head(level_of_risk)
dim(level_of_risk) #148 5

dim(as.data.frame(africa))
as.data.frame(africa)[1]
as.data.frame(africa)[2]
as.data.frame(africa)[3]

dim(africa)
dim(asia)
dim(europe)
dim(americas)
dim(oceania)

47+30+3+46+22

level_of_risk <- level_of_risk[, 1:3]
head(level_of_risk)
level_of_risk$Country <- as.factor(level_of_risk$Country)
level_of_risk$`Level of Risk`<- as.factor(level_of_risk$`Level of Risk`)
level_of_risk$Region <- as.factor(level_of_risk$Region)
head(level_of_risk)
summary(level_of_risk)



usethis::use_data(level_of_risk, overwrite = TRUE)
usethis::use_r("level_of_risk")
#source: https://rstudio4edu.github.io/rstudio4edu-book/data-pkg.html


load(here("data", "level_of_risk.rda"))
colnames(level_of_risk) <- c("country",
                             "level_of_risk",
                             "region")
#save(level_of_risk, file=here("data",
#                              "level_of_risk.rda"))
usethis::use_data(level_of_risk, overwrite = TRUE)
usethis::use_r("level_of_risk")

## 2023 April 4
library(tidyverse)
load("~/packages/denguedatahub/data/level_of_risk.rda")
level_of_risk <- level_of_risk %>%
  filter(level_of_risk != "Risk varies based on region. See map.")
View(level_of_risk)
usethis::use_data(level_of_risk, overwrite = TRUE)

##2024 Sep 3
library(here)
library(readr)
load("~/denguedatahub/data/level_of_risk.rda")
dim(level_of_risk)
View(level_of_risk)
level_of_risk$last_accesses <- as.Date(rep("2023-01-16", 138))
library(readr)
level_of_risk_2024 <- read_csv("data-raw/level_of_risk_2024.csv")
View(level_of_risk_2024)
dim(level_of_risk_2024)
level_of_risk_2024$last_accesses <- as.Date(rep("2024-09-03", 155))
library(dplyr)
View(level_of_risk)
View(level_of_risk_2024)
level_of_risk <- bind_rows(level_of_risk, level_of_risk_2024)
View(level_of_risk)
unique(level_of_risk$region)
table(level_of_risk$region)
level_of_risk <- level_of_risk |> rename(last_accessed = last_accesses)
View(level_of_risk)
usethis::use_data(level_of_risk, overwrite = TRUE)
