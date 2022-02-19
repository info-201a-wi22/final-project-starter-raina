df1 <- read.csv("./data/CODAP_NA_v2021.csv", stringsAsFactors = FALSE, na.rm = TRUE) 
summary_info<-list()

# What is the difference between pH levels from the earliest year to the most recent year?

summary_info$earliest_pH_level <- df1 %>%
  filter(Year_UTC == "2003") %>%
  filter(pH_TS_insitu_calculated > 0, na.rm = TRUE) %>%
  pull(min(pH_TS_insitu_calculated))

summary_info$recent_pH_level <- df1 %>%
  filter(Year_UTC == "2018") %>%
  filter(pH_TS_insitu_calculated > 0, na.rm = TRUE) %>%
  pull(max(pH_TS_insitu_calculated))

