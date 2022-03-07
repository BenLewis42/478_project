library(shiny)
library(leaflet)

tab1 <-  tabPanel("Introduction",
  tags$p(
    id = "Introduction",
    "Our research project’s purpose is to explore patterns in COVID-19 cases, deaths, and vaccination 
    rates and observe how factors such as location and factor impact these metrics.")
)

tab2 <- tabPanel("Map",
                 sidebarLayout(
                   sidebarPanel(
                     # radioButtons("plotType", "Plot type",
                     #              c("Scatter"="p", "Line"="l")
                     # )
                     h2("Booster Distribution"),
                     p('This map displays the % each states\'s population who has recieved at least 
                       one booster shot. This shows significantly lower booster rates in the Southern U.S.,
                       states which are known to be poorer on average. This demonstrates that economic inequality
                       within the US may affect vaccine distribution.')
                   ),
                   mainPanel(
                     leafletOutput("map")
                   )
                 )
)






# tab3 <- tabPanel(
#   plotOutput("top_15_country_plot")
# )
# 
# tab4 <- tabPanel(
# )


ui <- navbarPage("INFO 478: Covid 19",
                 tab1,
                 tab2
                 # tab3,
                 # tab4
)
