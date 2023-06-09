WITH CategoriesProduct as(
SELECT sb.Name, sb.ProductSubcategoryID, pr.Class, pr.Color, pr.ListPrice 
FROM Production.Product pr, Production.ProductSubcategory sb
WHERE
pr.ProductSubcategoryID = sb.ProductSubcategoryID
)
select Name, Class, Color, ListPrice
FROM CategoriesProduct
WHERE
CategoriesProduct.ListPrice > 200
ORDER BY ListPrice ASC