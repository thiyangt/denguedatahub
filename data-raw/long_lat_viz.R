library(denguedatahub)
library(ggplot2)
library(maps)
library(magrittr)
library(viridis)

library(denguedatahub)
library(ggplot2)
library(maps)
library(magrittr)
library(viridis)

worldMap <- map_data("world")
worlddata <- dplyr::left_join(worldMap, world_annual, by = c(region = "entity"))

worldMap.entries <- unique(worldMap$region)
world_annual.entries <- unique(world_annual$entity)
map.annual <- worldMap.entries %in% world_annual.entries
annual.map <- world_annual.entries %in% worldMap.entries

map.notincluded <- worldMap.entries[!map.annual]
annual.notincluded <- world_annual.entries[!annual.map]

world_annual[world_annual == "Antigua and Barbuda"] <- "Antigua"
world_annual[world_annual == "Congo"] <- "Republic of Congo"
world_annual[world_annual == "Cote d'Ivoire"] < "Ivory Coast"
world_annual[world_annual == "Czechia"] <- "Czech Republic"
world_annual[world_annual == "Democratic Republic of Congo"] <- "Democratic Republic of the Congo"
world_annual[world_annual == "England"] 
world_annual[world_annual == "Eswatini"]
world_annual[world_annual == "Micronesia (country)"] <- "Micronesia"
world_annual[world_annual == "Northern Ireland" ]
world_annual[world_annual == "Scotland"]
world_annual[world_annual == "Timor"] <- "Timor-Leste"
world_annual[world_annual == "Tokelau"]
world_annual[world_annual == "Tokelau"]
world_annual[world_annual == "Trinidad and Tobago"] <- "Trinidad"
world_annual[world_annual == "Tuvalu"]
world_annual[world_annual == "United Kingdom"] <- "UK"
world_annual[world_annual == "United States"] <- "USA"
world_annual[world_annual == "United States Virgin Islands"] <- "Virgin Islands"
world_annual[world_annual == "Wales"]

worlddata <- dplyr::full_join(worldMap, world_annual, by = c(region = "entity"))


worlddata <- worlddata %>%
  dplyr::mutate(dengue.present = dplyr::case_when(incidence == 0 ~ "no", incidence!=0 ~ "yes", incidence == NA ~ "NA"))

worlddata2019 <- dplyr::filter(worlddata, year==2019)
ggplot(worlddata2019, aes(x = long,
                          y = lat,
                          group=group,
                          fill = dengue.present)) +
  geom_polygon(color = "black") +
  labs(x = "Longitude",
       y = "Latitude") +
  theme(legend.position = "bottom") + 
  scale_fill_brewer(palette = "Dark2")

world_annual <- worlddata %>%
  rename(longitude = long,
         latitude = lat)

usethis::use_data(world_annual, overwrite = TRUE)
