USE AdventureWorks2019;
GO

USE AdventureWorks2019;
GO

DECLARE @MaxVacationHours INT;

SET @MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee);
SELECT @MaxVacationHours AS [Max Vacation Hours];
