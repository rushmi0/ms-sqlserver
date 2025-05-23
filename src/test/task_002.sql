--Print students and their grades

SELECT s.First_name, s.last_name, g.grade
FROM students AS s
         INNER JOIN grades g on s.student_id = g.student_id
ORDER BY first_name, last_name;

