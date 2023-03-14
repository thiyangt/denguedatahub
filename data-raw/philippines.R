#philipine
#https://data.humdata.org/dataset/philippine-dengue-cases-and-deaths?

library(here)
library(tidyverse)

philippines <- read_csv(here("data-raw", 
                             "philippine",
                             "doh-epi-dengue-data-2016-2021.csv"))
head(philippines)
colnames(philippines)
philippines[1,]
dim(philippines)

philippines <- philippines[2:32702,]
colnames(philippines) <- c("location", "affected_and_infected"
                           ,"affected_and_killed",
                           "date",
                           "region")
View(philippines)
philippines_daily_data <- philippines
#save(philippines_daily_data, file=here("data", "philippines_daily_data.rda"))

usethis::use_data(philippines_daily_data, overwrite = TRUE)
