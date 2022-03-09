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
  
  # Zach's Server Code
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

  # Visualization 3: Map (Raina)
  output$interactive_map <- renderLeaflet({
    
    selected_pH_data <- pH_by_location %>%
      dplyr::filter(Year_UTC == input$year_select)
    
    # Create color palette based on ocean classification
    palette_fn <- colorFactor(
      palette = "Set1",
      domain = selected_pH_data$ocean_category
    )
    
    # Create map of collection locations with increasing radius for lower pH
    # and color coding for each ocean classification
    collection_map <- leaflet(selected_pH_data) %>%
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
    
    collection_map
  })
  
  # Table to show average per Ocean for each year
  output$grouped_table <- renderTable({
    
    ocean_pH_selected <- ocean_ph_table %>%
      dplyr::filter(Year == input$year_select)
    
    ocean_pH_selected
  })
}