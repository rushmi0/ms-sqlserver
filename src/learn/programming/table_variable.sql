USE [AdventureWorks2019]
GO

DECLARE @TempProducts TABLE 
(
	Name VARCHAR(MAX),
	SellStartDate DATETIME
)
INSERT INTO @TempProducts
SELECT 
	Name, SellStartDate
FROM 
	Production.Product
WHERE
	SellStartDate < '2012-01-01';


SELECT * FROM @TempProducts;