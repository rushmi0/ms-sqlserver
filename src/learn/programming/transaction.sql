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


-- # Naming Transaction
BEGIN TRANSACTION UpdateJobTitle

UPDATE HumanResources.Employee
SET JobTitle = 'DevOps Engineer' -- Application Specialist, DevOps Engineer
WHERE BusinessEntityID = 268;

COMMIT TRANSACTION UpdateJobTitle


SELECT JobTitle FROM HumanResources.Employee WHERE BusinessEntityID = 268;





-- # IF Statement to commit or rollback
IF OBJECT_ID('dbo.books', N'U') IS NOT NULL
    DROP TABLE dbo.books;
GO

CREATE TABLE dbo.books
(
    id INT IDENTITY (1, 1),
    book_name VARCHAR(100) NOT NULL ,
    sold_copies INT NOT NULL
);


-- Insert data
INSERT INTO dbo.books (book_name, sold_copies)
VALUES ('book_1', 10),
       ('book_2', 30),
       ('book_3', 15),
       ('book_4', 20);


SELECT * FROM dbo.books;
DELETE FROM books WHERE book_name = 'book_5'


-- # Conditionally committing or rolling back (Beginning Script)
DECLARE @BookName INT;

BEGIN TRANSACTION AddBook;

DECLARE @NameNameData VARCHAR(50) = 'book_5';
DECLARE @SoldCopiesData INT = 25;



INSERT INTO dbo.books (book_name, sold_copies)
VALUES (@NameNameData, @SoldCopiesData);

SELECT @BookName = COUNT(*) FROM dbo.books WHERE book_name = 'book_5';

IF @BookName > 1
    BEGIN
       ROLLBACK TRANSACTION AddBook;
       PRINT @NameNameData + ' already exists.';
    END
ELSE
    BEGIN
        COMMIT TRANSACTION AddBook
        PRINT @NameNameData + ' was added to the books table.'
    END


-- # Error handling
BEGIN TRY
    BEGIN TRAN AddBook

    INSERT INTO dbo.books (book_name, sold_copies)
    VALUES ('book_7', 77);

    UPDATE books
    SET sold_copies = 'Performance Optimization'
    WHERE book_name = 'book_7';

    COMMIT TRAN ;
END TRY
BEGIN CATCH
    ROLLBACK TRAN AddBook;
    PRINT 'Adding new book failed.'
END CATCH

SELECT * FROM dbo.books WHERE book_name = 'book_7';

