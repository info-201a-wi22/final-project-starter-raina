# UI Code
library("shiny")
library("dplyr")
library("leaflet")
library(tidyverse)
library(plotly)
library(zoo)
library("bslib")

# Introduction: Caroline doing text content
introduction_page <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  p("Introduction content")
)

# Interactive Page 1: pH Over Time (Zach)
ph_visualization <- tabPanel(
  "Q1. CO2 and pH Over Time",
  tabPanel(
    "CO2 and pH Over Time Graph",
    sidebarLayout(
      sidebarPanel(
        radioButtons("co2_or_ph", 
                     label = "Select CO2 or Average pH level",
                     choices = c("Average pH", "CO2 fugacity"),
                     selected = "Average pH")
      ),
      mainPanel(
        h3("How have pH levels changed in oceans from 2005 to 2015?"),
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

# Interactive Page 2: (Ben)
calcite_visualization <- tabPanel(
  "Q2. Impact on Marine Ecosystems", 

  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "var_select",
        label = "Select Type of Calcite Dissolved Compound",
        choices = c("avg_calcite", "avg_aragonite")
      )
    ),
    mainPanel(
      h3("How will the changes in calcite levels impact marine ecosystems?"),
      plotlyOutput(outputId = "calc_graph"),
      h2("What is Calcite?"),
      p("Calcite is a category of Calcium Carbonates, consisting of calcite, 
      magnesium-calcite, and aragonite among others. Calcium Carbonates are the
        fundamental building blocks of many species of marine life, from coral
        to algae. Carbonate is also known to bond with stray Hydrogen ions to
        from bicarbonate, which cannot be used in these biological systems. pH,
        the way we measure acidity, is the measure of dissolved Hydrogen ions.
        As our previous graphs have shown, pH has been decreasing, meaing more 
        acidic water, and more loose Hydrogen ions to bond with Carbonate and
        from biologically useless Bicarbonate."),
      br(" "),
      p("The increased acidity is a twofold issue for carbonate. Because less 
        carbonate is present, the depth to which carbonate can penetrate is 
        shrinking, further reducing the range that life can access the limited 
        carbonate supplies. This life, like coral and most mollusks, require 
        carbonate to make calcified structures that they live in, or in the case
        of some plankton, build their skeleton out of. Without proper levels of 
        carbonate, these creatures will begin to die off. When these creatures 
        die off, not only will entire food webs collapse, but a potential runaway
        greenhouse effect could be triggered as many organisims that fixed carbon
        into a state that would remain out of the atmosphere for centuries are
        no longer able to do that."),
      br(" "),
      p("Unfortunatley, like most things working on a global scale, carbonate 
        levels fluxuate over time, making their analysis on a timeframe we have
        data for difficult. In our graphs we can see that the usual smooth cycles
        of both carbonates measured in our dataset are disrupted. Although the 
        end state of this cycle can be theorized, there is no absolute concensus
        as of now.")
    )
  )
)

# Interactive Page 3: map (Raina)
map_visualization <- tabPanel(
  "Q3. Map Visualization", 
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "year_select",
        label = "Observation Year",
        choices = c(2007:2017),
        selected = 2013
      ),
      p("Only 2012 and 2013 contain observations for all three sampled oceans.")
    ),
    mainPanel(
      h3("Which areas around the North American coastline are most affected by
         ocean acidification?"),
      leafletOutput(outputId = "interactive_map"),
      br(" "),
      h4("Average pH Level for Selected Year"),
      tableOutput(outputId = "grouped_table"),
      br(" "),
      h4("Takeaways"),
      p("This page shows both a visual and tabular representation of the pH
        levels of each Ocean, per year. The table has this information averaged
        for each year, whereas the map shows each individual measurement, scaled 
        larger the more acidic the sample was."),
      p("All oceans have become more acidic over the length of the data set,
        however it seems as though Arctic ocean has overall suffered the
        worst acidification. From 2010 to 2013, the average pH went from 8.21
        to 8.14. The numbers may seem relatively small, but as the National Oceanic and
        Atmospheric Administration explains, “the pH scale is logarithmic, so
        [a 0.1] change represents approximately a 30 percent increase in acidity”
        (NOAA, 2020). In other words, these small changes have massive
        ramifications for ocean life.")
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
  theme = bs_theme(
    bootswatch = "flatly",
      ),
  "The Impacts of Ocean Acidification", 
  introduction_page, 
  ph_visualization,
  calcite_visualization,
  map_visualization,
  summary_page,
  report_page
)

multipage_ui