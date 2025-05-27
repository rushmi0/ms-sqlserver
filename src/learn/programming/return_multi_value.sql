USE AdventureWorks2019;
GO


CREATE FUNCTION dbo.fn_GetEmployeeInfo (@BusinessEntityID INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
        e.JobTitle,
        e.HireDate,
        p.LastName
    FROM HumanResources.Employee e
		JOIN Person.Person p 
			ON e.BusinessEntityID = p.BusinessEntityID
    WHERE e.BusinessEntityID = @BusinessEntityID
);
GO


SELECT * FROM dbo.fn_GetEmployeeInfo(1);
