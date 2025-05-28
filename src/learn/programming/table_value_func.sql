USE [AdventureWorks2019]
GO

CREATE FUNCTION SellStartDataInYear (@SellStartDataYear DATETIME)
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
        YEAR(SellStartDate) = YEAR(@SellStartDataYear)
);


SELECT *
FROM dbo.SellStartDataInYear('2022-01-01');
