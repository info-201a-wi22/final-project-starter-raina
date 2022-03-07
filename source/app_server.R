# Server Code
library("shiny")
library("dplyr")
library("leaflet")

# Source
source("interactive_map.R", local = TRUE)

# Server
project_server <- function(input, output) {
  
  # Summary figures
  
  # Visualization 1: pH Over Time

  # Visualization 2: TBD

  # Visualization 3: Map
  output$interactive_map <- renderLeaflet({
    collection_map
  })
}