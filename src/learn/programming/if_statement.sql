USE AdventureWorks2019;
GO


DECLARE @NubProducts INT = (
	SELECT COUNT(*) 
	FROM Production.ProductSubcategory
	WHERE ProductCategoryID = 4
) -- 12


IF @NubProducts > 7 
	PRINT 'More than 7 subcategories in category 4';
ELSE
	PRINT '7 or fewer subcategories in category 4';


	
-- Declare a variable to store employee count
DECLARE @SalesEmployeeCount INT;

-- Count the number of employees in the Sales department who are currently active
SELECT @SalesEmployeeCount = COUNT(*)
FROM HumanResources.Employee AS e
	JOIN HumanResources.EmployeeDepartmentHistory AS edh 
		ON e.BusinessEntityID = edh.BusinessEntityID
	JOIN HumanResources.Department AS d 
		ON edh.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales' AND edh.EndDate IS NULL;

SELECT @SalesEmployeeCount; -- 18

-- Use IF statement to check the count
IF @SalesEmployeeCount > 10
    PRINT 'More than 10 in Sales';
ELSE
    PRINT '10 or fewer in Sales';

