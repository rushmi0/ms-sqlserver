SELECT *
FROM books;

SELECT *
FROM books
WHERE DATEPART(YEAR, published_date) BETWEEN 2010 AND 2020
ORDER BY DATEPART(YEAR, published_date) DESC;


SELECT *
FROM books
WHERE price BETWEEN 300 AND 400;


-- CASE Statement

SELECT
    title,
    price,
    CASE
        WHEN price < 300 THEN 'Cheap'
        WHEN price BETWEEN 300 AND 400 THEN 'Moderate'
        ELSE 'Expensive'
        END AS price_category
FROM books;


SELECT
    title,
    published_date,
    CASE
        WHEN DATEPART(YEAR, published_date) < 2000 THEN 'Before 2000'
        WHEN DATEPART(YEAR, published_date) BETWEEN 2000 AND 2015 THEN '2000–2015'
        ELSE 'After 2015'
        END AS publication_period
FROM books;

