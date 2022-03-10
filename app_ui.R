library(shiny)
library(leaflet)
source("app_server.R")

tab1 <-  tabPanel("Introduction",
  p("The COVID-19 virus has ravaged through the world these past couple of years. Due its high tranmissability,
    it has spread extremely fast, and through its different variants, it has been able to become more dangerous and has
    learned to spread even faster. This was all predicted by scientists when they found this new respiratory disease, however,
    what was not predicted was how the virus was able to expose inequities in the world, with those of different demographics being
    impacted differently by the virus due to underlying factors."),
    tags$strong(
    id = "Introduction",
    "Our research project’s purpose is to explore patterns in COVID-19 cases, deaths, and vaccination 
    rates and observe how different factors, such as gender and economics impact these metrics."),
  p("This kind of analysis will allow us to find patterns which may help us further understand sturctures within our society. "),
  mainPanel(
           dataTableOutput('covid_stats_table')
  )
)

tab2 <- tabPanel("Map",
                 sidebarLayout(
                   sidebarPanel(
                     radioButtons("plotType", "Plot type",
                                  c("Scatter"="p", "Line"="l")
                      ),
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



tab3 <- tabPanel("Gender",
  pageWithSidebar(
    headerPanel('Exploring GDP against COVID Deaths, Cases, and Gender Ratio'),
    sidebarPanel(
      varSelectInput("ycol", label = "Select Y Value", y_variables, selected = "Total_Deaths"),
      p('This bar plot compares GDP across ten countries with the highest COVID-related deaths, cases, and proportion of deaths
    in confirmed COVID-19 cases (male to female ratio). This data shows The visualization demonstrates that surprisingly, 
    some countries with a higher GDP have a higher amount of cases and deaths. The gender ratio and GDP seem not have a correlation
    as the bar plot data is mostly level. This might mean that other factors such as timing can outweigh having more access to more resources and knowledge on fighting the virus. Furthermore, the data might 
    not also account for COVID deaths that have not been recorded.'
      ),
      ),
    mainPanel(
      plotOutput('top_10_country_bar_plot')
    )
    ),
  pageWithSidebar(
    headerPanel("Distribution of Deaths and Cases for Males and Females"),
    sidebarPanel(
      selectInput("select", label = h3("Select box"), 
                  choices = list("Female" = 1, "Male" = 2), 
                  selected = 1),
      fluidRow(verbatimTextOutput("mean"))
    ),
    mainPanel(
      plotOutput('gender_scatter')
    )
  )
)


tab4 <- tabPanel("Conclusion"
)


ui <- navbarPage(title = "INFO 478: Covid 19",
                 tab1,
                 tab2,
                 tab3,
                 tab4
)
