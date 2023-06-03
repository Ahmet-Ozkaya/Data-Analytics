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
 ### Age Breakdown Calculation (Column on Customer Table) 
```sql
Age Breakdown =  
IF('Customer'[Age] >= 55, "55+", 
IF('Customer'[Age] >= 45, "45-54", 
IF('Customer'[Age] >= 35, "35-44", 
"18-34" ) ) ) 
```
 ### Temperature Key (Column on Internet Sales Table) 
```sql
Temperature Key =  
RELATED('Sales Territory'[Sales Territory Region]) & RELATED('Date'[Month Number Of Year]) 
```
 ### Total Transactions (Column on Sales Territory table) 
```sql
Total Transactions = COUNTROWS(RELATEDTABLE('Internet Sales')) 
```
 ### Region Volume SWITCH(TRUE
```sql
Region Volume =  
SWITCH(TRUE(), 
    [Total Transactions] >= 7000, "High Volume", 
    [Total Transactions] >= 4000, "Medium Volume", 
    [Total Transactions] >= 1, "Low Volume", 
    "N/A" )  
```
 ### Last Order Date (Column on Customer Table) 
```sql
Last Order Date = MAXX(RELATEDTABLE('Internet Sales'), 'Internet Sales'[Order Date]) 
```
 ## Calculated Measures
 ### Total Transactions (Measure on Internet Sales) 
```sql
Total Transactions = COUNTROWS('Internet Sales') 
```
 ### Total Sales
```sql
Total Sales = SUM('Internet Sales'[Sales Amount])  
```
 ### Total Cost
```sql
Total Cost = SUM('Internet Sales'[Total Product Cost]) 
```
 ### Profit
```sql
Profit = [Total Sales] - [Total Cost] 
```
 ### Profit Margin 
```sql
Profit Margin = DIVIDE([Profit], [Total Sales]) 
```
 ## Working with CALCULATE
 
 ### Total Sales (All Countries) 
```sql
Total Sales (All Countries) =  
CALCULATE( 
    [Total Sales], 
    ALL('Sales Territory'[Sales Territory Country] ) )  
```
 ### Total Sales (All Countries)  
```sql
Total Sales (All Countries) =  
CALCULATE( 
    [Total Sales], 
    REMOVEFILTERS('Sales Territory'[Sales Territory Country] ) )  
```
 ### Total Sales (All Countries) Removing Blanks
```sql
Total Sales (All Countries) =  
IF( 
    [Total Sales] = BLANK(), 
    BLANK(), 
    CALCULATE( 
        [Total Sales], 
        ALL('Sales Territory'[Sales Territory Country] ) ) ) 
```
 ### Percent of Total 
```sql
Country Percent of Total Sales =  
DIVIDE( 
    [Total Sales], 
    [Total Sales (All Countries)] ) 
```
 ### C
```sql
Total Sales (United States) =  
CALCULATE( 
    [Total Sales], 
    'Sales Territory'[Sales Territory Country] = "United States") 
```
 ### Total Sales (United States) Removing Blanks
```sql
Total Sales (United States) =  
IF( 
    ISBLANK([Total Sales]), 
    BLANK(), 
    CALCULATE( 
        [Total Sales], 
        'Sales Territory'[Sales Territory Country] = "United States")) 
```
 ### Total Sales (US and Canada)  
```sql
Total Sales (US and Canada) =  
CALCULATE( 
    [Total Sales], 
    'Sales Territory'[Sales Territory Country] IN { "United States", "Canada" }) 
```
 ### Total Sales (US and Canada)  Optional Method** Sames results as above. 
```sql
Total Sales (US and Canada) =  
CALCULATE( 
    [Total Sales], 
    'Sales Territory'[Sales Territory Country] = "United States" || // The double pipe delimiter is an OR condition. 
    'Sales Territory'[Sales Territory Country] = "Canada" ) 
```
 ### Total Sales (2007)
```sql
Total Sales (2007) =  
CALCULATE( 
    [Total Sales], 
    'Date'[Year] = 2007) 
```
 ## Time Intelligence Calculations

 ### Year to Date Sales 
```sql
YTD Sales =  
TOTALYTD( 
    [Total Sales], 
    'Date'[Date] ) 
```
 ### Fiscal Year to Date Sales 
```sql
Fiscal YTD Sales =  
TOTALYTD( 
    [Total Sales], 
    'Date'[Date], 
    "06/30" ) 
```
 ### Prior Year Sales
```sql
Prior Year Sales =  
CALCULATE( 
    [Total Sales], 
    SAMEPERIODLASTYEAR( 
        'Date'[Date]  ) ) 
```
 ### Prior Month Sales
```sql
Prior Month Sales =  
CALCULATE( 
    [Total Sales], 
    DATEADD( 
        'Date'[Date], 
        -1, MONTH ) ) 
```
 ### Semi Additive Measures
```sql
Inventory Balance =  
SUM('Product Inventory'[Units Balance]) 
```
 ### Closing Balance
```sql
Closing Balance (Last Date) =  
CALCULATE( 
    [Inventory Balance], 
    LASTDATE(  
        'Date'[Date] ) )  
```
 ### Closing Balance (Non Blank)
```sql
Closing Balance (Non Blank) =  
CALCULATE( 
    [Inventory Balance], 
    LASTNONBLANK(  
        'Date'[Date], 
        [Inventory Balance] ) )  
```
 ### Opening Balance Month 
```sql
Opening Balance Month =  
CALCULATE( 
    [Inventory Balance], 
    LASTNONBLANK(  
        PARALLELPERIOD( 
            'Date'[Date], 
            -1, 
            MONTH), 
        [Inventory Balance] ) ) 
```
 ### Last Order Date (Column on Customer Table) 
```sql
Last Order Date (CT) =  
CALCULATE( 
    MAX('Internet Sales'[Order Date])  
) 
```
 ### C
```sql

```
 ### C
```sql

```
 ### C
```sql

```
 ### C
```sql

```
