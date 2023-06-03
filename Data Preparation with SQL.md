# Useful SQL Functions to Prepare Data
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
## Basics
### IN 
```sql
SELECT * 
FROM transaction 
WHERE store_location IN ('Richmond', 'Brunswick', 'Kew'); 
```
### Case 
```sql
SELECT Order_Id, Total_Value 

       CASE WHEN Total_value > 150 THEN 'HIGH' 

            WHEN Total_value < 150 THEN 'LOW' 

            ELSE 'MEDIUM' END as Order_Category 

FROM Orders; 
```
### GROUP BY 
```sql
SELECT Customer_Id, SUM(Total_Value) 
FROM Orders 
GROUP BY Customer_Id 
ORDER BY 2 DESC; 
```
### UNION 
```sql
SELECT 'Customer' AS Type, ContactName, City, Country 
FROM Customers 
UNION 
SELECT 'Supplier', ContactName, City, Country 
FROM Suppliers; 
```
### HAVING 
```sql
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders 
FROM Orders 
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
WHERE LastName = 'Davolio' OR LastName = 'Fuller' 
GROUP BY LastName 
HAVING COUNT(Orders.OrderID) > 25; 
```
