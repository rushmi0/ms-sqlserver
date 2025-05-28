

SELECT 
    Name, 
    SellStartDate,

    -- เรียกใช้ฟังก์ชันที่ผู้ใช้กำหนดเอง (User-Defined Function)
    -- โดยใช้รูปแบบ [schema].[function_name](argument)
    -- ในที่นี้คือ [dbo].[fnLengthyDate](SellStartDate)
    --   - [dbo] คือชื่อ schema
    --   - [fnLengthyDate] คือชื่อฟังก์ชัน
    --   - (SellStartDate) คืออาร์กิวเมนต์ที่ส่งเข้าไป (ค่าจากคอลัมน์ SellStartDate)
    -- ฟังก์ชันนี้จะคืนค่าที่แปลงวันในรูปแบบที่อ่านง่าย (human readable)
    [dbo].[fnLengthyDate](SellStartDate) AS [human readable]

FROM 
    Production.Product;



SELECT PurchaseOrderID,
DueDate,
[dbo].[fnLengthyDate](DueDate) AS [human readable]
FROM [Purchasing].[PurchaseOrderDetail]
