# App File

# Source Files
source("app_ui.R", local = TRUE)
source('app_server.R', local = TRUE)
source("interactive_map.R", local = TRUE)

# Libraries
library("shiny")
library("dplyr")
library("leaflet")

# Source UI File
ui <- multipage_ui

# Source Server File
remote_server <- project_server

# Run the application 
shinyApp(ui = ui, server = remote_server)