library(readxl)
korea_dengue <- read_excel("data-raw/srilanka_other/dengue_imported_korea.xlsx")
View(korea_dengue)
usethis::use_data(korea_dengue, overwrite = TRUE)
