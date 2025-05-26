USE AdventureWorks2019
GO

DECLARE @x INT;
SET @x = 10;

SELECT @x AS MyVariable;


DECLARE @y INT = 32;
SELECT @y AS MyData;



DECLARE @Gender CHAR(1);
SET @Gender = 'M';

SELECT BusinessEntityID, JobTitle, Gender
FROM HumanResources.Employee
WHERE Gender = @Gender;



DECLARE @MinRate MONEY = 20.00;
DECLARE @MaxRate MONEY = 50.00;

SELECT p.FirstName, p.LastName, e.Rate
FROM HumanResources.EmployeePayHistory e
	JOIN HumanResources.Employee emp ON e.BusinessEntityID = emp.BusinessEntityID
	JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID
WHERE e.Rate BETWEEN @MinRate AND @MaxRate;



SELECT 'Hello';
PRINT 'MSSQL';


DECLARE @a FLOAT;
SET @a = dbo.fn_CompoundInterest(10000, 0.05, 10);
SELECT @a AS [Result of Interest]; -- 16288.9

PRINT CAST(ROUND(@a, 2) AS VARCHAR(20));



SELECT @@SERVERNAME
SELECT @@VERSION

SELECT * FROM Production.Product;
SELECT @@ROWCOUNT


