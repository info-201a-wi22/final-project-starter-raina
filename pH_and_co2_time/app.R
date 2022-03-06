#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(dplyr)
library(tidyverse)
library(shiny)
library(plotly)
library(zoo)

ocean_data <- read.csv("CODAP_NA_v2021.csv")

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


# Define UI for application that draws a histogram
ui <- navbarPage(
  "CO2 and pH over time",
  tabPanel(
    "CO2 and pH over time graph",
    sidebarLayout(
      sidebarPanel(
        radioButtons("co2_or_ph", 
                    label = h3("Select CO2 or Average pH level"),
                    choices = c("Average pH", "CO2 fugacity"),
                    selected = "Average pH")
      ),
      
      mainPanel(
        plotlyOutput("co2_ph_plot"),
        p(strong("Description")),
        br("This graph aims to show the correlation between the dissolved CO2 in ocean water and the average pH 
           level. We can clearly see that as the fugacity of CO2 increases, the pH level of ocean water decreases 
           becoming more acidic. A possible cause of this is that more CO2 is being released into the atmosphere due 
           to human-caused pollution. This excess CO2 could then dissolve into the ocean which will then cause the 
           ocean to become more acidic.")
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$co2_ph_plot <- renderPlotly({
      if(input$co2_or_ph == "CO2 fugacity") {
        selected.co2_ph <- co2_ph %>%
          select(Date, mean_co2)
        y_title <- "Fugacity of CO2 (μatm)"
      } else {
        selected.co2_ph <- co2_ph %>%
          select(Date, mean_pH)
        y_title <- "Average pH"
      }
      
      graph <- ggplot(data = selected.co2_ph, aes(x = Date, y = unlist(selected.co2_ph[,2]))) +
        geom_line(stat = "identity") +
        theme(legend.position = "none") +
        ylab(y_title) +
        xlab("Date (by month)") +
        geom_smooth(method = 'lm', se = FALSE)
      
      g <- ggplotly(graph)
      return(g)
      
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
