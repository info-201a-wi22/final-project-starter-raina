# UI Code
library("shiny")
library("dplyr")
library("leaflet")
library(tidyverse)
library(plotly)
library(zoo)

#TODO: rm every mention of placeholder

# Introduction: Caroline doing text content
introduction_page <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  p("Introduction content")
)

# Interactive Page 1: pH Over Time (Zach)
ph_visualization <- tabPanel(
  "CO2 and pH Over Time",
  tabPanel(
    "CO2 and pH Over Time Graph",
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
        selected = "Atlantic"
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
