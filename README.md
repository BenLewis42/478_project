###### INFO478 Project Proposal
###### Niha Gaddam, Tadeus Kartawijaya, Ben Lewis, Rishi Goyal

## **Project Description**

**What is the purpose of your research project?**

Our research project's purpose is to explore patterns in COVID-19 vaccination rates and deaths in the United States related to other factors such as age, gender, race/ethnicity, socioeconomic status, etc.


**What other research has been done in this area? Make sure to include 3+ links to related works, as well as a summary of what that work has discovered.**

1. https://academic.oup.com/cid/article/72/4/703/5860249?login=false 
This journal found that African American, LatinX, and Native American communities have been hit the hardest by Covid-19, manifesting in a disproportionate number of hospitalizations and deaths in these communities.

2. https://www.frontiersin.org/articles/10.3389/fgwh.2021.761511/full
This research article stated that men and women have a similar rate of COVID cases. However, men are three times likely to be admitted into intensive care, and have a 40% higher chance of COVID-related death compared to women. Thus, the article wanted to determine if women and men were equally represented in each vaccine's research, if the outcomes of studies were presented or analysed by sex and/or gender, and if there is evidence of sex and/or gender differences in outcomes (Harris et al.). The researchers found that there was a lack of sex/gender-specific evidence across COVID-19 vaccine experimental research studies and observational reports (Harris et al.).

3. https://www.mdpi.com/2076-393X/9/7/767
This study was done to show past experience of racial discrimination is a predictor of hesitancy towards COVID-19 vaccines, with a 21% increase in hesitancy in those who reported experiencing racial discrimination
.

**What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be. You must find at least two data sources at this stage.**

CDC dataset: https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-County/8xkx-amqh/data

This dataset was collected and published by the CDC. It is accessible through the CDC website. It was created on May 2021 and is still being updated. This data set displays Covid-19 vaccinations county-by-county in the USA. 

Kaggle dataset: https://www.kaggle.com/paultimothymooney/usa-covid19-vaccinations

This dataset was collected by ourworldindata and Edouard Mathieu. It is accessible on Kaggle. It displays state by state data on COVID-19 vaccinations in the USA. 


**Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset. You should hone in on one of these audiences.**

Our primary target audience is american policymakers, as they would be able to utilize our data and the findings we develop in order to inform their decisions on how to focus and augment vaccination efforts in the future. 


**What should your audience learn from your resource? Please consider specific questions that your project can answer using the data you have identified (that are related to the overarching purpose)**

1. What are some of the different predictors of deviance in vaccination rate?

2. Which of these predictors have a positive effect on number of vaccinations, and which have a negative effect?

3. How have the vaccination rates changed over time in relation to these different predictors?


## **Technical Description**
**What will be the format of your final product (Shiny app, HTML page, compiled .Rmd file, etc)?**

Shiny App, using visualization tools through R.


**Do you anticipate any specific data collection / data management challenges?**

1. The CDC database is huge and will require significant filtering / cleaning in order for us to use it effectively.

2. It may be difficult to find demographic informations on vaccinations, as we wish to analyze on variables like race and sex.


**What new technical skills will need to learn in order to complete your project?**

We will need to review widget design / coding and more complex, readable R visualization.


**What major challenges do you anticipate?**

We anticipate that the majority of the challenge will be in cleaning our data and creating effective visualizations.
