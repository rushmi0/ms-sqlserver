USE AdventureWorks2019;
GO

DECLARE @MaxVacationHours INT;
DECLARE @Marker INT;
DECLARE @NumEmployees INT;

SET @MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee);

SET @Marker = 0;

WHILE @Marker <= @MaxVacationHours
	BEGIN
		SET @NumEmployees = (
			SELECT  COUNT(*) FROM HumanResources.Employee WHERE VacationHours = @Marker
		)

		 IF @Marker = 20 BREAK

		PRINT CAST(@NumEmployees AS VARCHAR(3)) + ' employees still have '
			+ CAST(@Marker AS VARCHAR(2)) + ' Vacation Hours'
		SET @Marker = @Marker + 1
	END

