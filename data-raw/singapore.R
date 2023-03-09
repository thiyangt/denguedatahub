# 9 March 2023
# https://www.straitstimes.com/multimedia/graphics/2022/06/singapore-dengue-cases/index.html?shell#:~:text=Singapore%20is%20currently%20seeing%2030,lower%20than%20the%202020%20surge
#--------
library(stringr)
library(tidyverse)
#--------
singapore1 <- "https://datawrapper.dwcdn.net/IbOE7/10/dataset.csv" %>%  
  read_csv()
head(singapore1)
singapore2 <- singapore1 %>% 
  pivot_longer(!name, names_to = "week", 
               values_to = "cases")
head(singapore2)

singapore <- singapore2 %>%
  separate(week, c("w1", "w2"))
head(singapore)
singapore <- singapore[, c(1, 3, 4)]
singapore <- singapore %>%
  rename(year=name,
         week=w2)
View(singapore)

#--------

#y2018 <- "[0, 54],[1, 45],[2, 48],[3, 50],[4, 50],[5, 28],[6, 30],[7, 37],[8, 51],[9, 37],[10, 39],[11, 36],[12, 24],[13, 38],[14, 38],[15, 56],[16, 56],[17, 77],[18, 62],[19, 64],[20, 65],[21, 54],[22, 75],[23, 55],[24, 61],[25, 76],[26, 58],[27, 44],[28, 41],[29, 56],[30, 51],[31, 59],[32, 68],[33, 68],[34, 75],[35, 76],[36, 49],[37, 63],[38, 40],[39, 51],[40, 51],[41, 62],[42, 78],[43, 75],[44, 71],[45, 97],[46, 97],[47, 109],[48, 115],[49, 108],[50, 128],[51, 160]"


data_read <- function(year, yextractor){
df <- str_match_all(yextractor, "\\[(.*?)\\]")
class(df)
#mat <- df[[1]]
#mat[, 2]
#tib <- tibble(x=mat[, 2])
#final <- separate(tib, x, c("week", "cases"))
#week <-  as.integer(final$week)
#cases <- as.numeric(final$cases)
#year <- rep(year, length(final$week))
#tibble::tibble(year=year, week=week, cases)
#}

#data_read(2019, y2019)
