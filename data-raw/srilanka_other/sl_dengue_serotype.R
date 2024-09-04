library(readr)
sl_dengue_serotype <- read_csv("data-raw/srilanka_other/sl_dengue_serotype.csv")
View(sl_dengue_serotype)
usethis::use_data(sl_dengue_serotype, overwrite = TRUE)
