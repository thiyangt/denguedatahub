## reading general r codes
library(here)
source(here("data-raw", "1_general_codes.R"))


## function inputs
url <- "https://nvbdcp.gov.in/index4.php?lang=1&level=0&linkid=431&lid=3715"
india_selector <- "#cmscontent"

## read India data
india_data <- read_data_web(url, india_selector)

## Data preprocessing
dim(india_data)
data.frame(india_data)
india_data <- india_data[3:38, ] 
as.data.frame(india_data)

colnames(india_data) <- c("No.",
                          "Affected States/UTs",
                          "cases_2017", "deaths_2017",
                          "cases_2018", "deaths_2018",
                          "cases_2019", "deaths_2019",
                          "cases_2020", "deaths_2020",
                          "cases_2021", "deaths_2021",
                          "cases_2022_till31stOct", 
                          "deaths_2022_till31stOct")
india_data <- india_data %>%
  select(-c("No."))

data.frame(india_data)
rownames(india_data) <- NULL
which(india_data$cases_2019 == "NR")
india_data$cases_2019[30] <- "NA"
which(india_data$deaths_2019 == "NR")
india_data$deaths_2019[30] <- "NA"

india_data$cases_2017 <- as.numeric(india_data$cases_2017)
india_data$deaths_2017 <- as.numeric(india_data$deaths_2017)


india_data$cases_2018 <- as.numeric(india_data$cases_2018)
india_data$deaths_2018 <- as.numeric(india_data$deaths_2018)


india_data$cases_2019 <- as.numeric(india_data$cases_2019)
india_data$deaths_2019 <- as.numeric(india_data$deaths_2019)


india_data$cases_2020 <- as.numeric(india_data$cases_2020)
india_data$deaths_2020 <- as.numeric(india_data$deaths_2020)


india_data$cases_2021 <- as.numeric(india_data$cases_2021)
india_data$deaths_2021 <- as.numeric(india_data$deaths_2021)

india_data$`cases_2022_till31stOct` <- as.numeric(india_data$`cases_2022_till31stOct`)
india_data$`deaths_2022_till31stOct` <- as.numeric(india_data$`deaths_2022_till31stOct`)

india_data <- india_data %>% pivot_longer(2:13, "cases", "year")
View(india_data)

india_data <- india_data %>% 
  separate("cases", c("type", "year", "additional_information"))
view(india_data)

india_annual_data <- india_data
save(india_annual_data, file=here("data", "india_annual_data.rda"))
view(india_annual_data)

load(here("data", "india_annual_data.rda"))

india_annual_data <- india_annual_data %>%
  rename(area=`Affected States/UTs`)
save(india_annual_data, file=here("data", "india_annual_data.rda"))
