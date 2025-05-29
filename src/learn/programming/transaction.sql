USE [AdventureWorks2019]
GO

-- ฺฺBEGIN TRAN
BEGIN TRANSACTION

SELECT
    BusinessEntityID,
    JobTitle
FROM
    HumanResources.Employee
WHERE BusinessEntityID = 7;


UPDATE HumanResources.Employee
SET JobTitle = 'Data Scientist 2'
WHERE BusinessEntityID = 7;


SELECT
    BusinessEntityID,
    JobTitle
FROM
    HumanResources.Employee
WHERE BusinessEntityID = 7;

-- ถ้าใช้ COMMIT ไปอล้วจะไม่สามารถ ROLLBACK
-- บันทึกการเปลี่ยนแปลง
COMMIT -- COMMIT TRAN, COMMIT TRANSACTION

-- ยกเลิกการเปลี่ยนแปลง
ROLLBACK TRANSACTION


-- #Nmaine Transaction
BEGIN TRANSACTION UpdateJobTitle

UPDATE HumanResources.Employee
SET JobTitle = 'DevOps Engineer'
WHERE BusinessEntityID = 268;



