USE [AdventureWorks2019]
GO


-- # Multiple CTE

WITH Sales_CTE ([SalesPersonID], [TotalSales], [SaleYear]) AS (
    SELECT
        SalesPersonID,
        SUM(TotalDue),
        YEAR(OrderDate)
    FROM
        [Sales].[SalesOrderHeader]
    WHERE SalesPersonID IS NOT NULL
        GROUP BY SalesPersonID, YEAR(OrderDate)
),
Sales_Quota_CTE ([BusinessEntityID], [SalesQuota], [SalesQuotaYear]) AS (
    SELECT
        BusinessEntityID,
        SUM(SalesQuota),
        YEAR(QuotaDate)
    FROM [Sales].[SalesPersonQuotaHistory]
        GROUP BY BusinessEntityID , YEAR(QuotaDate)
)
SELECT
    SalesPersonID,
    SaleYear,
    TotalSales,
    SalesQuotaYear,
    SalesQuota
FROM
    Sales_CTE INNER JOIN Sales_Quota_CTE
        ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID
            AND Sales_CTE.SaleYear = Sales_Quota_CTE.SalesQuotaYear
ORDER BY
    SalesPersonID,
    SaleYear

