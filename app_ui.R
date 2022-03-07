library(shiny)
library(leaflet)

tab1 <-  fluidPage(
  h1("Introduction"),
  tags$p(
    id = "Introduction",
    "Our research project’s purpose is to explore patterns in COVID-19 cases, deaths, and vaccination 
    rates and observe how factors such as location and factor impact these metrics.")
)

tab2 <- fluidPage(
  leafletOutput("map"))


tab3 <- fluidPage(
  vars <- setdiff(names(data), "Country")
  pageWithSidebar(
    headerPanel('Top 15 Highest COVID Deaths by Country vs Gender'),
    sidebarPanel(
      selectInput('xcol', 'X Variable', vars),
      selectInput(inputId = "selectedvariable", label = "Select a gender", choices = c("Male_Deaths","Female_Deaths")),
    mainPanel(
      plotOutput('top_15_country_plot')
    )
  )
)

tab4 <- fluidPage(
)


ui <- navbarPage("INFO 478: Covid 19",
                 tabPanel("Introduction", tab1),
                 tabPanel("Location", tab2),
                 tabPanel("Gender", tab3),
                 tabPanel("Conclusion", tab3)
)
