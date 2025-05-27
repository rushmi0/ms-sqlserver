USE AdventureWorks2019
GO

CREATE FUNCTION fnLengthyDate
(
    @EntireData AS DATETIME
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    RETURN 
        DATENAME(WEEKDAY, @EntireData) + ' ' +
        CAST(DAY(@EntireData) AS VARCHAR) + ' ' +
        DATENAME(MONTH, @EntireData) + ' ' +
        CAST(YEAR(@EntireData) AS VARCHAR)
END




SELECT Name, SellStartDate, [dbo].[fnLengthyDate](SellStartDate)
FROM Production.Product;

