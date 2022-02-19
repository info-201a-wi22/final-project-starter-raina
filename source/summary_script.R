df1 <- read.csv("../data/CODAP_NA_v2021.csv", stringsAsFactors = FALSE) 
summary_info<-list()

# What is the average pH level from 2018? 
 
df1$pH_TS_insitu_calculated <- as.numeric(df1$pH_TS_insitu_calculated)

summary_info$recent_pH_level <- df1 %>%
  filter(Year_UTC == "2018") %>%
  filter(pH_TS_insitu_calculated > 0, na.rm = TRUE) %>%
  summarise(average_pH = round(mean(pH_TS_insitu_calculated), 2)) %>%
  pull(average_pH)

# What is the average pH level from 2004? 

summary_info$earliest_pH_level <- df1 %>%
  filter(Year_UTC == "2004") %>%
  filter(pH_TS_insitu_calculated > 0, na.rm = TRUE) %>%
  summarise(average_pH = round(mean(pH_TS_insitu_calculated), 2)) %>%
  pull(average_pH)
  
# What is the difference in pH levels from 2004 to 2018? 
summary_info$pH_level_difference <- (summary_info$recent_pH_level - summary_info$earliest_pH_level)

# What is the location with the most sampled data in latitude and longitude? 

summary_info$most_sampled <- df1 %>%
  select(Latitude, Longitude) %>%
  mutate(full_loc = paste(Latitude, Longitude)) %>%
  group_by(full_loc) %>%
  count(full_loc) %>%
  ungroup(full_loc) %>%
  filter(n == max(n)) %>%
  pull(full_loc)
  
# Which year has the highest measured fungacity of carbon dioxide? 

summary_info$year_highest_fCO2 <- df1 %>%
  select(fCO2_insitu_measured, Year_UTC) %>%
  filter(fCO2_insitu_measured == max(fCO2_insitu_measured)) %>%
  pull(Year_UTC)

