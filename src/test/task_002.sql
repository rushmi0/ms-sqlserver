--Print students and their grades

SELECT students.First_name, students.last_name, g.grade
FROM students
         INNER JOIN dbo.grades g on students.student_id = g.student_id
