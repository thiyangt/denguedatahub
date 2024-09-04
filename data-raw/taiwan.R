library(readxl)
taiwan_dengue <- read_excel("data-raw/taiwan_dengue.xlsx")
View(taiwan_dengue)
usethis::use_data(taiwan_dengue, overwrite = TRUE)
