library(dplyr)
library(zoo)
library(tidyverse)
library(ggplot2)

ocean_data <- read.csv("../data/CODAP_NA_v2021.csv", stringsAsFactors = FALSE)

ocean_data$pH_TS_insitu_calculated <- as.numeric(ocean_data$pH_TS_insitu_calculated)
ocean_data$Year_UTC <- as.numeric(ocean_data$Year_UTC)
ocean_data$fCO2_insitu_calculated <- as.numeric(ocean_data$fCO2_insitu_calculated)

ocean_data$Date <- as.yearmon(paste(ocean_data$Year_UTC, ocean_data$Month_UTC), "%Y %m")

ocean_data <- ocean_data %>%
  filter(pH_TS_insitu_calculated > 0, na.rm = TRUE) %>%
  filter(fCO2_insitu_calculated > 0, na.rm = TRUE)

ph_by_date <- ocean_data %>%
  group_by(Date) %>%
  summarise(mean_pH = mean(pH_TS_insitu_calculated), number_of_observations = n())

co2_by_date <- ocean_data %>%
  group_by(Date) %>%
  summarise(mean_co2 = mean(fCO2_insitu_calculated), number_of_observations = n())

co2_ph <- merge(co2_by_date, ph_by_date)

co2_by_ph <- ggplot(data = co2_ph, aes(x = mean_pH, y = mean_co2)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

co2_by_ph <- co2_by_ph + ggtitle("Average pH level observed in ocean samples vs average fugacity of Co2 by month") + 
        labs(x = "pH level", y = "Fugacity of CO2 (μatm)")
