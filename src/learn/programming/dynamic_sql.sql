USE [AdventureWorks2019]
GO


EXEC ('SELECT * FROM [Production].[Product]')

EXEC sp_executesql N'SELECT * FROM [Production].[Product]'



