-- Monthly Averages over the last 5 years (2018 - 2022) 
SELECT reportdate, 
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
GROUP BY MONTH(reportdate), YEAR(reportdate)
ORDER BY avg_aqi ASC

-- Monthly Averages over the last 5 years (2018-2022) looking at the highest months 
SELECT reportdate, 
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
GROUP BY MONTH(reportdate), YEAR(reportdate) 
ORDER BY AVG(aqivalue) DESC
LIMIT 10

-- Average aqi values for summer months
SELECT reportdate, 
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
WHERE MONTH(reportdate) IN (6,7,8)
GROUP BY MONTH(reportdate), YEAR(reportdate) 
ORDER BY AVG(aqivalue) DESC


-- Averages each year 2018 - 2022 
SELECT reportdate, AVG(aqivalue)
FROM all_years 
GROUP BY YEAR(reportdate)

-- Monthly Averages over the last 5 years (2018-2022) looking at the lowest months 
SELECT reportdate, 
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
GROUP BY MONTH(reportdate), YEAR(reportdate) 
ORDER BY AVG(aqivalue)
LIMIT 10

-- Average aqi values for winter months
SELECT reportdate, 
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
WHERE MONTH(reportdate) IN (11,12,1)
GROUP BY MONTH(reportdate), YEAR(reportdate) 
ORDER BY AVG(aqivalue) DESC

-- GOOD AIR QUALITY 
-- Monthly Averages that are indicated as good air quality (Green - 0 to 50 AQI) 
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
  WHERE aqivalue BETWEEN 0 AND 50


-- Count of how many good air quality values over 5 years (13) 
SELECT COUNT(*) as count_of_records
FROM (
  SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
  WHERE aqivalue BETWEEN 0 AND 50
) as avg_aqi_subquery

-- Percent of average months with good air quality 
SELECT COUNT(*) / 60 as percent_of_good_months
FROM (
  SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
  WHERE aqivalue BETWEEN 0 AND 50
) as avg_aqi_subquery


-- All Good Air Quality days over 5 years
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  GROUP BY DAY(reportdate), MONTH(reportdate), YEAR(reportdate)
 WHERE aqivalue BETWEEN 0 AND 50

-- Count of all Good Air Quality days over 5 years (667)
SELECT COUNT(*) as count_of_good_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  GROUP BY DAY(reportdate), MONTH(reportdate), YEAR(reportdate)
  WHERE aqivalue BETWEEN 0 AND 50
) as aqi_subquery

-- Percent of all Good Air Quality days over 5 years (667)
SELECT COUNT(*) / 1826 as percent_of_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 0 AND 50
) as aqi_subquery

-- MODERATE AIR QUALITY 
-- Monthly Averages that are indicated as moderate air quality (Yellow - 51 to 100 AQI) 
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
WHERE aqivalue BETWEEN 51 AND 100

-- Count of how many moderate air quality values over 5 years (46) 
SELECT COUNT(*) as count_of_records
FROM (
	SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
 WHERE aqivalue BETWEEN 51 AND 100
)  as avg_aqi_subquery

-- Percent of how many moderate air quality values over 5 years (46) 
SELECT COUNT(*) / 60 as percent_of_moderate
FROM (
	SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
  WHERE aqivalue BETWEEN 51 AND 100
)  as avg_aqi_subquery

-- All Moderate Air Quality days over 5 years
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 51 AND 100

-- Count of all Moderate Air Quality days over 5 years (667)
SELECT COUNT(*) as count_of_moderate_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 51 AND 100
) as aqi_subquery

-- Percent of all Moderate Air Quality days over 5 years (667)
SELECT COUNT(*) / 1826 as percent_of_moderate_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 51 AND 100
) as aqi_subquery

-- UNHEALTHY FOR SENSITIVE PEOPLE
-- Monthly Averages that are indicated as "Unhealthy for sensitive people" (Orange - 101 to 150) 
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
 WHERE aqivalue BETWEEN 101 AND 151

-- Count of how many Unhealthy for sensitive people air quality values over 5 years (0) 
SELECT COUNT(*) as count_of_records
FROM (
	SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         AVG(aqivalue) as avg_aqi
  FROM all_years 
  WHERE aqivalue BETWEEN 101 AND 151
)  as avg_aqi_subquery

-- All Unhealthy for sensitive people Air Quality days over 5 years
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
 WHERE aqivalue BETWEEN 101 AND 151

-- Count of all Unhealthy for sensitive people Air Quality days over 5 years (667)
SELECT COUNT(*) as count_of_sensitive_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 101 AND 151
) as aqi_subquery

-- Percent of all Unhealthy for sensitive people Air Quality days over 5 years (667)
SELECT COUNT(*) / 1826 as percent_of_sensitive_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
 WHERE aqivalue BETWEEN 101 AND 151
) as aqi_subquery

-- UNHEALTHY 
-- All Unhealthy Air Quality days over 5 years
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
 WHERE aqivalue BETWEEN 151 AND 200

-- Count of all Unhealthy Air Quality days over 5 years (667)
SELECT COUNT(*) as count_of_unhealthy_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 151 AND 200
) as aqi_subquery

-- Percent of all Unhealthy Air Quality days over 5 years (667)
SELECT COUNT(*) / 1826 as percent_of_unhealthy_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 151 AND 200
) as aqi_subquery

