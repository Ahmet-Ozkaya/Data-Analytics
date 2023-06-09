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
