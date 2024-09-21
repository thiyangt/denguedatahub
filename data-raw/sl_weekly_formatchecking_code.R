library(tidyverse)

data2020 |>
  filter(district =="Colombo")|>
  ggplot(aes(x=start.date, y=cases)) + geom_line()


srilanka_weekly_data |>
  filter(district =="Colombo")|>
  ggplot(aes(x=start.date, y=cases)) + geom_line()
