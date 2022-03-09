# Final Report
library(shiny)

report_contents <-
  mainPanel(
  h1("The Impacts of Ocean Acidification"),
h6("Winter 2022"),
br(" "),
h4("Code Name"),
p("Project_Shell"),
br(" "),
h4("Authors:"),
p("Benjamin Nickerson (nickben@uw.edu)"),
p("Caroline Wills (cwills07@uw.edu)"),
p("Raina Scherer (rainacs@uw.edu)"),
p("Zach Kornas (zkornas@uw.edu)"),
br(" "),
h4("Affliation"),
p("  INFO-201: Technical Foundations of Informatics - The Information School 
- University of Washington"),
br(" "),
h4("Abstract"),
p("  The main question of this project is identifying the impacts and effects of
ocean acidification on global ecosystems and economies. This question of 
examining the impacts of ocean acidification is important because ocean 
acidification threatens marine ecosystems, coastal communities, and the global 
economy. To address this question we will compare different datasets that record
pH levels of different bodies of water and the ramifications of ocean 
acidification on marine life and shellfish industry. "),
br(""),
h4("Keywords"),
p("
- Climate change
- Ocean Ecosystems
- Ocean Acidification
- CO2
- Economy
- Sea Life"),
br(""),
h2("1.0 Introduction"),
p("  The world’s oceans are threatened by a biological process in the oceans
referred to as ocean acidification which is the reduction in ocean’s pH levels
over an extended period of time caused by the uptake of carbon dioxide in the
atmosphere as a result of the burning of fossil fuels and land use changes. 
With an increased amount of CO2 being absorbed into the oceans, it causes
seawater acidification resulting in less carbonate ions which are the building 
blocks for many marine organisms. Less carbonate ions and seawater acidification 
as a result of ocean acidification significantly decreases the calcium carbonate
structures difficult for calcifying organisms threatening marine organisms and 
ecosystems. Ocean acidification negatively affects marine organisms, ecosystems
and economies dependent on fishing and shellfish industries. The objective of 
this project is to inform stakeholders such as constituents and policymakers on 
the adverse effects of ocean acidification on global economic and environmental 
health by examining the chemical process and biological changes of the North 
American coastline caused by ocean acidification. We will visualize data to show 
the changing seawater acidity levels, and interpret the impact of the changing 
pH levels on different marine ecosystems and the economies that are dependent 
on them. By understanding the effects of ocean acidification through this 
project by investigating the areas most impacted by ocean acidification and by 
analyzing the chemical and biological changes in the ocean from 2003 to 2018, 
we can make an argument to protect marine ecosystems and work to reduce the use 
of fossil fuels to limit ocean acidification caused by human activities. "),
# Video goes here, maybe. Maybe on intro page?
br(""),
h2("2.0 Design Situation"),
h4("Project Framing"),
p("  This project is designed around a global concern of ocean acidification 
and marine ecosystems by examining the impacts of how anthropogenic production 
of CO2 impacts aquatic and human health from ecological and economic viewpoints.
This is a project of comparisons, aimed to reveal the correlations between 
different datasets to create a broader understanding of the various ways in 
which people and the environment are impacted."),
br(""),
h4("Human Values"),
p("The human values of this project encompass a comprehensive set of values 
concerning human interactions and impacts on the physical environment. The main
value of this project is to improve global environmental sustainability and 
stewardship as ocean acidification harms marine ecosystems and coastal 
communities. The other human value of this project is climate justice as ocean 
acidification threatens livelihood, food security, socio-economic security and 
coastal communities."),
br(""),
h4("Direct Stakeholders"),
p("The direct stakeholders of this project include our workgroup, the teaching 
team, and any users of the end data project such as policymakers and 
constituents."),
br(""),
h4("Indirect Stakeholders"),
p("The indirect stakeholders of the end data user product include as 
environmental and aquatic health concerns the worldwide population. In 
particular the project focuses on impacts of ocean acidification affecting 
shellfish industry professionals, communities who depend on marine life as a 
food source, and coastal groups of people. "),
br(""),
h4("Possible Harms and Benefits"),
p("Our goal for this project is that it will benefit the public and politicians 
by providing important data on the current effects of ocean acidification, 
leading to increased interest in the issue and a broader effort to address this
problem. A possible harm of our work could come from a lack of particular 
expertise in oceanography, leading us to miss important information or ask the 
wrong questions of our data. This, in turn, could direct stakeholder's a
ttention away from more actionable issues and towards what this project focuses 
on. Through this project, the hope is to reduce the risk of harm from ocean 
acidification by consulting existing research on ocean acidification and human 
impact, in order to become more well-informed as to the current body of 
knowledge. "),
br(""),
h2("3.0 Research Questions"),
p("The first question is:",
  strong(
    "How have pH levels changed in oceans from 2005 to 2015?"), 
  "This question reveals the chronological chemical changes of pH levels within 
  seawater."),
p("The second question is:",
  strong(
    "How will the changes in calcite levels impact marine ecosystems?"), 
  "This question allows the user to understand how changes in calcite levels 
  affect marine ecosystems and ocean acidification through calcifying
  organisms."),
p("The third question is:",
  strong(
    "Which areas around the North American coastline are most affected by ocean 
    acidification?"), 
  "This question is important because it allows the user to understand the 
  magnitude of the impacts of ocean acidification by identifying key areas of 
  areas impacted by ocean acidification. "),
br(""),
h2("4.0 The Dataset"),
h4("Origin"),
p("The dataset used for this project to analyze the implications of ocean 
acidification is from the National Centers for Environmental Information 
[Coastal Open Data Analysis Product in North America]
(https://www.ncei.noaa.gov/data/oceans/ncei/ocads/metadata/0219960.html). 
This dataset was recorded along the seawater shorelines bordering North America.
The purpose of this dataset is to record the changes of seawater acidification
through specific oceanic parameter variables along the entire continental 
shelves of North America over the span of nearly two decades (Jiang, 2021).
According to Dr. Richard A. Feely the intention of this dataset is to help 
coastal enterprises and decision-makers develop strategies to adapt to the 
severity of ocean acidification and promote more OA research within the U.S. 
Exclusive Economic Zone (Jiang, 2021)."),
br(""),
h4("Complexity"),
p("This dataset is comprised of 14 different chemical variables and oceanic 
parameters within of ocean acidification including temperature, salinity, oxygen
, nutrients, pH, calcium carbonate, mineral saturation states, dissolved 
inorganic carbon, and total alkalinity depicting the chemical impacts of 
ocean acidification through the changes in pH levels and other chemical chain
reaction variables. It is important to note as well that the data was collected
from multiple sites along the North American coasts, increasing the overall 
complexity of the data and allowing us to gain insight into the greater impact
of ocean acidification . By comparing this dataset to recent data on 
environmental and economic impacts recorded specifically within coastal 
communities and shellfish industries during the time of documentation of the 
dataset, the socioeconomic impacts of aquatic acidification can be identified 
and understood."),
br(""),
h4("Size"),
p("The first dataset is collected over two decades made up of over 3,000 
oceanographic profiles from 61 research ships. There are over 28,000 
observations made in the dataset, each with multiple oceanic and chemical 
parameter variables recorded. "),
br(""),
h2("5.0 Findings"),
p("According to our findings of this project, we were able to answer the first 
question by finding the changes of pH levels in the month of January in 2005, 
2010, and 2015. Through this chart we found that there has been an average 
steady decrease of pH levels in the ocean by 0.1 within a span of 10 years. 
This data reveals that by comparing the pH level variability from 2005 to 2015 
in the month of January that ocean acidification is decreasing chronologically 
showing the chemical reactions of ocean acidification."),
p("Through analyzing the changes in calcium carbonate levels over an extended 
period of time from the chart it allows us to understand the impacts of ocean 
acidification on marine ecosystems. This is due to the fact that as ocean 
acidification increases, it adversely decreases the amount of carbonate ions 
available for calcifying organisms to construct and maintain their calcium 
carbonate skeletons, harming marine organisms and ecosystems. "),
p("By identifying the key areas on the given map of ocean acidification around 
the North American shoreline, we are able to answer the third research question 
of which areas are most impacted by ocean acidification. From the map, we can 
see that according to the dataset observations, the areas most affected by 
chemical reactions and biological processes caused by ocean acidification is 
along the shoreline of the West Coast. "),
br(""),
h2("6.0 Discussion"),
p("  These findings demonstrate the altering of seawater chemistry by analyzing
the biological responses and chemical reactions of ocean acidification across 
the North American continent shoreline reveal the consequences of anthropogenic 
action on marine organisms and ecosystems. By identifying and quantifying the 
threats ocean acidification has on the chemical composition of the oceans and 
coastal water, we can understand the relationship between marine ecosystem
health and human actions increasing global warming and ocean acidification."),
p("The implications of ocean acidification impact global ecosystems and 
economies from marine organisms and ecology to the shellfish industry as shown 
in the 2015 study examining the risk that ocean acidification has on the Alaskan
fishery sector. This study found that “Sensitivity, or the degree of economic 
and nutritional reliance of the human community on OA-susceptible species, 
makes up one half of vulnerability” (Mathis et al., 2015). This research found 
that socioeconomic stability for Alaskan communities was dependent on the 
shellfish industry negatively impacted by ocean acidification resulting in 
economic losses. According to a study conducted by the NCBI synthesizing the 
independent research of 228 studies “reveal decreased survival, calcification, 
growth, development and abundance in response to acidification when the broad 
range of marine organisms is pooled together.” This study reveals the 
vulnerability and variability of marine organisms and ecosystem health to
aquatic acidification. "),
p("Global climate variability such as rapidly increasing temperatures and ocean 
acidification causing biological responses in the ocean’s chemistry threaten
marine biodiversity and ecosystems and human communities and economies dependent
on marine resources. The implications of disrupting the world’s oceans chemistry
and environment through ocean acidification negatively impact the socioecological
relationship between global ecosystems and ecology. Ocean acidification and its
implications is a direct consequence of human activity of burning fossil fuels
and land change since the Industrial Era causing the absorption of CO2 from the
atmosphere in the ocean. We must take decisive action to mitigate the threats
of aquatic acidification to vulnerable communities and environments by
implementing solutions to drastically reduce the dependency of fossil fuels and
worldwide investment in renewable energy sources to protect global ecosystems, 
economies, and communities. "),
br(""),
h2("7.0 Conclusion "),
p("  Ocean acidification caused by the uptake of carbon dioxide as a result of
carbon emissions results in changes in ocean chemistry due to lower pH levels 
and high CO2 levels decreases calcium carbonate harming calcifying organisms. 
With calcifying organisms unable to build or  maintain their shells and 
skeletons, marine life and ecosystems are endangered. The vulnerability of 
marine ecology has socioecological and economic impacts on global communities
with unexpected changes in food security and livelihoods. By examining the 
impacts of ocean acidification through the biological responses within seawater
compounds, we can take decisive action to mitigate the threats of ocean 
acidification and climate change. "),
br(""),
h2("Acknowledgements"),
p("Thank you to Marina V. in the UW library 24 hour chat for helping us find
some helpful datasets!"),
br(" "),
h2("References"),
p("  Jiang, et al. (2021, August 10). Coastal Ocean Data Analysis Product in 
North America (CODAP-NA, Version 2021) (NCEI Accession 0219960). 
National Centers for Environmental Information; National Centers for 
Environmental Information."),
p("Jiang, et al. (2021, June 16). Ocean acidification data for coasts. National
Centers for Environmental Information (NCEI). Retrieved February 4, 2022, from 
https://www.ncei.noaa.gov/news/ocean-acidification-data-coasts"),
p("Hardt, M. (2022). Covering Ocean Acidification: Chemistry and Considerations
 Yale Climate Connections. Yale Climate Connections. Retrieved 9 March 2022, 
 from 
 https://yaleclimateconnections.org/2008/06/covering-ocean-acidification-chemistry-and-considerations/.
"),
p("Smithsonian Ocean. (2019, June 20). Ocean Acidification. 
https://ocean.si.edu/ocean-life/invertebrates/ocean-acidification"),
p("Thomas Frank, E&E News. (2020, January 3). Ocean Acidification Threatens 
the U.S. Economy. Scientific American. Retrieved March 2, 2022, from 
https://www.scientificamerican.com/article/ocean-acidification-threatens-the-u-s-economy/
"),
p("  NOAA. (2021, February 26). What is Ocean Acidification? [Video]. NOAA. 
https://oceanservice.noaa.gov/facts/acidification.html"),
p("Mathis, J., Cooley, S., Lucey, N., Colt, S., Ekstrom, J., Hurst, T., 
  Hauri, C., Evans, W., Cross, J., & Feely, R. (2015). 
  Ocean acidification risk assessment for Alaska’s fishery sector. 
  Progress in Oceanography, 136, 71–91. 
  https://doi.org/10.1016/j.pocean.2014.07.001")
)