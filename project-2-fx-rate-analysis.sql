-- Project 1: FX Rate Analysis 

-- Author: Taylor Gooden

-- Dataset: Dataset is synthetically generated to simulate real FX market data structure. Used for SQL portfolio demonstration purposes.

-- Tool: SQLite / DB Browser

-- Query 1: Average exchange rate per currency against the USD across the full dataset (2000-2024)

SELECT currency, AVG(rate) as avg_rate
FROM fx_rates
GROUP BY currency
ORDER BY avg_rate DESC;

-- Query 2: Highest and lowest recorded rate for each currency against the USD

SELECT currency, MAX(rate) AS max_rate, MIN(rate) AS min_rate
FROM fx_rates
GROUP BY currency
ORDER BY max_rate DESC;

-- Query 3: Average rate per currency per year — showing how exchange rates have shifted over time

SELECT year, currency, AVG(rate) AS avg_rate 
FROM fx_rates
GROUP BY currency, year
ORDER BY currency, year;

-- Query 4: Currency with the highest average daily trading volume

SELECT currency, AVG(volume) AS avg_volume
FROM fx_rates
GROUP BY currency
ORDER BY avg_volume DESC
LIMIT 1;

-- Query 5: Total trading volume per year across all currencies

SELECT year, SUM(volume)  AS total_volume
FROM fx_rates
GROUP BY year
ORDER BY year;

-- Query 6: All dates where GBP rate was above the GBP average rate

SELECT date, currency, rate
FROM fx_rates
WHERE currency = "GBP" AND rate >
(SELECT AVG(rate) FROM fx_rates WHERE currency = "GBP") 
ORDER BY rate DESC;

-- Query 7: Best and worst performing years for GBP based on average annual rate against the USD

SELECT year, AVG(rate) AS avg_rate
FROM fx_rates
WHERE currency = "GBP"
GROUP BY year 
ORDER BY avg_rate DESC;