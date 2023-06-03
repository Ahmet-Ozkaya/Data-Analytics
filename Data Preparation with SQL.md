# Data Preparation with SQL
- Useful SQL String Functions to Prepare Data
##### 
- CTE
- Subquery
- Calculating Running Total
- 
 
```sql
SELECT TRIM(Month),Number FROM `.DS1.building_approval`
```
- The date value was in "mmm-yyyy" format, it was split into 2 different columns as year and month.
- The query
```sql
SELECT Right(bldg_approval_vic.Period,4) AS [Year], Left([bldg_approval_vic].[Period],3) AS [Month], bldg_approval_vic.Number FROM bldg_approval_vic" 
```
- The average of each year has been calculated 
- The query 
```sql
SELECT Right(bldg_approval_vic.Period,4) AS [Year], Round(Avg([bldg_approval_vic].[permit_number]),0) AS permit_number_avg FROM bldg_approval_vic GROUP BY Right(bldg_approval_vic.Period,4);
```
- Updating NULL values with average 
```sql
UPDATE TABLE `.DS1.building_approval SET Number = (SELECT avg(Number) FROM `.DS1.building_approval`) WHERE Number IS NULL;
```
- Checking duplicates
- The query for counting duplicate rows
```sql
SELECT Month,Number,COUNT(*) AS DUPCNT FROM `.DS1.building_approval` GROUP BY Month, Number HAVING COUNT(*) > 0"
```
- The query for listing duplicate rows
```sql
Query SELECT a.Month
FROM `.DS1.building_approval` a
JOIN (SELECT Month, Number, COUNT(*)
FROM `.DS1.building_approval` 
GROUP BY Month, Number
HAVING count(*) > 1 ) b
ON a.Month = b.Month
AND a.Number = b.Number
ORDER BY a.Month
```
- Observing unusual values with statisticals: MIN, MAX, MEAN, AVERAGE, MEDIAN, STDEV
## Data Visualization
### Microsoft Power BI
The data visualized with Microsoft Power BI
## ![](https://github.com/Ahmet-Ozkaya/Data-Analytics/blob/main/HousingOutlookPowerBI.png)
