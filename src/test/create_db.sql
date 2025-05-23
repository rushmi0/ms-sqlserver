CREATE DATABASE [sql_task];
GO

USE sql_task;
GO



CREATE TABLE students
(
    student_id INT IDENTITY (2323, 3) PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(50),
);


CREATE TABLE courses
(
    course_id   VARCHAR(50) PRIMARY KEY,
    course_name VARCHAR(50),
    semester    VARCHAR(50)
);



CREATE TABLE grades
(
    grade      INT,
    student_id INT,
    course_id  VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    PRIMARY KEY (student_id, course_id)
);



INSERT INTO students(first_name, last_name, gender) VALUES('tj', 'adams', 'male');
INSERT INTO students(first_name, last_name) VALUES('christine', 'adams');
INSERT INTO students(first_name, last_name, gender) VALUES('paul', 'fischer', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('abby', 'badmus', 'female');
INSERT INTO students(first_name, last_name) VALUES('maria', 'jones');
INSERT INTO students(first_name, last_name, gender) VALUES('johnson', 'banky', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('max', 'brent', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('phillip', 'anderson', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('abigael', 'anderson', 'female');
INSERT INTO students(first_name, last_name) VALUES('christine', 'jones');
INSERT INTO students(first_name, last_name) VALUES('alice', 'cooper');
INSERT INTO students(first_name, last_name, gender) VALUES('pooja', 'singh', 'female');
INSERT INTO students(first_name, last_name, gender) VALUES('joanne', 'price', 'female');
INSERT INTO students(first_name, last_name, gender) VALUES('romeo', 'ceasar', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('rj', 'lara', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('melinda', 'smart', 'female');
INSERT INTO students(first_name, last_name) VALUES('jacob', 'sylvester');
INSERT INTO students(first_name, last_name, gender) VALUES('melissa', 'andrew', 'female');
INSERT INTO students(first_name, last_name, gender) VALUES('kevin', 'patterson', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('james', 'durant', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('george', 'drogba', 'male');
INSERT INTO students(first_name, last_name, gender) VALUES('kayla', 'martins', 'female');
INSERT INTO students(first_name, last_name) VALUES('tobias', 'sylvester');
INSERT INTO students(first_name, last_name, gender) VALUES('paula', 'schmidts', 'female');
INSERT INTO students(first_name, last_name, gender) VALUES('fatima', 'abubarka', 'female');



INSERT INTO courses(course_id, course_name, semester) VALUES('BIO101', 'introduction to biology', 'fall');
INSERT INTO courses(course_id, course_name, semester) VALUES('CSC220', 'data analysis', 'spring');
INSERT INTO courses(course_id, course_name, semester) VALUES('DBA305', 'database administration', 'spring');
INSERT INTO courses(course_id, course_name, semester) VALUES('MTH230', 'vectors', 'fall');
INSERT INTO courses(course_id, course_name, semester) VALUES('ECN433', 'globalization', 'fall');
INSERT INTO courses(course_id, course_name, semester) VALUES('CSC098', 'data visualization', 'summer');
INSERT INTO courses(course_id, course_name, semester) VALUES('ECN322', 'cost benefit analysis', 'summer');



INSERT INTO grades(grade, student_id, course_id) VALUES(85, 2395, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2395, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(95, 2395, 'ECN433');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2395, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(87, 2392, 'ECN433');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2389, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(80, 2389, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(87, 2383, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2377, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(92, 2374, 'BIO101');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2374, 'ECN322');
INSERT INTO grades(grade, student_id, course_id) VALUES(85, 2323, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2323, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2329, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2329, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(92, 2329, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(95, 2329, 'ECN322');
INSERT INTO grades(grade, student_id, course_id) VALUES(94, 2332, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(93, 2332, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(80, 2335, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2338, 'ECN322');
INSERT INTO grades(grade, student_id, course_id) VALUES(85, 2338, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2338, 'CSC220');
INSERT INTO grades(grade, student_id, course_id) VALUES(98, 2338, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(87, 2341, 'ECN433');
INSERT INTO grades(grade, student_id, course_id) VALUES(80, 2347, 'ECN433');
INSERT INTO grades(grade, student_id, course_id) VALUES(82, 2347, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2350, 'MTH230');
INSERT INTO grades(grade, student_id, course_id) VALUES(95, 2353, 'BIO101');
INSERT INTO grades(grade, student_id, course_id) VALUES(100, 2359, 'ECN433');
INSERT INTO grades(grade, student_id, course_id) VALUES(87, 2356, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(80, 2362, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(96, 2365, 'CSC098');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2365, 'CSC220');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2368, 'DBA305');
INSERT INTO grades(grade, student_id, course_id) VALUES(98, 2368, 'ECN322');
INSERT INTO grades(grade, student_id, course_id) VALUES(90, 2368, 'ECN433');
INSERT INTO grades(grade, student_id, course_id) VALUES(98, 2368, 'CSC220');




SELECT * FROM courses;
SELECT * FROM grades;
SELECT * FROM students;



