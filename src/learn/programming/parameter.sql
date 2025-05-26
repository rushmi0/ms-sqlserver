USE AdventureWorks2019
GO


CREATE PROC spFix1ProdList (@MinListPrice AS INT)
AS
BEGIN
	SELECT Name, ListPrice
	FROM Production.Product
	WHERE ListPrice > @MinListPrice
	ORDER BY Name ASC
END


EXEC spFix1ProdList 800;
EXEC spOPProdList @MinListPrice = 800