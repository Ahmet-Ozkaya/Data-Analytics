# Data Preparation with SQL
- Useful SQL String Functions to Prepare Data
##### 
- Calculating Running Total
- CTE
- Subquery
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
	WITH average_sales AS (
	SELECT
		department, date,sale_amount, SUM(sale_amount) AS total_amount
	FROM sales
	)
	 
	SELECT
		MAX(total_amount) AS TotalMax
	FROM average_sales;
```
