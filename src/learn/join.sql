CREATE TABLE students
(
    student_id INT PRIMARY KEY,
    name       VARCHAR(100),
    major      VARCHAR(100)
);


CREATE TABLE courses
(
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor  VARCHAR(100)
);


CREATE TABLE enrollments
(
    enrollment_id INT PRIMARY KEY,
    student_id    INT,
    course_id     INT,
    grade         CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- ข้อมูลนักเรียน
INSERT INTO students (student_id, name, major)
VALUES (1, 'Alice', 'Computer Science'),
       (2, 'Bob', 'Mathematics'),
       (3, 'Charlie', 'Physics'),
       (4, 'David', 'Engineering');

-- ข้อมูลวิชา
INSERT INTO courses (course_id, course_name, instructor)
VALUES (101, 'Database Systems', 'Dr. Smith'),
       (102, 'Calculus', 'Dr. Johnson'),
       (103, 'Physics I', 'Dr. Brown');



SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('enrollments');

-- ALTER TABLE enrollments DROP CONSTRAINT FK__enrollmen__stude__49C3F6B7;


-- ข้อมูลการลงทะเบียนเรียน
INSERT INTO enrollments (enrollment_id, student_id, course_id, grade)
VALUES (1, 1, 101, 'A'),
       (2, 2, 101, 'B'),
       (3, 2, 102, 'A'),
       (4, 3, 103, 'B'),
       (6, 99, 102, 'B');



SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 🔍 INNER JOIN: แสดงเฉพาะข้อมูลที่ "ตรงกันทั้งสองฝั่ง" เท่านั้น
-- ต้องมี student_id ที่ตรงกันใน enrollments และ course_id ที่ตรงกันใน courses
-- ถ้านักเรียนไม่ได้ลงทะเบียน หรือวิชาไม่มีคนเรียน จะไม่แสดง
SELECT s.name, c.course_name, e.grade
FROM students s
         INNER JOIN enrollments e ON s.student_id = e.student_id
         INNER JOIN courses c ON e.course_id = c.course_id;


-- 🔍 LEFT JOIN: แสดง "นักเรียนทุกคน" (ฝั่งซ้าย) แม้จะยังไม่ลงทะเบียนเรียนก็ตาม
-- ถ้าไม่มีข้อมูลการลงทะเบียนหรือวิชา ระบบจะแสดง NULL แทน
SELECT s.name, c.course_name, e.grade
FROM students s
         LEFT JOIN enrollments e ON s.student_id = e.student_id
         LEFT JOIN courses c ON e.course_id = c.course_id;



-- 🔍 RIGHT JOIN: แสดง "การลงทะเบียนเรียนทั้งหมด" (ฝั่งขวา) แม้ไม่มีข้อมูลนักเรียน
-- มีประโยชน์กรณีต้องการดูวิชาทั้งหมดพร้อมผู้ที่ลงทะเบียน แม้นักเรียนจะถูกลบไปแล้ว
SELECT s.name, c.course_name, e.grade
FROM students s
         RIGHT JOIN enrollments e ON s.student_id = e.student_id
         RIGHT JOIN courses c ON e.course_id = c.course_id;



-- 🔍 FULL OUTER JOIN: แสดงข้อมูล "ทั้งหมดทั้งสองฝั่ง" ไม่ว่าจะตรงหรือไม่ตรงกัน
-- ถ้ามีนักเรียนแต่ไม่ลงเรียน หรือมีวิชาแต่ไม่มีใครเรียน ก็ยังแสดง (ค่าจะเป็น NULL)
SELECT s.name, c.course_name, e.grade
FROM students s
         FULL OUTER JOIN enrollments e ON s.student_id = e.student_id
         FULL OUTER JOIN courses c ON e.course_id = c.course_id;



