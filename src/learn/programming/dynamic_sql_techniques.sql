USE [AdventureWorks2019]
GO

-- Dynamic SQL Techniques

EXEC ('SELECT * FROM [Production].[Product]');

EXEC sp_executesql N'SELECT * FROM [Production].[Product]';


-- # SQL String concatenation

DECLARE @TableName NVARCHAR(128);
DECLARE @SQLString NVARCHAR(MAX)

SET @TableName = N'[Production].[ProductCategory]';
SET @SQLString = 'SELECT * FROM ' + @TableName;

EXEC sp_executesql @SQLString;




