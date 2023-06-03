# Data Preparation with SQL
- Useful SQL String Functions to Prepare Data
##### 
- Calculating Running Total
- CTE
- Subquery

- 
### Simple Running Total 
```sql
	SELECT date,sale_amount,
	  SUM(sale_amount) OVER (ORDER BY date)
	  AS total_amount
	FROM sales;
```

### Partition by Department Running Total 
```sql
	SELECT department, date,sale_amount,
	  SUM(sale_amount) 
	  OVER(PARTITION BY Department ORDER BY date)
	  AS total_amount
	FROM sales;
```
### Subquery
- The list of sales above average 
```sql
	SELECT department, date, sale_amount
	FROM sales
	WHERE sale_amount >(
		AVG(sale_amount)
	);

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