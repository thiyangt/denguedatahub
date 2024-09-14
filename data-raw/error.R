library(tidyverse)
xx <- srilanka_weekly_data |>
  filter(year ==2024)

ggplot(xx, aes(y=cases, x=start.date, 
               group=district)) + 
  geom_line()
View(xx)
