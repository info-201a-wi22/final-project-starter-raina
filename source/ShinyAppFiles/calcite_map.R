library("dplyr")
library("tidyr")
library("plotly")
library("zoo")


oc_data <- read.csv("CODAP_NA_v2021.csv", stringsAsFactors = FALSE)

oc_data <- oc_data %>% 
  select("Calcite", "Aragonite", "Year_UTC", "Month_UTC")

oc_data_na <- oc_data %>% 
  mutate(Calcite = replace(Calcite, Calcite == -999, NA)) %>% 
  mutate(Aragonite = replace(Aragonite, Aragonite == -999, NA)) %>% 
  filter(Year_UTC != "n.a.")


oc_data_na$Calcite <- as.numeric(oc_data_na$Calcite)
oc_data_na$Aragonite <- as.numeric(oc_data_na$Aragonite)
oc_data_na$Year_UTC <- as.numeric(oc_data_na$Year_UTC)
oc_data_na$Date <- as.yearmon(paste(oc_data_na$Year_UTC, oc_data_na$Month_UTC), "%Y %m")

cal_monthly <- oc_data_na %>% 
  group_by(Date) %>% 
  summarize(avg_calcite = mean(Calcite, na.rm=T), avg_aragonite = mean(Aragonite, na.rm=T)) %>% 
  mutate(avg_calcite = c(NA, NA, na.approx(avg_calcite))) %>% 
  mutate(avg_aragonite = c(NA, NA, na.approx(avg_aragonite))) %>% 
  filter(avg_calcite != is.na(avg_calcite))


