USE AdventureWorks2019;
GO


DECLARE @NubProducts INT = (
	SELECT COUNT(*) 
	FROM Production.ProductSubcategory
	WHERE ProductCategoryID = 4
) -- 12


IF @NubProducts > 7 
	PRINT 'too many...'
