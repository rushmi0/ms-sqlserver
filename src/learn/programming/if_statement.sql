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


	
DECLARE @SalesEmployeeCount INT;

SELECT @SalesEmployeeCount = COUNT(*)
FROM HumanResources.Employee AS e
	JOIN HumanResources.EmployeeDepartmentHistory AS edh 
		ON e.BusinessEntityID = edh.BusinessEntityID
	JOIN HumanResources.Department AS d 
		ON edh.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales' AND edh.EndDate IS NULL;

SELECT @SalesEmployeeCount; -- 18

IF @SalesEmployeeCount > 10
    PRINT 'More than 10 in Sales';
ELSE
    PRINT '10 or fewer in Sales';





ALTER PROC spGeanderData 
    @GetInfo VARCHAR(10)
AS
BEGIN
    IF @GetInfo = 'ALL'
		BEGIN
			(SELECT * FROM HumanResources.Employee)
			-- เมื่อเจอ RETURN จะออกจาก Stored Procedure ทันที เนื่องจาก SQL Server จะทำงานต่อไปจนจบ END ของ Procedure
			RETURN 0
		END

	IF @GetInfo = 'FEMALE'
		BEGIN
			(
				SELECT * FROM HumanResources.Employee
				WHERE Gender = 'F'
			)
			RETURN 0
		END

	IF @GetInfo = 'MALE'
		BEGIN
			(
				SELECT * FROM HumanResources.Employee
				WHERE Gender = 'M'
			)
			RETURN 0
		END

	-- ถ้ามูลที่รับมาไม่ตรงกับเงื่อนไขจะแสดงข้อความนี้
	SELECT 'Please choose ALL, FEMALE, MALE'
END

EXEC spGeanderData @GetInfo = 'ALL';
EXEC spGeanderData @GetInfo = 'FEMALE';
EXEC spGeanderData @GetInfo = 'MALE';
EXEC spGeanderData @GetInfo = 'lnwza007';



ALTER PROCEDURE spGeanderInfo
    @GetInfo VARCHAR(10)
AS
BEGIN
    IF @GetInfo = 'ALL'
        SELECT * FROM HumanResources.Employee
    ELSE IF @GetInfo = 'FEMALE'
        SELECT * FROM HumanResources.Employee WHERE Gender = 'F'
    ELSE IF @GetInfo = 'MALE'
        SELECT * FROM HumanResources.Employee WHERE Gender = 'M'
END

EXEC spGeanderInfo @GetInfo = 'FEMALE';