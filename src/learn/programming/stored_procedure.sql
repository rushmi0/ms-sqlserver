USE AdventureWorks2019;
GO

CREATE PROC myProductInfo
AS
BEGIN
    SELECT ProductID, Name
    FROM Production.Product
    ORDER BY Name DESC;
END;
