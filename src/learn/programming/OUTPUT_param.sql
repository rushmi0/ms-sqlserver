USE AdventureWorks2019;
GO



IF OBJECT_ID('dbo.usp_CalculateInterest', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_CalculateInterest;
GO

CREATE PROCEDURE dbo.usp_CalculateInterest
    @Principal MONEY,
    @Rate FLOAT,
    @Years INT,
    @FutureAmount MONEY OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @FutureAmount = @Principal * POWER(1 + @Rate, @Years);
END;
GO


-- ตัวอย่างการใช้งาน
DECLARE @Result MONEY;

EXEC dbo.usp_CalculateInterest 
    @Principal = 10000, 
    @Rate = 0.05, 
    @Years = 10,
    @FutureAmount = @Result OUTPUT;

PRINT 'Future Amount is: ' + CAST(@Result AS VARCHAR(50));

