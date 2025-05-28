USE [AdventureWorks2019]
GO


WITH ExpensiveProducts AS (
    SELECT 
        Name,
        ListPrice
    FROM 
        Production.Product
    WHERE 
        ListPrice > 1000
)
SELECT * 
FROM ExpensiveProducts
ORDER BY ListPrice DESC;
