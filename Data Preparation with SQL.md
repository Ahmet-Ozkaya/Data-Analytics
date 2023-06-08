# Useful SQL Functions to Prepare Data
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
### Subquery
```sql
SELECT
    order_id,
    order_date,
    customer_id
FROM
    sales.orders
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            sales.customers
        WHERE
            city = 'New York'
    )
ORDER BY
    order_date DESC;
```
### Nested Subquery

```	sql
SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price > (
        SELECT
            AVG (list_price)
        FROM
            production.products
        WHERE
            brand_id IN (
                SELECT
                    brand_id
                FROM
                    production.brands
                WHERE
                    brand_name = 'Strider'
                OR brand_name = 'Trek'
            )
    )
ORDER BY
    list_price;
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
### CTE 2
```sql
WITH ProductsCategories AS(
SELECT TOP (1000)
      pr.[Name]
      ,pr.[ProductNumber]
      ,pr.[MakeFlag]
      ,pr.[FinishedGoodsFlag]
      ,pr.[Color]
      ,pr.[SafetyStockLevel]
      ,pr.[ReorderPoint]
      ,pr.[StandardCost]
      ,pr.[ListPrice]
      ,pr.[Size]
      ,pr.[Weight]
      ,pr.[DaysToManufacture]
      ,pr.[ProductLine]
      ,pr.[Class]
      ,pr.[Style]
      ,sb.Name as SubCategoryName
      ,ct.Name as CategoryName
  FROM [AdventureWorks2022].[Production].[Product] pr
  JOIN
  [AdventureWorks2022].[Production].[ProductSubcategory] sb
  ON pr.ProductSubcategoryID = sb.ProductSubcategoryID
  JOIN
  [AdventureWorks2022].[Production].[ProductCategory] ct 
  on sb.ProductCategoryID = ct.ProductCategoryID
)
SELECT
ProductsCategories.Color, ProductsCategories.size, ProductsCategories.CategoryName
FROM
ProductsCategories
WHERE
CategoryName IN ('Clothing','Components')
```
### CTE 3
```sql
WITH ProductsCategories AS(
SELECT TOP (1000)
      pr.[Name]
      ,pr.[ProductNumber]
      ,pr.[MakeFlag]
      ,pr.[FinishedGoodsFlag]
      ,pr.[Color]
      ,pr.[SafetyStockLevel]
      ,pr.[ReorderPoint]
      ,pr.[StandardCost]
      ,pr.[ListPrice]
      ,pr.[Size]
      ,pr.[Weight]
      ,pr.[DaysToManufacture]
      ,pr.[ProductLine]
      ,pr.[Class]
      ,pr.[Style]
      ,sb.Name as SubCategoryName
      ,ct.Name as CategoryName
  FROM [AdventureWorks2022].[Production].[Product] pr
  JOIN
  [AdventureWorks2022].[Production].[ProductSubcategory] sb
  ON pr.ProductSubcategoryID = sb.ProductSubcategoryID
  JOIN
  [AdventureWorks2022].[Production].[ProductCategory] ct 
  on sb.ProductCategoryID = ct.ProductCategoryID
)
SELECT
ProductsCategories.Color, count(ProductsCategories.size) as CountOfColors
FROM
ProductsCategories
WHERE
CategoryName IN ('Clothing','Components')
AND
Size in ('M','L')
GROUP BY Color
ORDER BY Color
```