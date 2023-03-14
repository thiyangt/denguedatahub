# source: extract dengue counts from the DISC package
library(here)
library(tibble)
load(here("data-raw", "Data_Counts.rda"))
sl <- Data_Counts
year <- sl$Year
week <- sl$Week
start.date <- sl$StartDate
end.date <- sl$EndDate
division <- sl$Division
dengue.cases <- sl$Dengue
srilanka_weekly_data <- tibble(year = year,
                               week = week,
                               start.date = start.date,
                               end.date = end.date,
                               district = division,
                               cases = dengue.cases
                               )
#save(srilanka_weekly_data, file=here("data", "srilanka_weekly_data.rda"))
usethis::use_data(srilanka_weekly_data, overwrite = TRUE)
