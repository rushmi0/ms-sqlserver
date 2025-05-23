-- Data & Time Data Type

CREATE TABLE people
(
    name           VARCHAR(50),
    birth_data     DATE,
    birth_time     TIME,
    birth_datetime DATETIME
);

INSERT INTO people(name, birth_data, birth_time, birth_datetime)
VALUES ('sally fox', '1997-08-08', '10:50:30', '1997-08-08 10:50:30');

INSERT INTO people(name, birth_data, birth_time, birth_datetime)
VALUES ('amanda perry', '1998-02-05', '14:45:30', '1998-02-05 14:45:30');


-- Extract Part of value

SELECT YEAR(birth_data)
FROM people;
SELECT name, birth_data, YEAR(birth_data) AS birth_year
FROM people;


SELECT MONTH(birth_data)
FROM people;
SELECT name, birth_data, MONTH(birth_data) AS birth_month
FROM people;

SELECT DAY(birth_data)
FROM people;
SELECT name, birth_data, DAY(birth_data) AS birth_day
FROM people;


-- GETDATE Functions
SELECT GETDATE() AS current_date_time;

CREATE TABLE messenger
(
    username  VARCHAR(50),
    message   VARCHAR(100),
    create_at DATETIME DEFAULT GETDATE()
);

SELECT *
FROM messenger;

INSERT INTO messenger(username, message)
VALUES ('lnwza007', '; T_T');

INSERT INTO messenger(username, message)
VALUES ('rushmi0', 'first commit');


-- CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP AS current_date_time;

-- DATEPART Functions

SELECT DATEPART(YEAR, '2025-05-23') AS year; -- 2025
SELECT DATEPART(MONTH, '2025-05-23') AS month; -- 05
SELECT DATEPART(DAY, '2025-05-23') AS day; -- 23

SELECT *
FROM people;
SELECT DATEPART(MINUTE, birth_time) AS minute
FROM people;


-- DATEDEFF Functions
SELECT DATEDIFF(YEAR, '2001-08-09', '2025-05-23') AS current_age;
SELECT name, DATEDIFF(YEAR, birth_data, GETDATE()) AS current_age
FROM people;

-- DATEADD Functions
SELECT DATEADD(YEAR, 4, '2025-05-23') AS plus_year;
SELECT DATEADD(MONTH, 3, '2025-05-23') AS plus_month;
SELECT DATEADD(MONTH, -2, '2025-05-23') AS minus_month;


-- Date Format
SELECT FORMAT(GETDATE(), 'dd/mm/yyyy');
SELECT FORMAT(GETDATE(), 'mm/dd/yyyy');
SELECT FORMAT(GETDATE(), 'mm/yyyy/dd');

SELECT FORMAT(GETDATE(), 'yyyy-mm-dd');
SELECT FORMAT(GETDATE(), 'mm-dd-yyyy');

SELECT FORMAT(GETDATE(), 'yyyy, MMMM, dddd');
SELECT FORMAT(GETDATE(), 'yyyy, MM, dd');

SELECT CONCAT(
               FORMAT(GETDATE(), 'yyyy, MMMM, dddd'),
               '|',
               FORMAT(GETDATE(), 'yyyy, MM, dd')
       ) AS new_date;


-- Time Format
SELECT FORMAT(GETDATE(), 'hh:mm:ss:ms');

