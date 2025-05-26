USE AdventureWorks2019
GO

-- ลบฟังก์ชันเดิมหากมี
IF OBJECT_ID('dbo.fn_CompoundInterest', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_CompoundInterest;
GO

-- สร้างฟังก์ชัน
CREATE FUNCTION dbo.fn_CompoundInterest
(
    @Principal MONEY,        -- เงินต้น
    @Rate FLOAT,             -- อัตราดอกเบี้ย เช่น 0.05 (5%)
    @Years INT               -- จำนวนปี
)
RETURNS MONEY
AS
BEGIN
    DECLARE @Amount MONEY;

    SET @Amount = @Principal * POWER((1 + @Rate), @Years);

    RETURN @Amount;
END;
GO


SELECT dbo.fn_CompoundInterest(10000, 0.05, 10) AS FutureAmount;


SELECT 
    p.FirstName,
    p.LastName,
    e.Rate AS StartingRate,
    dbo.fn_CompoundInterest(e.Rate, 0.05, 10) AS RateIn10Years
FROM HumanResources.EmployeePayHistory e
	JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID;
