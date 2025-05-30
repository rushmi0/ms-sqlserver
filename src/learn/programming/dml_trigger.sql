USE [AdventureWorks2019]
GO


-- # DML Trigger creation
-- Trigger นี้จะทำงานหลังจากมีการ INSERT, UPDATE หรือ DELETE
-- บนตาราง HumanResources.Department
CREATE TRIGGER DepartmentModified
    ON HumanResources.Department
    AFTER INSERT, UPDATE, DELETE
    AS
BEGIN
    -- เมื่อมีการเปลี่ยนแปลงในตาราง จะพิมพ์ข้อความแจ้งเตือน
    PRINT 'A change was made to the [HumanResources].[Department] table'
END
GO



-- # Test trigger
-- ปิดการแสดงจำนวนแถวที่ได้รับผลกระทบ (เพื่อให้ผลลัพธ์ดูง่ายขึ้น)
SET NOCOUNT ON;

-- การทดสอบ INSERT ข้อมูลใหม่ลงใน Department
-- จะเรียก Trigger และแสดงข้อความแจ้งเตือน
INSERT INTO HumanResources.Department (Name, GroupName)
VALUES ('Data Engineering', 'Data Science');

-- ทดสอบ UPDATE ข้อมูลใน Department
-- จะเรียก Trigger เช่นกัน
UPDATE HumanResources.Department
SET ModifiedDate = GETDATE()
WHERE DepartmentID = 7;

-- ทดสอบ DELETE แถวที่ GroupName = 'Data Science'
-- Trigger จะทำงานเช่นกัน
DELETE FROM HumanResources.Department
WHERE GroupName = 'Data Science';