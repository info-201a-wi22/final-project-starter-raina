source('interactive_map.R', local = TRUE)
source('interactive_pH_and_co2_time.R', local = TRUE)

# Server Code
library("shiny")
library("dplyr")
library("leaflet")
library(tidyverse)
library(plotly)
library(zoo)

# Server
project_server <- function(input, output) {
  
  # Summary figures
  
  # Visualization 1: pH Over Time
  
  # Zach Server Code
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

  # Visualization 2: TBD

  # Visualization 3: Map
  output$interactive_map <- renderLeaflet({
    collection_map
  })
  
  
  #############################################################################
  # TODO FIX ME
  selectedData <- reactive({
    req(input$ocean_select)
    locations_by_frequency %>% 
      filter(ocean_category == input$ocean_select)
  })
  
  observe({
    leafletProxy("interactive_map", data = selectedData()) %>%
      clearShapes() %>%
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
        title = input$ocean_select,
        pal = palette_fn, 
        values = ~ocean_category, 
        opacity = 1
      )
  })
  #############################################################################
}