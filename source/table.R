library("dplyr")

df <- read.csv("./data/CODAP_NA_v2021.csv",stringsAsFactors = FALSE)

df$pH_TS_insitu_calculated <- as.numeric(df$pH_TS_insitu_calculated)
df$Latitude <- as.numeric(df$Latitude)
df$Longitude <- as.numeric(df$Longitude)

# Average Ocean Acidification per Year, by Ocean
acidification_table <- df %>%
  select(pH_TS_insitu_calculated, Year_UTC, Longitude, Latitude) %>%
  filter(pH_TS_insitu_calculated > 0, na.rm = TRUE) %>%
  mutate(
    ocean_category = ifelse(Longitude > -100, "Atlantic", ifelse(Latitude < 66.5, "Pacific","Arctic"))
  ) %>%
  group_by(ocean_category,Year_UTC) %>%
  summarise(
    average_pH = round(mean(pH_TS_insitu_calculated),2)
    ) %>%
  spread(key = ocean_category, value = average_pH) %>%
  rename(Year = Year_UTC)

acidification_table