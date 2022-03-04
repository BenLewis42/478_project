library(shiny)
library(leaflet)



ui <- navbarPage("My Application",
                 tabPanel("Component 1"),
                 tabPanel("Component 2",
                          leafletOutput("map")),
                 tabPanel("Component 3")
)
