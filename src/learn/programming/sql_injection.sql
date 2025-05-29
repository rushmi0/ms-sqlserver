-- # Hazards of SQL Injection

CREATE DATABASE SqlInjectionDemo;
GO

USE SqlInjectionDemo;
GO

CREATE TABLE Users
(
    UserID   INT IDENTITY (1,1) PRIMARY KEY,
    Username NVARCHAR(50),
    Password NVARCHAR(50)
);
GO

INSERT INTO Users (Username, Password)
VALUES
    (N'admin',     N'admin123'),      -- ผู้ดูแลระบบ
    (N'alice',     N'alice2024'),     -- ผู้ใช้ทั่วไป
    (N'bob',       N'Pa$$w0rd'),      -- รหัสผ่านที่อ่อนแอ
    (N'testuser',  N'123456'),        -- บัญชีทดสอบ
    (N'john.doe',  N'qwerty');        -- รหัสผ่านยอดนิยม
GO

SELECT * FROM Users;

-- Stored Procedure แบบไม่ปลอดภัย
CREATE PROCEDURE dbo.Unsafe_Login
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
            'SELECT * FROM Users WHERE Username = ''' + @Username + ''' AND Password = ''' + @Password + '''';

    PRINT 'Dynamic SQL :';
    PRINT @SQL;

    EXEC(@SQL);
END;
GO

CREATE PROCEDURE dbo.Safe_Login
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = N'SELECT * FROM Users WHERE Username = @U AND Password = @P';

    EXEC sp_executesql
         @SQL,
         N'@U NVARCHAR(50), @P NVARCHAR(50)',
         @U = @Username,
         @P = @Password;
END;

EXEC dbo.Unsafe_Login
     @Username = N'admin'' --',
     @Password = N'any';

SELECT * FROM Users WHERE Username = '''anything''; DROP TABLE Users; --' AND Password = 'irrelevant'

EXEC dbo.Unsafe_Login
         @Username = N'anything; DROP TABLE Users',
         @Password = N'irrelevant';

SELECT * FROM Users WHERE Username = 'admin' --' AND Password = 'any'
