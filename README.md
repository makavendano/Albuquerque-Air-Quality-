<h1 align="center">Albuquerque Air Quality</h1>

## Table of Contents 
1. [Objectives](https://github.com/makavendano/Data-Analysis-Portfolio/blob/main/Albuquerque-Air-Quality/ReadMe.md#objectives)
2. [Overview of the Data](https://github.com/makavendano/Data-Analysis-Portfolio/blob/main/Albuquerque-Air-Quality/ReadMe.md#overview-of-the-data)
3. [Data Cleaning](https://github.com/makavendano/Data-Analysis-Portfolio/blob/main/Albuquerque-Air-Quality/ReadMe.md#data-cleaning)
4. [Data Exploration](https://github.com/makavendano/Data-Analysis-Portfolio/blob/main/Albuquerque-Air-Quality/ReadMe.md#data-exploration)
5. [Data Visualization](https://github.com/makavendano/Data-Analysis-Portfolio/blob/main/Albuquerque-Air-Quality/ReadMe.md#data-visualization)
6. [Summary - Main Points Wrapped Up](https://github.com/makavendano/Data-Analysis-Portfolio/blob/main/Albuquerque-Air-Quality/ReadMe.md#summary---main-points-wrapped-up)

## Objectives
As an explorer in the world of data analytics, this project is a way to showcase data cleaning and exploration with MySQL and data visualization with PowerBI and Tableau. This project is intended to explore the air quality in Albuquerque, New Mexico and the surrounding areas over the past 5 years: 2018 to 2022.

Air quality is important to overall health as humans and can affect us in multiple ways. Livability relies heavily on the quality of air within certain areas and contributes to healthy communities. Air pollution can lead to heart attacks, heart disease, and lung cancer among other diseases. On the contrary, healthy air prevents heart attacks, lung cancer, and both acute and severe asthma.

## Overview of the Data <a name="overview-of-the-data"></a>
This data set includes daily air quality index (AQI) values recording from different sites throughout Albuquerque, NM and the surrounding areas. This dataset was found while researching environmental data sets through our local governments database. The dataset is divided up yearly into air quality index (AQI) values that were recorded daily. We are looking at 6 main air pollutants: ground – level ozone (O3 or Ozone), particle pollution (divided into 2 pollutants PM10 and PM2.5), Carbon Monoxide (CO), Sulfur Dioxide (SO2), and Nitrogen Dioxide (NO2). Air quality index (AQI) was recorded at 8 different sites within Albuquerque, New Mexico and it’s surrounding areas. The overall AQI recording is read based on the parameters in the photo below (figure 1). 

<p align="center">
  <img src="https://user-images.githubusercontent.com/73861849/215357292-97a100bb-7fa6-4230-bfbd-f4d169385f7e.png">
</p>
<p align="center">
Figure.1 - Air Quality Index (AQI) value description indicating how harmful and the level of concern.
</p>

The data was gathered from the United States Enviornmental Protection Agency and was gathered using the given query tool. Five excel sheets were gathered for each seperate year.

The dataset includes the following fields: 

| Field | Description |
| :-: | --- |
| reportdate | The date in which the air quality index (AQI) value was recorded. |
| aqivalue | The air quality index (AQI) that was recorded. |
| mainpollutant | The main pollutant recorded. | 
| site_name | The name of the site the air quality index (AQI) was recorded at. |
| site_id | The id of the site the air quality index (AQI) was recorded at. |
| CO | Carbon Monoxide (a main pollutant) indicates value recorded. |
| Ozone | Ground-level ozone or O3 (a main pollutant) indicates value recorded. |
| PM10 | Particle Pollution (a main pollutant) indicates value recorded. |
| PM25 | Particle Pollution (a main pollutant) indicates value recorded. |
| NO2 | Nitrogen Dioxide (a main pollutant) indicates value recorded. |


## Data Cleaning <a name="data-cleaning"></a>
Code: [Data Cleaning](https://github.com/makavendano/Albuquerque-Air-Quality-/blob/main/aqi-data-cleaning.sql) 

All 5 Excel sheets for each year were imported into MySQL.

1. After importing all years of data into MySQL, a seperate table was created to congregate all data into one table to make cleaning and exploring data easier.
2. Column names were then adjusted to get rid of spaces and parentheses to make exploration easier. 
3. Lastly, an unneeded column was deleted to clear up clutter and make things easier to read.

The data had missing Site Names with only Site IDs filled in. Research was conducted to fill in the missing Site ID values. 

4. Found missing Site Name values based on filled in Site IDs.  
5. Based on the research, fill in the missing Site Names. 
6. Finally, update Site Names to proper case in order to make things look more clean.

## Data Exploration <a name="data-exploration"></a>
Code: [Data Exploration](https://github.com/makavendano/Albuquerque-Air-Quality-/blob/main/aqi-data-exploration.sql)

Initially, I wanted to focus on average air quality index (AQI) values in order to make a comparision and find trends amongst the data. The first query I ran was to gather all monthly averages over all 5 years. 

### Averages 
While looking at this data, I identified that summer months (June, July, and August) tend to be higher AQI values meaning that air quality is worse in the summer time. This is not a _new_ observation as overall air quality tends to be worse in the summer months due to the high temperatures and the high amounts of sunlight. Comparatively, the winter months tend to be on the lower end of the spectrum with lower AQI values and better overall air quality. This can be due to a number of factors including lower temperatures and lower amounts of sunlight. 

_Disclaimer - This is not always the case as some areas do tend to have opposite results as summer months tend to be lower AQI values and winter tends to be higher. This is just specific for Albuquerque, NM._

<center>
<table>
<tr><th>Summer Month AQI Values </th><th>Winter Month AQI Values</th><th>Yearly AQI Values</th></tr>
<tr><td>

| Date | Average Air Quality (AQI) Value |
| :-: | :-: |
| July 2018 | 91.9677 | 
| July 2022 | 89.3333 |
| July 2021 | 85.9032 |
| June 2021 | 79.8667 |
| August 2018 | 77.7742 |
| August 2020 | 72.4667 |
| August 2021 | 71.4194 |
| June 2018 | 70.3793 |
| June 2019 | 70.2667 |
| August 2022 | 69.3226 |
| July 2019 | 67.2258 |
| August 2019 | 64.1613 |
| June 2022 | 63.0000 |
| June 2020 | 61.0000 |
| July 2020 | 58.1613 |

</td><td>


| Date | Average Air Quality (AQI) Value |
| :-: | :-: |
| December 2021 | 70.7097 | 
| January 2022 | 68.6774 |
| November 2021 | 65.8000 |
| December 2020 | 61.9355 |
| January 2018 | 60.9032 |
| January 2021 | 60.3548|
| November 2020 | 56.4333 |
| November 2019 | 56.1000 |
| December 2019 | 51.1613 |
| November 2018 | 50.7667 |
| January 2019 | 48.9677 |
| November 2022 | 48.8333 |
| December 2022 | 47.5806 |
| December 2018 | 47.0645 |
| January 2020 | 46.1613 |

</td><td>

| Year | Average Air Quality (AQI) Value |
| :-: | :-: |
| 2018 | 60.8287 | 
| 2019 | 56.1484 | 
| 2020 | 58.2893 | 
| 2021 | 66.0167 | 
| 2022 | 60.7885 | 

</td></tr> </table>
</center>

### Air Quality Index (AQI) Descriptors 
Our next focus was how harmful the air is based on the air quality index (AQI) values. There are 6 categories of harm:

<center>

| AQI Value Range | Descriptor | 
| :-: | :-: |
| 0 - 50 | Good | 
| 51 - 100 | Moderate | 
| 101 - 150 | Unhealthy for Sensitive People | 
| 151 - 200 | Unhealthy | 
| 201 - 300 | Very Unhealthy | 
| 300+ | Hazardous | 

</center>

All descriptors were looked at individually. The areas we focused on were comparing counts of each descriptor over all 5 years along with comparing monthly averages. 

The results indicated that the majority of the 5 years were spent within the Moderate air quality range. We also luckily only experienced 1 very unhealthy day and 1 hazardous day throughout the 5 years being studied. The results show as follows: 

<h3><center>Monthly Averages</center></h3>

<center>

| AQI Descriptor | Count of Monthly Averages | Percent of Averages |
| :-: | :-: | :-: |
| Good | 13 | 22% | 
| Moderate | 47 | 78% | 

</center>

<h3><center>All days throughout the 5 years</center></h3>

<center>

| AQI Descriptor | Count of All Days | Percent of Days |
| :-: | :-: | :-: |
| Good | 667 | 37% | 
| Moderate | 1063 | 58% | 
| Unhealthy for Sensitive People | 74 | 4% | 
| Unhealthy | 6 | 0.03% | 
| Very Unhealthy | 1 | 0.0005% |
| Hazardous | 1 | 0.0005% |

</center>

### Maximuim and Minimuim Values 
The lowest maximuim value in a month was in October 2018 with a value of 46 compared to its monthly average 37. The highest maximuim value was in January 2022 with a value at 331 compared to its monthly average 69. The lowest minimuim value was in September 2020 compared to its monthly average of 66. The highest minimuim value was in July 2022 with a value of 54 compared to its monthly average of 89.  

### Main Pollutants
Ozone was found to be the most dominant pollutant. Ozone was the main pollutant 60% of the time throughout the 5 years with PM2.5 and PM10 being the main pollutant around 20%. Below is a table of how often a pollutant was considered the main pollutant within each given year. 

<center>

| Pollutant | 2018 | 2019 | 2020 | 2021 | 2022 | 
| :-: | :-: | :-: | :-: | :-: | :-: |
| Ozone | 253 | 246 | 195 | 169 | 220 |
| PM 10 | 53 | 49 | 82 | 123 | 54 |
| PM 2.5 | 55 | 69 | 86 | 67 | 90 |
| NO2 | 1 | 0 | 0 | 0 | 0 |

</center>

### Recording Sites
Site usage is important when comparing the overall air quality index (AQI) values. These sites are in different areas of the city which could cause the readings of the air quality values to vary depending on which area was recorded. The areas that had the lowest AQI value are areas of smaller populations due to the lack of urbanization and less people overall. Los Lunas and Santa Ana Pueblo had the lowest average AQI with values of 53 and 47 respectively. These areas are both outskirt cities and areas that have smaller populations. This information also leads to the observation that even though these cities had the lowest average AQI, these sites were also used less than 5% throughout the 5 years. Foothills which had an average AQI of 58 was used 33% of the time throughout the 5 years. South Valley was used 21%, Del Norte High School 15%, North Valley 12%, Jefferson 9%, Los Lunas 5%, Bernalillo 4% and Santa Ana Pueblo 1%. 

Figure 2 below is a photo of the site areas used. Sites described by the numbers: 

- 1: Los Lunas 
- 2: South Valley 
- 3: North Valley 
- 4: Jefferson 
- 5: Bernalillo 
- 6: Santa Ana Pueblo 
- 7: Del Norte High School 
- 8: Foothills 

<p align="center">
  <img src="https://github.com/makavendano/Albuquerque-Air-Quality-/blob/main/location-sites.png">
</p>
<p align="center">
Figure.2 - Sites used for recording air quality.
</p>

## Data Visualization 
Code: [Data Visualization](https://github.com/makavendano/Albuquerque-Air-Quality-/blob/main/aqi-create-tables.sql)

Tableau: [Data Visualization](https://public.tableau.com/app/profile/makayla.a.avendano/viz/AlbuquerqueAirQuality2018-2022/Dashboard12)

To better understand the air quality in Albuquerque, Tableau was used to visualize the information and show trends throughout the data. Below I will go into detail for each part of the dashboard: 

**Air Quality Index (AQI) Values per Year and Month:** Stacked Bar Chart using the AQI indicator colors to seperate the values. This is a way to look at average AQI values based on the air conditions presented each month and each year. 

**Main Pollutant Concentrations:** Stacked Bar Chart using pollutant concentrations and AQI values. This looks at pollutant concentrations based on average AQI both monthly and yearly. 

**Map of Sites used for Air Quality Index (AQI) Recordings:** A map of all the sites used throughout the 5 year recordings. This also shows how frequent each site was used with counts and percentages.

**AQI Indicators Count:** Stacked Bar Chart looking at how frequent we had good, moderate, or unhealthy air quality. 

**Main Pollutants Count:** Stacked Bar Chart looking at how often a pollutant was the main pollutant within the recorded air quality.  


Looking at this dashboard, a few trends are noticeable. As mentioned earlier, summer months tend to have worse air quality which is evident in these visuals. Both daily air quality and average air quality visuals have a noticeable increase when selecting different years. Another evident trend is the amount of ozone throughout the years. Ozone was the most dominant pollutant and it's evident throughout the visual. 

<p align="center">
  <img src="https://github.com/makavendano/Albuquerque-Air-Quality-/blob/main/AQI%20Dashboard.png">
</p>
<p align="center">
Figure.3 - Dashboard created for Albuquerque air quality data.
</p>


## Summary - Main Points Wrapped Up 
1. In Albuquerque, New Mexico, summer months tend to have worse air quality compared to winter months. 
2. Over the 5 years researched, Albuquerque air quality averaged moderate air quality 58% of the time and good air quality 37%. 
3. In January 2022, we had hazardous air quality conditions hitting a maximuim AQI value of 331. 
4. Ozone was the main pollutant 60% of the time over the 5 years. 
5. 8 recording sites were used with the Foothills location being used the most with an average AQI of 58 (in the moderate air quality range). 

