library(shiny)
library(leaflet)
library(tigris)
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
                     h2("US Booster Distribution"),
                     p('This map displays the % of each states\'s population who has recieved at least 
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
    some countries with a higher GDP have a higher amount of cases and deaths. The gender ratio and GDP seem to not have a correlation,
    as the bar plot data is mostly level. This might mean that other factors such as timing can outweigh having more access to more resources
    and knowledge on fighting the virus. Furthermore, the data might not also account for COVID deaths that have not been recorded.'
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
      p("These scatter plots shows the distribution of cases and deaths for both Males and Females. The distributions shows
        that males seem to have a higher proportion of cases and deaths. Additional research is needed into understanding why this
        data shows this. It would be interesting to see how testing is distributed in each country as well as that may point to
        why there is a discrepancy, or it may be due to gender roles being prominent, leading more women to stay at home compared
        to their male counterparts.")
    ),
    mainPanel(
      plotOutput('gender_scatter')
    )
  )
)


tab4 <- tabPanel("Conclusion",
                 p("It's indisputable that the COVID-19 pandemic has had a heterogenous
                   effect across various demographic lines. Analysis of US vaccine distribution
                   reveals that poorer states seem to have lower vaccination rates. Another reason
                   why the Southern United States portrays less vaccination rates is because of the
                   lifestyle and history behind the area. Due to being a historically racist area, 
                   the South has always had problems when dealing with healthcare providers and medical
                   systems. This has caused the rollout of vaccines/boosters to become slower because it
                   is harder to convince people in those areas to get it. When comparing 
                   case rates between countries, the line is not so clear, emphasizing the wide range 
                   of potentially important variables. Just by looking at GDP, we can tell that it is not
                   the best factor to try and make comparisons because even countries with high GDPs have
                   a lot of cases and deaths. This can be attributed to the fact that these countries have
                   a larger population, so more people are susceptible to COVID-19. Interestingly, gender
                   analysis shows that overall, men are more likely to be diagnosed with COVID-19, and more
                   likely to pass away from it. There can be a myriad of reasons for this, but we believe that
                   it comes down to lifestyle and job types. For example, there are currently more men working
                   jobs in construction, transportation, and factories. These are the occupations which have the
                   higher rates for COVID-19 exposure and even deaths. In conclusion, the effects of COVID-19 seem
                   to be mediated by both gender and economic standing, but these variables are certainly not enough
                   to fully explain the virus' unequal fallout."),
         
)


ui <- navbarPage(title = "INFO 478: Covid 19",
                 tab1,
                 tab2,
                 tab3,
                 tab4
)
