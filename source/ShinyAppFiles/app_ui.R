# Source
source('final_report.R', local = TRUE)

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
  titlePanel(
    h1("Introduction", align = "center")
    ),
  mainPanel(
    fluidRow(
      column(2),
      column(9,
        
        img(src = "coral_bleaching.jpg", height = 300, width = 750),
        p("A dying coral reef. Image Credit",a(
          "firstpost.com",
          href = "https://www.firstpost.com/tech/science/global-warming-has-been-the-cause-of-14-percent-of-the-worlds-coral-reefs-dying-out-finds-global-survey-10031741.html")),
        br(" "),
        p("The main question of this project is identifying the impacts and effects of
          ocean acidification on global ecosystems and economies. This question of 
          examining the impacts of ocean acidification is important because ocean 
          acidification threatens marine ecosystems, coastal communities, and the global 
          economy. To address this question we will examine a dataset that records
          pH levels of different bodies of water and explore the ramifications of ocean 
          acidification on marine life and shellfish industry."),
        br(" "),
        p("For more information about Ocean Acidification, this five-minute
          video is a great starting place:"),
        HTML('<iframe width="560" height="315" 
             src="https://www.youtube.com/embed/rFIE6B96O38" 
             title="YouTube video player" 
             frameborder="0" allow="accelerometer; 
             autoplay; clipboard-write; encrypted-media; 
             gyroscope; picture-in-picture" allowfullscreen></iframe>'),
        h6("What is Ocean Acidification? [Video]. NOAA.")
      ),
      column(1)
    )
  )
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

# Interactive Page 2: Calcite Visualization (Ben)
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

# Interactive Page 3: Map (Raina)
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

# Summary: (Caroline)
summary_page <- tabPanel(
  "Summary Takeaways",
  titlePanel(
    h1("Summary", align = "center")
  ),
  mainPanel(
    fluidRow(
      column(2, ),
      column(
        9,
        br(" "),   
        p("One of the main takeaways of this project is to quantify the impacts of 
        ocean acidification through the seawater biological and chemical parameters 
        including CO2 and pH level. The other main takeaway is to understand the 
        socioeconomic consequences of ocean acidification on economies and coastline 
        communities dependent on marine resources. The biogeochemical responses and 
        socioeconomic impacts of ocean acidification:"),
        br(" "),
        h4("Chemical Reactions of OA Changing Seawater Chemistry:"),
        p("Ocean acidification causes decreased pH levels and increased CO2 absorption
        over an extended period of time, changing the ocean’s chemistry and making 
        marine organisms sensitive to acidification variability. As recorded within
        the trend chart revealing the volatility of pH and fugacity CO2 levels 
        across North American shoreline from 2005 to 2015. "),
        br(" "),
        h4("Biogeochemical and Biological Responses to Ocean Acidification: "),
        p("With ocean acidification causing lower pH levels, it reduces the amount of 
        calcium carbonate concentration and minerals needed for skeletons and shells
        for marine organisms as identified in the chart. Decreases in calcium 
        carbonate leaves many parts of the ocean to be unsaturated making it 
        difficult for calcifying organisms to build and maintain their protective
        shells putting marine organisms and ecosystems at risk. "),
        br(" "),
        h4("The Emerging Global Threat of Ocean Acidification:"),
        p("Ocean acidification is a global issue that puts communities and economies 
        at risk that are dependent on marine resources by negatively impacting the 
        marine food web and ecosystem. With seawater acidity, causing environmental
        degeneration of the aquatic food web and ecosystems, it has negative social 
        and economic impacts of food insecurity and livelihoods. "),
        br(" "),
        h4("Reducing the impacts of Ocean Acidification to Protect Our Oceans Future:"),
        p("There is an undeniable causation between ocean acidification and carbon 
        pollution from anthropogenic climate change of burning fossil fuels and land
        use change. Stakeholders need to understand the significance and global 
        consequences of ocean acidification and climate change have on global health. 
        Sustained efforts of monitoring and observing seawater acidification 
        worldwide is critical for protecting coastal communities and populations. 
        By dramatically reducing carbon emissions immediately, we can work to 
        protect the socioecological future by maintaining seawater chemistry and 
        marine biodiversity to limit the threats of ocean acidification.  ")
    ),
    column(1)
  )
  )
)
    
# Report: (Caroline)
report_page <- tabPanel(
  "Report",
  report_contents
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