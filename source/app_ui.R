# UI Code
library("shiny")
library("dplyr")
library("leaflet")

#TODO: rm every mention of placeholder

# Introduction: Caroline doing text content
introduction_page <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  p("Introduction content")
)

# Interactive Page 1: pH Over Time (Zach)
ph_visualization <- tabPanel(
  "Data Visualization 1 Placeholder", 
  titlePanel("Placeholder"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "placeholder_var",
        label = "Industry",
        choices = c("placeholder")
      )
    ),
    mainPanel(
      p("Placeholder"),
      h2("Takeaways")
    )
  )
)

# Interactive Page 2: TBD (Ben)
visualization_1 <- tabPanel(
  "Data Visualization 1 Placeholder", 
  titlePanel("Placeholder"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "ocean_select",
        label = "Ocean",
        choices = c("Atlantic", "Pacific", "Arctic")
      )
    ),
    mainPanel(
      p("Placeholder"),
      h2("Takeaways")
    )
  )
)

# Interactive Page 3: map (Raina)
map_visualization <- tabPanel(
  "Map Visualization Placeholder", 
  titlePanel("Placeholder"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "ocean_select",
        label = "Ocean",
        choices = c("Atlantic", "Pacific", "Arctic"),
        selected = "Pacific"
      )
    ),
    mainPanel(
      leafletOutput(outputId = "interactive_map"),
      p("Placeholder"),
      h2("Takeaways")
    )
  )
)

# Summary: Caroline doing text content
summary_page <- tabPanel(
  "Summary Takeaways",
  titlePanel("Summary"),
  p("Summary content goes here")
)

# Report: Caroline doing text content (??)
report_page <- tabPanel(
  "Report",
  titlePanel("Final Report"),
  p("Report Content Goes Here")
)

multipage_ui <- navbarPage(
  "Placeholder title", 
  introduction_page, 
  ph_visualization,
  visualization_1,
  map_visualization,
  summary_page,
  report_page
)

multipage_ui
