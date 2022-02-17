library("dplyr")
library("leaflet")
library("tidyr")

df_viz <- read.csv("./data/CODAP_NA_v2021.csv", stringsAsFactors = FALSE)

# Create df with Longitude, Latitude, # of Samples for that Location, and Radius
locations_by_frequency <- df_viz %>%
  select(Latitude, Longitude) %>%
  mutate(full_loc = paste(Longitude, Latitude)) %>%
  group_by(full_loc) %>%
  count(full_loc) %>%
  separate(
    col = full_loc,
    into = c("Longitude", "Latitude"),
    sep = " ") %>%
  mutate(radius = ((n / max(n)) * 3) ^ 2) %>%
  arrange(desc(radius))

locations_by_frequency$Latitude <- as.numeric(locations_by_frequency$Latitude)
locations_by_frequency$Longitude <- as.numeric(locations_by_frequency$Longitude)

collection_map <- leaflet(locations_by_frequency) %>%
  addTiles() %>%
  addCircleMarkers(
    lat = ~Latitude,
    lng = ~Longitude,
    radius = ~radius,
    stroke = FALSE,
    fillOpacity = 0.5
  )

collection_map