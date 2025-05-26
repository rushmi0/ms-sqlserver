--Find the total number of registrations for each course

SELECT *
FROM courses AS c
INNER JOIN grades g on c.course_id = g.course_id;