-- VERY UNHEALTHY 
-- All Very Unhealthy Air Quality days over 5 years
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
 WHERE aqivalue BETWEEN 201 AND 300

-- Count of all Very Unhealthy Air Quality days over 5 years (667)
SELECT COUNT(*) as count_of_very_unhealthy_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 201 AND 300
) as aqi_subquery

-- Percent of all Very Unhealthy Air Quality days over 5 years (667)
SELECT COUNT(*) / 1826 as percent_of_very_unhealthy_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
  WHERE aqivalue BETWEEN 201 AND 300
) as aqi_subquery

-- HAZARDOUS
-- All hazardous Air Quality days over 5 years
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
 WHERE aqivalue >=300 

-- Count of all hazardous Air Quality days over 5 years (667)
SELECT COUNT(*) as count_of_hazardous_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
  FROM all_years 
WHERE aqivalue >=300 
) as aqi_subquery

-- Percent of all hazardous Air Quality days over 5 years (667)
SELECT COUNT(*) / 1826 as percent_hazardous_days
FROM (
SELECT MONTH(reportdate) as month, 
         YEAR(reportdate) as year,
         aqivalue
FROM all_years 
WHERE aqivalue >=300 
) as aqi_subquery


-- MAX and MIN VALUES
-- Max AQI values per month 
SELECT reportdate, 
	   MAX(aqivalue) AS Max_AQI
FROM all_years 
GROUP BY MONTH(reportdate), YEAR(reportdate)
ORDER BY Max_AQI

-- Comparing to monthly averages to the monthly max values 
WITH avg_aqi AS (
  SELECT MONTH(reportdate) AS month, 
         YEAR(reportdate) AS year,
         AVG(aqivalue) AS avg_aqi
  FROM all_years 
  GROUP BY MONTH(reportdate), YEAR(reportdate)
),
max_aqi AS (
  SELECT MONTH(reportdate) AS month, 
         YEAR(reportdate) AS year,
         MAX(aqivalue) AS max_aqi
  FROM all_years 
  GROUP BY MONTH(reportdate), YEAR(reportdate)
  ORDER BY max_aqi
)
SELECT avg_aqi.month, avg_aqi.year, avg_aqi.avg_aqi, max_aqi.max_aqi
FROM avg_aqi
JOIN max_aqi
ON avg_aqi.month = max_aqi.month AND avg_aqi.year = max_aqi.year
ORDER BY max_aqi

-- Min AQI values per month 
SELECT reportdate, 
	   MIN(aqivalue) AS Min_AQI
FROM all_years 
GROUP BY MONTH(reportdate), YEAR(reportdate)
ORDER BY Min_AQI

-- Comparing to monthly averages to the monthly min values 
WITH avg_aqi AS (
  SELECT MONTH(reportdate) AS month, 
         YEAR(reportdate) AS year,
         AVG(aqivalue) AS avg_aqi
  FROM all_years 
  GROUP BY MONTH(reportdate), YEAR(reportdate)
),
min_aqi AS (
  SELECT MONTH(reportdate) AS month, 
         YEAR(reportdate) AS year,
         MIN(aqivalue) AS min_aqi
  FROM all_years 
  GROUP BY MONTH(reportdate), YEAR(reportdate)
  ORDER BY min_aqi
)
SELECT avg_aqi.month, avg_aqi.year, avg_aqi.avg_aqi, min_aqi.min_aqi
FROM avg_aqi
JOIN min_aqi
ON avg_aqi.month = min_aqi.month AND avg_aqi.year = min_aqi.year
ORDER BY min_aqi

-- AIR POLLUTANTS
-- Most common air pollutants month to month over 5 years 
SELECT YEAR(reportdate) as year,
	   mainpollutant, 
	   COUNT(*) as count_of_mainpollutant
FROM all_years
GROUP BY mainpollutant

-- Count of pollutants each year
SELECT YEAR(reportdate) as year,
	   mainpollutant, 
	   COUNT(*) as count_of_mainpollutant
FROM all_years
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY mainpollutant, year
ORDER BY mainpollutant

-- Count of pollutants (total) 
SELECT mainpollutant, 
	   COUNT(*) / 1812 as count_of_mainpollutant
FROM all_years
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY mainpollutant
ORDER BY count_of_mainpollutant DESC

-- SITE INFORMATION 
-- Usage of each site each year
SELECT YEAR(reportdate) as year,
	   site_name, 
	   COUNT(*) as count_of_site_name
FROM all_years
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY site_name, year
ORDER BY year, count_of_site_name DESC

-- Usage of each site total over 5 years 
SELECT site_name, 
	   COUNT(*) / 1812 as count_of_site_name
FROM all_years
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY site_name
ORDER BY count_of_site_name DESC

-- Average AQI at each site by year 
SELECT YEAR(reportdate) AS year, 
		site_name,
	   AVG(aqivalue) AS Avg_AQI
FROM all_years 
WHERE YEAR(reportdate) BETWEEN 2018 AND 2022
GROUP BY site_name, year
ORDER BY site_name

-- Average AQI at each site overall 
SELECT site_name, 
		AVG(aqivalue) AS avg_aqi
FROM all_years
GROUP BY site_name
ORDER BY avg_aqi DESC
