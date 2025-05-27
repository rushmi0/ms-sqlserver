USE adventureworks2019;
GO

DECLARE @EmployeeID INT;
-- ประกาศ Cursor
DECLARE employee_cursor CURSOR FOR
    SELECT businessentityid
    FROM humanresources.employee;

-- เปิด Cursor
OPEN employee_cursor;

-- ดึงข้อมูลแถวแรก
FETCH next FROM employee_cursor INTO @EmployeeID;

-- วนลูปผ่านข้อมูล
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Employee ID: ' + Cast(@EmployeeID AS VARCHAR);

        -- ดึงข้อมูลแถวถัดไป
        FETCH next FROM employee_cursor INTO @EmployeeID;
    END;

-- ปิดและล้าง Cursor
CLOSE employee_cursor;

DEALLOCATE employee_cursor;


---


DECLARE @EmployeeID INT;

DECLARE employee_cursor CURSOR FAST_FORWARD FOR
    SELECT BusinessEntityID
    FROM HumanResources.Employee;

OPEN employee_cursor;

FETCH NEXT FROM employee_cursor INTO @EmployeeID;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Employee ID: ' + CAST(@EmployeeID AS VARCHAR);
        FETCH NEXT FROM employee_cursor INTO @EmployeeID;
    END;

CLOSE employee_cursor;
DEALLOCATE employee_cursor;

