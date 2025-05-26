-- สร้างตาราง departments
CREATE TABLE departments
(
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(100)
);


INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'),   -- Human Resources
       (2, 'ENG'),  -- Engineering
       (3, 'MKT'),  -- Marketing
       (4, 'FIN'),  -- Finance
       (5, 'SAL'),  -- Sales
       (6, 'IT'),   -- IT Support
       (7, 'OPS'),  -- Operations
       (8, 'LEG'),  -- Legal
       (9, 'PM'),   -- Product Management
       (10, 'DSN'), -- Design
       (11, 'CS'),  -- Customer Success
       (12, 'ADM');



CREATE TABLE employees
(
    employee_id   INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    department_id INT,
    hire_date     DATE,
    salary        DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);


INSERT INTO employees (employee_id, first_name, last_name, department_id, hire_date, salary)
VALUES (1, 'Alice', 'Johnson', 1, '2020-01-15', 55000.00),
       (2, 'Bob', 'Smith', 2, '2019-03-23', 70000.00),
       (3, 'Carol', 'Williams', 3, '2021-07-12', 62000.00),
       (4, 'David', 'Brown', 4, '2018-11-30', 58000.00),
       (5, 'Eve', 'Davis', 5, '2022-04-18', 50000.00),
       (6, 'Frank', 'Miller', 6, '2020-09-25', 60000.00),
       (7, 'Grace', 'Wilson', 7, '2021-02-14', 64000.00),
       (8, 'Hank', 'Moore', 8, '2019-06-01', 72000.00),
       (9, 'Ivy', 'Taylor', 9, '2020-08-05', 67000.00),
       (10, 'Jack', 'Anderson', 10, '2021-12-11', 59000.00),
       (11, 'Kara', 'Thomas', 11, '2022-05-20', 53000.00),
       (12, 'Leo', 'Jackson', 12, '2023-01-10', 51000.00);





CREATE TABLE books
(
    book_id        INT PRIMARY KEY IDENTITY(1,1),
    title          NVARCHAR(100),
    first_name     NVARCHAR(50),
    last_name      NVARCHAR(50),
    genre          NVARCHAR(50),
    price          DECIMAL(10, 2),
    published_date DATE
);


INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Silent Patient', 'Alex', 'Michaelides', 'Thriller', 350.00, '2019-02-05'),
       ('Atomic Habits', 'James', 'Clear', 'Self-help', 420.00, '2018-10-16'),
       ('1984', 'George', 'Orwell', 'Dystopian', 299.00, '1949-06-08'),
       ('To Kill a Mockingbird', 'Harper', 'Lee', 'Classic', 320.00, '1960-07-11'),
       ('The Alchemist', 'Paulo', 'Coelho', 'Fiction', 280.00, '1988-04-15');


INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Becoming', 'Michelle', 'Obama', 'Biography', 450.0, '2018-11-13');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Educated', 'Tara', 'Westover', 'Memoir', 390.0, '2018-02-20');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Midnight Library', 'Matt', 'Haig', 'Fantasy', 360.0, '2020-08-13');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Sapiens', 'Yuval', 'Noah Harari', 'History', 500.0, '2011-06-04');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Power of Now', 'Eckhart', 'Tolle', 'Spirituality', 340.0, '1997-08-19');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Dune', 'Frank', 'Herbert', 'Science Fiction', 410.0, '1965-08-01');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Subtle Art of Not Giving a F*ck', 'Mark', 'Manson', 'Self-help', 370.0, '2016-09-13');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Book Thief', 'Markus', 'Zusak', 'Historical Fiction', 330.0, '2005-03-14');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Catcher in the Rye', 'J.D.', 'Salinger', 'Classic', 310.0, '1951-07-16');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Rich Dad Poor Dad', 'Robert', 'Kiyosaki', 'Finance', 390.0, '1997-04-01');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Hobbit', 'J.R.R.', 'Tolkien', 'Fantasy', 360.0, '1937-09-21');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Thinking, Fast and Slow', 'Daniel', 'Kahneman', 'Psychology', 460.0, '2011-10-25');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Great Gatsby', 'F. Scott', 'Fitzgerald', 'Classic', 300.0, '1925-04-10');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Road', 'Cormac', 'McCarthy', 'Post-apocalyptic', 340.0, '2006-09-26');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Four Agreements', 'Don Miguel', 'Ruiz', 'Spirituality', 280.0, '1997-11-07');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Silent Patient', 'Alex', 'Michaelides', 'Thriller', 350.0, '2019-02-05');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('Atomic Habits', 'James', 'Clear', 'Self-help', 420.0, '2018-10-16');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('1984', 'George', 'Orwell', 'Dystopian', 299.0, '1949-06-08');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('To Kill a Mockingbird', 'Harper', 'Lee', 'Classic', 320.0, '1960-07-11');
INSERT INTO books (title, first_name, last_name, genre, price, published_date)
VALUES ('The Alchemist', 'Paulo', 'Coelho', 'Fiction', 280.0, '1988-04-15');
