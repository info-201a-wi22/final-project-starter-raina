# Interactive Map for Final Project
# Raina Scherer

library("shiny")
library("dplyr")
library("leaflet")
library("tidyr")

df_viz <- read.csv("../data/CODAP_NA_v2021.csv", stringsAsFactors = FALSE)

df_viz$Year_UTC <- as.numeric(df_viz$Year_UTC)
df_viz$pH_TS_insitu_calculated <- as.numeric(df_viz$pH_TS_insitu_calculated)

pH_by_location <- df_viz %>%
  select(Latitude, Longitude, pH_TS_insitu_calculated, Year_UTC) %>%
  filter(pH_TS_insitu_calculated > 0) %>%
  mutate(radius = ((pH_TS_insitu_calculated / max(pH_TS_insitu_calculated)) * 3) ^ 2) %>%
  mutate(full_loc = paste0(Longitude, ",", Latitude)) %>%
  group_by(full_loc, Year_UTC) %>%
  summarise(
    average = mean(pH_TS_insitu_calculated)
    ) %>%
  arrange(Year_UTC) %>%
  separate(
    col = full_loc,
    into = c("Longitude", "Latitude"),
    sep = ",") %>%
  mutate(radius = ((min(average)/average)) ^ 3)  

pH_by_location$Latitude <- as.numeric(pH_by_location$Latitude)
pH_by_location$Longitude <- as.numeric(pH_by_location$Longitude)

pH_by_location <- pH_by_location %>%
  mutate(
    ocean_category = ifelse(
      Longitude > -100, "Atlantic", ifelse(Latitude < 66.5, "Pacific","Arctic"))
  ) %>%
  drop_na(ocean_category)