USE [AdventureWorks2019]
GO

IF OBJECT_ID('tempdb..#TempName') IS NOT NULL
	DROP TABLE #TempName
GO

SELECT Name, SellStartDate
INTO #TempName
FROM [Production].[Product]
WHERE Name LIKE '%Thin%';

SELECT * FROM #TempName;


IF OBJECT_ID('tempdb..#TempTable2') IS NOT NULL
	DROP TABLE #TempName
GO

CREATE TABLE #TempTable2 
(
	Name VARCHAR(MAX),
	SellStartDate DATETIME,
	SellEndDate DATETIME
)
INSERT INTO #TempTable2
SELECT Name, SellStartDate, SellEndDate
FROM [Production].[Product]
WHERE SellEndDate IS NOT NULL;

SELECT * FROM #TempTable2;

