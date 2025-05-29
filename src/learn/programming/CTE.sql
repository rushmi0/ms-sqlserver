USE [AdventureWorks2019]
GO


WITH SoldEarly AS (
    SELECT
        Name,
        SellStartDate,
        ListPrice
    FROM
        Production.Product
    WHERE
        SellStartDate < '2012-01-01'
)
SELECT
    *
FROM
    SoldEarly
WHERE
    ListPrice > 200;


WITH ExpensiveProducts AS (
    SELECT
        Name,
        ListPrice
    FROM
        Production.Product
    WHERE
        ListPrice > 1000
)
SELECT *
FROM
    ExpensiveProducts
ORDER BY
    ListPrice DESC;




WITH Sales_CTE AS (
    SELECT
        SalesPersonID,
        YEAR(OrderDate) AS [SalesYear],
        SUM(TotalDue) AS [TotalSales]
    FROM
        Sales.SalesOrderHeader
    WHERE
        SalesPersonID IS NOT NULL
    GROUP BY
        SalesPersonID, YEAR(OrderDate)
)
SELECT
    SalesPersonID,
    SalesYear,
    TotalSales
FROM
    Sales_CTE
ORDER BY
    SalesPersonID, SalesYear;



-- Labelling Columns
WITH ItemCounts ([SalePerson], [NumberOfItemSold]) AS (
    SELECT
        SalesPersonID,
        COUNT(*)
    FROM [Sales].[Store]
    GROUP BY
        SalesPersonID
)
SELECT
    SalePerson,
    NumberOfItemSold
FROM ItemCounts


-- # Multiple CTE
WITH SalesTotal AS (
    SELECT
        SalesPersonID,
        SUM(TotalDue) AS TotalSales
    FROM Sales.SalesOrderHeader
    WHERE SalesPersonID IS NOT NULL
    GROUP BY SalesPersonID
),
SalesOrderCount AS (
    SELECT
        SalesPersonID,
        COUNT(SalesOrderID) AS OrderCount
    FROM Sales.SalesOrderHeader
    WHERE SalesPersonID IS NOT NULL
    GROUP BY SalesPersonID
),
SalesAverage AS (
    SELECT
        s.SalesPersonID,
        s.TotalSales,
        o.OrderCount,
        CAST(s.TotalSales AS DECIMAL(10,2)) / o.OrderCount AS AvgPerOrder
    FROM SalesTotal s
    JOIN SalesOrderCount o ON s.SalesPersonID = o.SalesPersonID
)
SELECT
    SalesPersonID,
    TotalSales,
    OrderCount,
    AvgPerOrder
FROM SalesAverage
WHERE AvgPerOrder > 5000
ORDER BY AvgPerOrder DESC;