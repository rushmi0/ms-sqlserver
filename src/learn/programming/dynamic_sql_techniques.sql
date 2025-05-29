USE [AdventureWorks2019]
GO



-- Dynamic SQL Techniques

EXEC ('SELECT * FROM [Production].[Product]');

EXEC sp_executesql N'SELECT * FROM [Production].[Product]'

SELECT N'นึกแล้ว มึงต้องอ่าน' AS ภาษาไทย;
SELECT 'นึกแล้ว มึงต้องอ่าน' AS ภาษาไทย;


-- # SQL String Concatenation
DECLARE @TableName NVARCHAR(128);
DECLARE @SQLString NVARCHAR(MAX)

SET @TableName = N'[Production].[ProductCategory]';
SET @SQLString = 'SELECT * FROM ' + @TableName;

EXEC sp_executesql @SQLString;


-- # Number Concatenation
DECLARE @Number INT;
DECLARE @NumberString NVARCHAR(4);
DECLARE @SQLString NVARCHAR(MAX);


SET @Number = 15;
SET @NumberString = CAST(@Number AS NVARCHAR(4));

SET @SQLString = 'SELECT TOP ' + @NumberString + ' * FROM [Production].[Product] ORDER BY SellStartDate DESC';

EXEC sp_executesql @SQLString;


-- # Dynamic SQL and Stored Procedures
CREATE PROC sp_table_variable
(
    @TName NVARCHAR(128),
    @Number INT
)
AS
BEGIN

    DECLARE @SQLString NVARCHAR(MAX);
    DECLARE @NumberString NVARCHAR(6);

    SET @NumberString = CAST(@Number AS NVARCHAR(6))

    SET @SQLString = N'SELECT TOP ' + @NumberString + ' * FROM ' + @TName;

    EXEC sp_executesql @SQLString;

end

EXEC sp_table_variable '[Production].[Product]', 3
EXEC sp_table_variable '[HumanResources].[Employee]', 10


-- # Dynamic SQL and Stored Procedures with param option
CREATE PROC sp_op_table_variable
(
    @TName NVARCHAR(128),
    @Number INT = NULL
)
AS
BEGIN

    DECLARE @SQLString NVARCHAR(128);

    IF @Number IS NOT NULL
        BEGIN
            DECLARE @NumberString NVARCHAR(8);
            SET @NumberString = CAST(@Number AS NVARCHAR(8));
            SET @SQLString = N'SELECT TOP ' + @NumberString + ' * FROM ' + @TName;
        end
    ELSE
        BEGIN
            SET @SQLString = N'SELECT * FROM ' + @TName;
        end

    EXEC sp_executesql @SQLString;
end

EXEC sp_op_table_variable '[HumanResources].[Employee]'
EXEC sp_op_table_variable '[HumanResources].[Employee]', 3



-- # sp_executesql parameters

EXEC sp_executesql
    N'SELECT
            e.BusinessEntityID, P.FirstName, P.LastName
        FROM HumanResources.Employee AS e
            INNER JOIN Person.Person P on P.BusinessEntityID = e.BusinessEntityID
        WHERE e.BusinessEntityID > @BusinessEID AND P.FirstName LIKE @FirstLetter + ''%'''
        , N'@BusinessEID INT, @FirstLetter VARCHAR(3)'
        ,@BusinessEID = 200
        ,@FirstLetter = 'A';

