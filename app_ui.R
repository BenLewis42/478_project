library(shiny)
library(leaflet)


intro_panel <- tabPanel(
  "Vaccine",
  titlePanel("Plot"),
  leafletOutput("map")
  
)

second_panel <- tabPanel(
  "[Tab Title]",
  titlePanel("[Page Title]"),
  
)



ui <- navbarPage(
  intro_panel
  #second_panel
)