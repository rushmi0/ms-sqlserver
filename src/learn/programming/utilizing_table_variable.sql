USE [AdventureWorks2019]
GO

CREATE FUNCTION dbo.SellStartDateInYear (@SellStartDateYear INT)
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        Name,
        SellStartDate,
        ListPrice
    FROM 
        Production.Product
    WHERE 
        YEAR(SellStartDate) = @SellStartDateYear
);


SELECT  Name,
        SellStartDate,
        ListPrice
FROM [dbo].[SellStartDateInYear](2012)
