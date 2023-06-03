# Useful DAX Functions
##### 
- KPI Metrics
### Best Selling Product 
```sql
	Best Selling Product = 
	FIRSTNONBLANK(TOPN(1,VALUES(financials[Product]),
	SUM(financials[Gross Sales])),1)
```

### Best Selling Segment
```sql
	Best Selling Segment = 
	FIRSTNONBLANK(TOPN(1,VALUES(financials[Segment]),
	SUM(financials[Gross Sales])),1) 

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
### CTE

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

 

 

Calendar 

Day of Week Name = FORMAT([Date],"dddd") 

Date Start = FORMAT(left([start],16),"yyyy-mm-dd hh:mm") 

 

If Statement For a new Column 

region =  

    IF( 

        LEFT('Table of Mapped MID Codes'[MID], 1) = "2", "Europe", 

        IF( 

            LEFT('Table of Mapped MID Codes'[MID], 1) = "4", "Asia", 

            "Africa" 

        ) 

    ) 

 

Case Statement For a new Column 

 

Creating Date Table 

 

Date =  

ADDCOLUMNS ( 

CALENDAR (DATE (2020, 1, 1), DATE (2022, 12, 31)), 

"Year", YEAR([Date]), 

"MonthNumber", MONTH([Date]), 

"Quarter", QUARTER([Date]), 

"DayOfWeek", WEEKDAY([Date]) 

) 

 