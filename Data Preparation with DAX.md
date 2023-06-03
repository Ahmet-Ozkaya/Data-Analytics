# Useful DAX Functions
## Concat
```sql
Full Name = 'Customer'[First Name] & " " & 'Customer'[Last Name] 
```
## KPI Metrics
- Measures for KPIs
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
Month Year = FORMAT('Date'[Date], "mm-yyyy") 
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
 ## Age Breakdown Calculation (Column on Customer Table) 
```sql
Age Breakdown =  
IF('Customer'[Age] >= 55, "55+", 
IF('Customer'[Age] >= 45, "45-54", 
IF('Customer'[Age] >= 35, "35-44", 
"18-34" ) ) ) 
```
 ## Temperature Key (Column on Internet Sales Table) 
```sql
Temperature Key =  
RELATED('Sales Territory'[Sales Territory Region]) & RELATED('Date'[Month Number Of Year]) 
```
 ## Total Transactions (Column on Sales Territory table) 
```sql
Total Transactions = COUNTROWS(RELATEDTABLE('Internet Sales')) 
```
 ## Region Volume SWITCH(TRUE
```sql
Region Volume =  
SWITCH(TRUE(), 
    [Total Transactions] >= 7000, "High Volume", 
    [Total Transactions] >= 4000, "Medium Volume", 
    [Total Transactions] >= 1, "Low Volume", 
    "N/A" )  
```
 ## Last Order Date (Column on Customer Table) 
```sql
Last Order Date = MAXX(RELATEDTABLE('Internet Sales'), 'Internet Sales'[Order Date]) 
```
 ### Calculated Measures
 ## Total Transactions (Measure on Internet Sales) 
```sql
Total Transactions = COUNTROWS('Internet Sales') 
```
 ## Total Sales
```sql
Total Sales = SUM('Internet Sales'[Sales Amount])  
```
 ## Total Cost
```sql
Total Cost = SUM('Internet Sales'[Total Product Cost]) 
```
 ## Profit
```sql
Profit = [Total Sales] - [Total Cost] 
```
 ## Profit Margin 
```sql
Profit Margin = DIVIDE([Profit], [Total Sales]) 
```
 ### Working with CALCULATE
 
 ## Total Sales (All Countries) 
```sql
Total Sales (All Countries) =  
CALCULATE( 
    [Total Sales], 
    ALL('Sales Territory'[Sales Territory Country] ) )  
```
 ## Total Sales (All Countries)  
```sql
Total Sales (All Countries) =  
CALCULATE( 
    [Total Sales], 
    REMOVEFILTERS('Sales Territory'[Sales Territory Country] ) )  
```
 ## Total Sales (All Countries) Removing Blanks
```sql
Total Sales (All Countries) =  
IF( 
    [Total Sales] = BLANK(), 
    BLANK(), 
    CALCULATE( 
        [Total Sales], 
        ALL('Sales Territory'[Sales Territory Country] ) ) ) 
```
 ## Percent of Total 
```sql
Country Percent of Total Sales =  
DIVIDE( 
    [Total Sales], 
    [Total Sales (All Countries)] ) 
```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
 ## C
```sql

```
