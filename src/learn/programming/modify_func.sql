USE [AdventureWorks2019]
GO



ALTER FUNCTION [dbo].[fnLengthyDate]
(
	@EntireData AS DATETIME
	)
RETURNS VARCHAR(MAX)
AS
BEGIN


	RETURN DATENAME(DW, @EntireData) + ' ' +
	DATENAME(D, @EntireData) + 
	CASE
		WHEN DAY(@EntireData) IN (1, 21, 31) THEN 'st'
		WHEN DAY(@EntireData) IN (2, 22) THEN 'nd'
		WHEN DAY(@EntireData) IN (3, 23) THEN 'rd'
		ELSE 'th'

	END + ' ' +
	DATENAME(M, @EntireData) + ' ' +
	DATENAME(YY, @EntireData)
END
GO

