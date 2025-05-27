----
-- ฟังก์ชันช่วย: บวกเลขฐาน 10 ที่เป็น string
CREATE FUNCTION dbo.fn_AddBigIntStr (
    @a VARCHAR(MAX), 
    @b VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @result VARCHAR(MAX) = '';
    DECLARE @carry INT = 0;
    DECLARE @i INT = LEN(@a);
    DECLARE @j INT = LEN(@b);
    DECLARE @sum INT;

    WHILE @i > 0 OR @j > 0 OR @carry > 0
    BEGIN
        SET @sum = @carry;
        IF @i > 0 
        BEGIN
            SET @sum = @sum + CAST(SUBSTRING(@a, @i, 1) AS INT);
            SET @i = @i - 1;
        END
        IF @j > 0 
        BEGIN
            SET @sum = @sum + CAST(SUBSTRING(@b, @j, 1) AS INT);
            SET @j = @j - 1;
        END

        SET @carry = @sum / 10;
        SET @result = CAST(@sum % 10 AS VARCHAR) + @result;
    END

    RETURN @result;
END;
GO


DECLARE @Gx VARBINARY(32) = 0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798;

DECLARE @i INT = 1;
DECLARE @len INT = DATALENGTH(@Gx);
DECLARE @result VARCHAR(MAX) = '0';
DECLARE @base VARCHAR(MAX) = '1';
DECLARE @byteValue TINYINT;

WHILE @i <= @len
BEGIN
    SET @byteValue = CAST(SUBSTRING(@Gx, @len - @i + 1, 1) AS TINYINT);

    -- บวก @result + (@byteValue * @base)
    DECLARE @addTerm VARCHAR(MAX) = CAST(@byteValue AS VARCHAR);
    
    -- คูณด้วย @base (แบบ string) ผ่านการทำซ้ำ (ในที่นี้ยังไม่ multiply จริง)
    DECLARE @partial VARCHAR(MAX) = '0';
    DECLARE @j INT = 1;
    WHILE @j <= @byteValue
    BEGIN
        SET @partial = dbo.fn_AddBigIntStr(@partial, @base);
        SET @j = @j + 1;
    END

    SET @result = dbo.fn_AddBigIntStr(@result, @partial);

    -- เพิ่ม base *= 256 (จำลองแบบบวก 256 ครั้ง)
    DECLARE @newBase VARCHAR(MAX) = '0';
    SET @j = 1;
    WHILE @j <= 256
    BEGIN
        SET @newBase = dbo.fn_AddBigIntStr(@newBase, @base);
        SET @j = @j + 1;
    END

    SET @base = @newBase;
    SET @i = @i + 1;
END

SELECT @result AS [Decimal Value of Gx];
