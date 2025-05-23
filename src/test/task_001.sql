--Find total number of registered students
SELECT *
FROM students;
SELECT COUNT(student_id)
FROM students;


--Find total number of students by gender

SELECT COUNT(student_id) AS 'student by gender', ISNULL(gender, 'unknown') AS gender
FROM students
GROUP BY gender;



