--Print courses and corresponding grades

SELECT c.course_name, g.grade
FROM courses AS c
INNER JOIN dbo.grades g on c.course_id = g.course_id
ORDER BY course_name ;
