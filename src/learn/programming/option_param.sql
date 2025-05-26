USE [AdventureWorks2019]
GO

CREATE PROC [dbo].[spOPProdList] 
(
    @MinListPrice AS INT = NULL,
    @MaxListPrice AS INT = NULL,
    @ProdName AS VARCHAR(MAX) = NULL
)
AS
BEGIN
    SELECT Name, ListPrice
    FROM Production.Product
    WHERE 
        (@MinListPrice IS NULL OR ListPrice >= @MinListPrice) AND
        (@MaxListPrice IS NULL OR ListPrice <= @MaxListPrice) AND
        (@ProdName IS NULL OR Name LIKE '%' + @ProdName + '%')
    ORDER BY Name ASC
END


EXEC spOPProdList @MinListPrice = 800
EXEC spOPProdList @MaxListPrice = 60
EXEC spOPProdList @MaxListPrice = 60, @prodName = 'road';
