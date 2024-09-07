## Sep 7, 2024
## Initial preprocessing steps are in denguedatahubpdf
## denguedatahubpdf -> cdc_dengue_csv -> cdc_preprocessing.R
## Dataset 1
library(tidyverse)
library(readr)
cdc_dengue_countyyear <- read_csv("data-raw/cdc/cdc_dengue_countyyear.csv")
View(cdc_dengue_countyyear)
colnames(cdc_dengue_countyyear) <- c("FullGeoName",
                                     "Year",
                                     "Travel.status",
                                     "County",
                                     "Legend",
                                     "Notes")
usethis::use_data(cdc_dengue_countyyear, overwrite = TRUE)

## Dataset 2
cdc_dengue_agesex <- read_csv("data-raw/cdc/cdc_dengue_agesex.csv")
View(cdc_dengue_agesex)
colnames(cdc_dengue_agesex) <- c("Year", "Travel.status",
                                 "Age", "Male", "Female")
usethis::use_data(cdc_dengue_agesex, overwrite = TRUE)


## Dataset 3
cdc_casesby_week <- read_csv("data-raw/cdc/cdc_casesby_week.csv")
View(cdc_casesby_week)
colnames(cdc_casesby_week) <- c("Year", "Travel.status",
                                "Week",
                                "Reported.cases")
usethis::use_data(cdc_casesby_week, overwrite = TRUE)

## Dataset 4
cdc_dengue_casesbyjurisdiction <- read_csv("data-raw/cdc/cdc_dengue_casesbyjurisdiction.csv")
View(cdc_dengue_casesbyjurisdiction)
colnames(cdc_dengue_casesbyjurisdiction) <- c("Year", 
                                              "Travel.status",
                                "Jurisdiction",
                                "Count",
                                "Legend",
                                "Notes")
usethis::use_data(cdc_dengue_casesbyjurisdiction, overwrite = TRUE)
