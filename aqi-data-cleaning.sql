-- Create a new table with all years congregated into one table 
-- Makes it easier to look at all data and clean it more efficiently 

CREATE TABLE all_years AS 
	SELECT * FROM abqaqidaily2018
		UNION 
	SELECT * FROM abqaqidaily2019
		UNION
	SELECT * FROM abqaqidaily2020
		UNION
	SELECT * FROM abqaqidaily2021
		UNION
	SELECT * FROM abqaqidaily2022

-- Rename Site Name and Site ID column names to get rid of parentheses 
ALTER TABLE all_years
	CHANGE COLUMN `Site Name (of Overall AQI)` site_name
    varchar(25)
    
ALTER TABLE all_years
	CHANGE COLUMN `Site ID (of Overall AQI)` site_id
    varchar(30);

ALTER TABLE all_years 
	CHANGE COLUMN `date` reportdate
    DATE NOT NULL; 

ALTER TABLE all_years 
	CHANGE COLUMN `Overall AQI Value` aqivalue
	INT(4); 
 
ALTER TABLE all_years 
	CHANGE COLUMN `Main Pollutant` mainpollutant
    VARCHAR(10); 

-- Verify name changes went through correctly 
SELECT * FROM all_years; 


-- Delete Source column (as all values come from AQS and this information is not necessary) 
ALTER TABLE all_years
	DROP COLUMN `Source (of Overall AQI)`;


-- Find missing site_id values 
SELECT DISTINCT site_id
	FROM all_years
	WHERE site_name IS NULL OR site_name ='';

-- Fill in missing site_name values with the information found from research 
UPDATE all_years
	SET site_name = 'Los Lunas'
	WHERE site_id = '35-061-0008';

UPDATE all_years
	SET site_name = 'Bernalillo'
	WHERE site_id = '35-043-1001';
    
UPDATE all_years
	SET site_name = 'Santa Ana Pueblo'
	WHERE site_id = '35-043-9028';

-- Rerun to verify no site_name values are empty or null 
SELECT DISTINCT site_id
	FROM all_years
	WHERE site_name IS NULL OR site_name ='';

-- Change names to proper case for site name (make it more clean)
UPDATE all_years SET site_name = LOWER(site_name);
UPDATE all_years SET site_name = CONCAT(UPPER(SUBSTR(site_name,1,1)),LOWER(SUBSTR(site_name,2)));
UPDATE all_years SET site_name = REPLACE(site_name,' a',' A');
UPDATE all_years SET site_name = REPLACE(site_name,' b',' B');
UPDATE all_years SET site_name = REPLACE(site_name,' c',' C');
UPDATE all_years SET site_name = REPLACE(site_name,' d',' D');
UPDATE all_years SET site_name = REPLACE(site_name,' e',' E');
UPDATE all_years SET site_name = REPLACE(site_name,' f',' F');
UPDATE all_years SET site_name = REPLACE(site_name,' g',' G');
UPDATE all_years SET site_name = REPLACE(site_name,' h',' H');
UPDATE all_years SET site_name = REPLACE(site_name,' i',' I');
UPDATE all_years SET site_name = REPLACE(site_name,' j',' J');
UPDATE all_years SET site_name = REPLACE(site_name,' k',' K');
UPDATE all_years SET site_name = REPLACE(site_name,' l',' L');
UPDATE all_years SET site_name = REPLACE(site_name,' m',' M');
UPDATE all_years SET site_name = REPLACE(site_name,' n',' N');
UPDATE all_years SET site_name = REPLACE(site_name,' o',' O');
UPDATE all_years SET site_name = REPLACE(site_name,' p',' P');
UPDATE all_years SET site_name = REPLACE(site_name,' q',' Q');
UPDATE all_years SET site_name = REPLACE(site_name,' r',' R');
UPDATE all_years SET site_name = REPLACE(site_name,' s',' S');
UPDATE all_years SET site_name = REPLACE(site_name,' t',' T');
UPDATE all_years SET site_name = REPLACE(site_name,' u',' U');
UPDATE all_years SET site_name = REPLACE(site_name,' v',' V');
UPDATE all_years SET site_name = REPLACE(site_name,' w',' W');
UPDATE all_years SET site_name = REPLACE(site_name,' x',' X');
UPDATE all_years SET site_name = REPLACE(site_name,' y',' Y');
UPDATE all_years SET site_name = REPLACE(site_name,' z',' Z');
