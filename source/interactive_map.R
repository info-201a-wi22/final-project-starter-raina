# Interactive Map for Final Project
# Raina Scherer

source('app_ui.R', local = TRUE)

library("shiny")
library("dplyr")
library("leaflet")
library("tidyr")

df_viz <- read.csv("../data/CODAP_NA_v2021.csv", stringsAsFactors = FALSE)

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

# Convert Long and Lat to numeric values
locations_by_frequency$Latitude <- as.numeric(locations_by_frequency$Latitude)
locations_by_frequency$Longitude <- as.numeric(locations_by_frequency$Longitude)

# Add column to classify oceans
locations_by_frequency <- locations_by_frequency %>%
  mutate(
    ocean_category = ifelse(Longitude > -100, "Atlantic", ifelse(Latitude < 66.5, "Pacific","Arctic"))
  ) %>%
  drop_na(ocean_category)

# Create color palette based on ocean classification
palette_fn <- colorFactor(
  palette = "Set1",
  domain = locations_by_frequency$ocean_category
  )

# Create map of collection locations with increasing radius for samples taken
# and color coding for each ocean classification
collection_map <- leaflet(locations_by_frequency) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircleMarkers(
    lat = ~Latitude,
    lng = ~Longitude,
    radius = ~radius,
    stroke = FALSE,
    fillOpacity = 0.5,
    color = ~palette_fn(ocean_category)
  ) %>%
  addLegend(
    position = "bottomright",
    title = "Ocean",
    pal = palette_fn, 
    values = ~ocean_category, 
    opacity = 1
  )