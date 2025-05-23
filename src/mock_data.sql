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




