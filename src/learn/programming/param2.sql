USE [AdventureWorks2019]
GO

ALTER PROC [dbo].[spProdList] 
(
    @MinListPrice AS INT,
    @MaxListPrice AS INT,
    @ProdName AS VARCHAR(MAX)
)
AS
BEGIN
    SELECT Name, ListPrice
    FROM Production.Product
    WHERE ListPrice >= @MinListPrice 
        AND ListPrice <= @MaxListPrice
        AND Name LIKE '%' + @ProdName + '%'
    ORDER BY Name ASC
END




