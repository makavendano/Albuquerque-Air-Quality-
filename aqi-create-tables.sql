-- Creating tables for important information that will be useful in a dashboard 
CREATE TABLE site_usage_total 
AS 
SELECT site_name, 
	   COUNT(*) as count_of_site_name
FROM all_years
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY site_name
ORDER BY count_of_site_name DESC

SELECT * 
FROM site_usage_total

-- Main pollutant table 
CREATE TABLE main_pollutant
AS
SELECT YEAR(reportdate) as year,
	   mainpollutant, 
	   COUNT(*) as count_of_mainpollutant
FROM all_years
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY mainpollutant, year

SELECT * 
FROM main_pollutant

-- Yearly average aqi's 
CREATE TABLE yearly_aqi_average
AS 
SELECT reportdate, AVG(aqivalue)
FROM all_years 
GROUP BY YEAR(reportdate)

SELECT * 
FROM yearly_aqi_average

CREATE TABLE monthly_aqi_average
AS
SELECT reportdate, 
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
GROUP BY MONTH(reportdate), YEAR(reportdate)

SELECT * 
FROM monthly_aqi_average
