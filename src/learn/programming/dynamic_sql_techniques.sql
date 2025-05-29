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
