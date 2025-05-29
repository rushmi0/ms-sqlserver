USE [AdventureWorks2019]
GO

-- # Multiple CTE: การใช้ CTE หลายตัว เพื่อเตรียมข้อมูลทีละส่วน แล้วนำมา join กันภายหลัง

-- 🔹 CTE ตัวที่ 1: ดึงยอดขายรวมของพนักงานขายในแต่ละปี
WITH Sales_CTE ([SalesPersonID], [TotalSales], [SaleYear]) AS (
    SELECT
        SalesPersonID,           -- รหัสพนักงานขาย
        SUM(TotalDue),           -- ยอดขายรวมต่อปี
        YEAR(OrderDate)          -- ปีที่ขาย (ตัดจากวันที่ OrderDate)
    FROM
        [Sales].[SalesOrderHeader]
    WHERE
        SalesPersonID IS NOT NULL -- กรองเฉพาะออเดอร์ที่มีพนักงานขาย
    GROUP BY
        SalesPersonID,
        YEAR(OrderDate)          -- จัดกลุ่มข้อมูลตามพนักงาน และปี
),

-- 🔹 CTE ตัวที่ 2: ดึงเป้าหมายยอดขาย (Sales Quota) ของพนักงานขายในแต่ละปี
     Sales_Quota_CTE ([BusinessEntityID], [SalesQuota], [SalesQuotaYear]) AS (
         SELECT
             BusinessEntityID,       -- รหัสพนักงาน (จากตาราง quota)
             SUM(SalesQuota),        -- รวมยอดเป้าหมายต่อปี
             YEAR(QuotaDate)         -- ปีของเป้าหมาย (จาก QuotaDate)
         FROM
             [Sales].[SalesPersonQuotaHistory]
         GROUP BY
             BusinessEntityID,
             YEAR(QuotaDate)         -- จัดกลุ่มตามพนักงาน และปี
     )

-- 🔸 Main Query: เชื่อม CTE ทั้งสอง เพื่อเปรียบเทียบยอดขายจริงกับยอดเป้าหมาย
SELECT
    SalesPersonID,             -- รหัสพนักงานจากยอดขายจริง
    SaleYear,                  -- ปีของยอดขาย
    TotalSales,                -- ยอดขายรวม
    SalesQuotaYear,            -- ปีของยอดเป้าหมาย
    SalesQuota                 -- ยอดเป้าหมายรวม
FROM
    Sales_CTE
        INNER JOIN Sales_Quota_CTE
                   ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID   -- เชื่อมด้วยรหัสพนักงาน
                       AND Sales_CTE.SaleYear = Sales_Quota_CTE.SalesQuotaYear         -- และปีต้องตรงกัน
ORDER BY
    SalesPersonID,
    SaleYear;                 -- เรียงลำดับผลลัพธ์ตามพนักงานและปี
