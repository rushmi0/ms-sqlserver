

CREATE PROC sp_MultiplicationTable
    @number INT
AS
BEGIN
    DECLARE @i INT = 1;

    PRINT 'Multiplication table of ' + CAST(@number AS VARCHAR(10))

    WHILE @i <= 12
    BEGIN
        PRINT CAST(@number AS VARCHAR(10)) + ' x ' + 
              CAST(@i AS VARCHAR(10)) + ' = ' + 
              CAST(@number * @i AS VARCHAR(10));
        SET @i = @i + 1;
    END
END

EXEC sp_MultiplicationTable 7