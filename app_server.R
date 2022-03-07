library(dplyr)
library(ggplot2)
library(tidyverse)
library(leaflet)
library(tigris)

data <- read.csv('data/global_dataset.csv') 
gdp_data <- read.csv('data/gdp_dataset.csv') 
raw_state_data <- read.csv('data/us_state_vaccinations.csv') 


# fix name (probably only a problem for my machine) -Ben
colnames(gdp_data)[1] <- "Country.Name"


# filtered data which have complete disaggregated data
data <- data %>%
  filter(
    Case...death.data.by.sex. == "Yes"
  )

#select 2020 GDP values
gdp_data <- gdp_data %>%
  
  select(Country.Name, X2020)

# print column names
data_colnames <- data %>%
  colnames()

# remove NA
data <- na.omit(data)

# change proportion of deaths from string to int

# remove % sign
data$Deaths....male. <- gsub("%$","",data$Deaths....male.)
data$Deaths....female. <- gsub("%$","",data$Deaths....female.)

data$Cases....male. <- gsub("%$","",data$Cases....male.)
data$Cases....female. <- gsub("%$","",data$Cases....female.)
# str to int
data$Deaths....male. <- strtoi(data$Deaths....male.)
data$Deaths....female. <- strtoi(data$Deaths....female.)

data$Cases....male. <- strtoi(data$Cases....male.)
data$Cases....female. <- strtoi(data$Cases....female.)

#merge data
data <- data %>%
  left_join(gdp_data, by = c("Country" = "Country.Name"))

# mean proportion of deaths / cases by gender
female_prop_deaths_mean <- mean(data$Deaths....female.)
male_prop_deaths_mean <- mean(data$Deaths....male.)
female_prop_cases_mean <- mean(data$Cases....female.)
male_prop_cases_mean <- mean(data$Cases....male.)






# plot for distribution of deaths and case proportions for Females
Gender_deaths_plot <- ggplot(data = data, aes(x = Cases....female.,
                                              y = Deaths....female.)) +
  geom_point() +
  labs(title = "Proportion of Deaths vs Proportion of Cases for Females", x = "Proportion of confirmed cases Female (%)", y = "Proportion of deaths in confirmed cases Female (%)")
Gender_deaths_plot





# plot for distribution of deaths and case proportions for Females
Male_deaths_plot <- ggplot(data = data, aes(x = Cases....male.,
                                            y = Deaths....male.)) +
  geom_point() +
  labs(title = "Proportion of Deaths for Males vs Proportion of Cases for Males", x = "Proportion of confirmed cases Male (%)", y = "Proportion of deaths in confirmed cases Male (%)")
Male_deaths_plot







top_15_country_deaths <- data %>%
  filter(Deaths.date == "2022/03/01") %>%
  arrange(desc(Deaths.where.sex.disaggregated.data.is.available)) %>%
  select(Country, Deaths.where.sex.disaggregated.data.is.available, Cases.where.sex.disaggregated.data.is.available, Proportion.of.deaths.in.confirmed.cases..Male.female.ratio.) %>%
  rename(Total_Deaths = Deaths.where.sex.disaggregated.data.is.available, Total_Cases = Cases.where.sex.disaggregated.data.is.available, Gender_Ratio = Proportion.of.deaths.in.confirmed.cases..Male.female.ratio.) %>%
  top_n(15)


top_15_country_bar_plot <- ggplot(data = top_15_country_deaths, aes(x = fct_inorder(Country),
                                                     y = Total_Deaths)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Top 15 Highest COVID Deaths by Country vs Gender", x = "Country", y = "Deaths from COVID") + theme(axis.text.x = element_text(angle = 90))

top_15_country_plot





state_data <- raw_state_data %>% 
  group_by(location) %>% 
  filter(date == max(date)) %>% 
  select(location, total_boosters_per_hundred)

states <- states(cb = T)


states_merged <- geo_join(states, state_data, "NAME", "location")
states_merged <- subset(states_merged, !is.na(total_boosters_per_hundred))

pal <- colorNumeric("Blues", domain = states_merged$total_boosters_per_hundred)



map <- leaflet(states_merged) %>%
   addTiles() %>% 
   addPolygons(data = states_merged,
               color = "black",
               opacity = 1,
               fillColor = ~pal(states_merged$total_boosters_per_hundred),
               fillOpacity = 1, 
               weight = 1, 
               smoothFactor = 0.8,
               popup = ~total_boosters_per_hundred) %>% 
   addLegend("bottomleft", pal = pal, values = states_merged$total_boosters_per_hundred, 
             layerId = "colorLegend", title = "Booster Shot %", opacity = 1)



#Server 

server <- function(input, output) {
    output$top_15_country_plot <- renderPlot({
      ggplot(data = top_15_country_deaths, aes(x = Country,
                                               y = input$ycol)) +
        geom_bar(stat = "identity", position = "stack") 
    })
    
  output$map <- renderLeaflet({
    leaflet(states_merged) %>%
      addTiles() %>% 
      addPolygons(data = states_merged,
                  color = "black",
                  opacity = 1,
                  fillColor = ~pal(states_merged$total_boosters_per_hundred),
                  fillOpacity = 1, 
                  weight = 1, 
                  smoothFactor = 0.8,
                  popup = ~total_boosters_per_hundred) %>% 
      addLegend("bottomleft", pal = pal, values = states_merged$total_boosters_per_hundred, 
                layerId = "colorLegend", title = "Booster Shot %", opacity = 1) %>% 
      setView(-100, 40, zoom = 2.5)
  })
  
}


















