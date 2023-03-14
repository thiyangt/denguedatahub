# 14 March 2023
# https://www.straitstimes.com/multimedia/graphics/2022/06/singapore-dengue-cases/index.html?shell#:~:text=Singapore%20is%20currently%20seeing%2030,lower%20than%20the%202020%20surge
#--------
library(stringr)
library(tidyverse)
library(here)
#--------
singapore1 <- "https://datawrapper.dwcdn.net/IbOE7/10/dataset.csv" %>%  
  read_csv()
head(singapore1)
singapore2 <- singapore1 %>% 
  pivot_longer(!name, names_to = "week", 
               values_to = "cases")
head(singapore2)

singapore3 <- singapore2 %>%
  separate(week, c("w1", "w2"))
head(singapore3)
singapore3 <- singapore3[, c(1, 3, 4)]
singapore4 <- singapore3 %>%
  rename(year=name,
         week=w2)
View(singapore4)
singapore4$week <- as.integer(singapore4$week)
singapore5 <- singapore4 %>% filter(year!=2022)
unique(singapore5$year)

#--------

#y2018 <- "[0, 54],[1, 45],[2, 48],[3, 50],[4, 50],[5, 28],[6, 30],[7, 37],[8, 51],[9, 37],[10, 39],[11, 36],[12, 24],[13, 38],[14, 38],[15, 56],[16, 56],[17, 77],[18, 62],[19, 64],[20, 65],[21, 54],[22, 75],[23, 55],[24, 61],[25, 76],[26, 58],[27, 44],[28, 41],[29, 56],[30, 51],[31, 59],[32, 68],[33, 68],[34, 75],[35, 76],[36, 49],[37, 63],[38, 40],[39, 51],[40, 51],[41, 62],[42, 78],[43, 75],[44, 71],[45, 97],[46, 97],[47, 109],[48, 115],[49, 108],[50, 128],[51, 160]"

y2023 <- "[0, 281],[1, 278],[2, 274],[3, 186],[4, 223],[5, 219],[6, 148],[7, 139],[8, 112]"
y2022 <- "[0, 105],[1, 146],[2, 180],[3, 171],[4, 154],[5, 169],[6, 206],[7, 199],[8, 263],[9, 370],[10, 421],[11, 441],[12, 510],[13, 643],[14, 734],[15, 942],[16, 1003],[17, 850],[18, 1318],[19, 1280],[20, 1569],[21, 1464],[22, 1466],[23, 1258],[24, 1188],[25, 1168],[26, 919],[27, 1047],[28, 1099],[29, 921],[30, 885],[31, 682],[32, 665],[33, 581],[34, 571],[35, 547],[36, 472],[37, 426],[38, 398],[39, 376],[40, 373],[41, 314],[42, 318],[43, 294],[44, 315],[45, 265],[46, 242],[47, 327],[48, 290],[49, 270],[50, 285]" 


data_read <- function(year, yextractor){
df <- str_match_all(yextractor, "\\[(.*?)\\]")
class(df)
mat <- df[[1]]
mat[, 2]
tib <- tibble(x=mat[, 2])
final <- separate(tib, x, c("week", "cases"))
week <-  as.integer(final$week)
cases <- as.numeric(final$cases)
year <- rep(year, length(final$week))
tibble::tibble(year=year, week=week, cases)
}

data2022 <- data_read(2022, y2022)
View(data2022)
data2023 <- data_read(2023, y2023)
View(data2023)
singapore_weekly_data <- bind_rows(singapore5, data2022)
singapore_weekly_data <- bind_rows(singapore_weekly_data, data2023)
view(singapore_weekly_data)
#save(singapore_weekly_data, file=here("data", "singapore_weekly_data.rda"))
usethis::use_data(singapore_weekly_data, overwrite = TRUE)
