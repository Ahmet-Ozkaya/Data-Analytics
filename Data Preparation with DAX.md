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
### Creating Calendar Columns
```sql
Day of Week Name = FORMAT([Date],"dddd") 

Date Start = FORMAT(left([start],16),"yyyy-mm-dd hh:mm") 
```
### IF Statement
- If Statement For a new Column 
```sql
region =  
	IF( 
		LEFT('Table of Mapped MID Codes'[MID], 1) = "2", "Europe", 
		IF( 
			LEFT('Table of Mapped MID Codes'[MID], 1) = "4", "Asia", 
			"Africa" 
		) 
	) 
```
### Case Statement For a new Column 

 

### Creating Date Table 
```sql
Date =  
ADDCOLUMNS ( 
CALENDAR (DATE (2020, 1, 1), DATE (2022, 12, 31)), 
"Year", YEAR([Date]), 
"MonthNumber", MONTH([Date]), 
"Quarter", QUARTER([Date]), 
"DayOfWeek", WEEKDAY([Date]) 
) 
```
 