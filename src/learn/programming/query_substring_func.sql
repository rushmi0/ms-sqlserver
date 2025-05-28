USE [AdventureWorks2019]
GO

-- CHARINDEX ( สิ่งที่ต้องการหา , ข้อมูลที่จะนำมาหา, ตำแหน่งเริ่มต้นในการหา )

SELECT 'Database', CHARINDEX('a', 'Database') AS Position; -- 2
SELECT 'Database', CHARINDEX('a', 'Database', 3) AS Position; -- 5
SELECT 'Database', CHARINDEX('x', 'Database') AS Position; -- หาไม่เจอคืนค่า 0



ALTER FUNCTION [dbo].[fnFirstWordProdName] (@prodName VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @BlankPosition INT = 0;
	DECLARE @Outcom VARCHAR(MAX)

	-- ค้นหาตำแหน่งของช่องว่าง (space) ตัวแรกในชื่อสินค้า
	-- CHARINDEX(' ', @prodName) จะคืนค่าตำแหน่งของช่องว่างถ้ามี
	-- เช่น 'Mountain Bike' จะได้ค่าเป็น 9 (space อยู่หลังคำว่า 'Mountain')
	SET @BlankPosition = CHARINDEX(' ', @prodName);

	-- ถ้าไม่พบช่องว่างเลย (ไม่มีคำที่สอง) ให้คืนค่าทั้งคำ
	IF @BlankPosition = 0
		SET @Outcom = @prodName
	ELSE 
		-- ถ้าพบช่องว่าง ให้ตัดข้อความตั้งแต่ตัวแรกจนถึงตัวก่อนช่องว่าง
		-- เพื่อดึงเอาคำแรกของชื่อสินค้า
		SET @Outcom = LEFT(@prodName, @BlankPosition -1)

	RETURN @Outcom 
END
GO

