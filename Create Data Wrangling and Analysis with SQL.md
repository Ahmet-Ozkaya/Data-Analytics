# Create Data Wrangling and Analysis with SQL
- Useful SQL String Functions to Clean Data
##### 
- LEFT, RIGHT, and LENGTH
- TRIM
- POSITION and STRPOS
- SUBSTR
- CONCAT
- Changing case with UPPER and LOWER
- Turning strings into dates
- Turning dates into more useful dates
- COALESCE
 
**I studied the correlation between consumer price index (inflation) vs property sales and prices in Melbourne, Victoria, Australia, for over ten years**

## Data Collection
### Data sources
**The data collected from...**
##### [Australian Bureau of Statistics](https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/consumer-price-index-australia/sep-quarter-2022#using-price-indexes)
### Platforms and tools

#### The data has uploaded to Google Bigquery
- Extract-Load-Clean-Merge-Transform
- There were too many attributes available, state, cities, areas etc. Only mean, median, and number of sales of houses, units, and apartments have been selected
- SELECT TRIM(Month),Number FROM `.DS1.building_approval`
- The date value was in "mmm-yyyy" format, it was split into 2 different columns as year and month.
- The query "SELECT Right(bldg_approval_vic.Period,4) AS [Year], Left([bldg_approval_vic].[Period],3) AS [Month], bldg_approval_vic.Number FROM bldg_approval_vic" 
- The average of each year has been calculated 
- The query "SELECT Right(bldg_approval_vic.Period,4) AS [Year], Round(Avg([bldg_approval_vic].[permit_number]),0) AS permit_number_avg FROM bldg_approval_vic GROUP BY Right(bldg_approval_vic.Period,4);
- Updating NULL values with average 
UPDATE TABLE `.DS1.building_approval`
SET Number = (SELECT avg(Number) FROM `.DS1.building_approval`)
WHERE Number IS NULL;
- Checking duplicates
- The query for counting duplicate rows
SELECT Month,Number,COUNT(*) AS DUPCNT FROM `.DS1.building_approval` GROUP BY Month, Number HAVING COUNT(*) > 0"
- The query for listing duplicate rows
Query SELECT a.Month
FROM `.DS1.building_approval` a
JOIN (SELECT Month, Number, COUNT(*)
FROM `.DS1.building_approval` 
GROUP BY Month, Number
HAVING count(*) > 1 ) b
ON a.Month = b.Month
AND a.Number = b.Number
ORDER BY a.Month
- Observing unusual values with statisticals: MIN, MAX, MEAN, AVERAGE, MEDIAN,, STDEV
## Data Visualization
### Google Data Studio
As it is well integrated with Google Cloud Bigquery, I visualized with Google Datastudio, or Google data Looker
#### [Live Dashboard](https://datastudio.google.com/reporting/ad368e2c-34ff-436b-a9d1-127288433fda)
## ![](https://github.com/Ahmet-Ozkaya/Data-Analytics/blob/main/victoria_housing_outlook_dashboard.png)
