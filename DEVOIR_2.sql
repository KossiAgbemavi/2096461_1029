use library;

-- EXERCICE 1
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- EXERCICE 2
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- EXERCICE 3
SELECT title, price
FROM titles
WHERE title_id LIKE 'SU%' OR title LIKE 'BU%';

-- EXERCICE 4
SELECT title, price
FROM titles
WHERE title_id NOT LIKE 'SU%' AND title_id NOT LIKE 'BU%';

-- EXERCICE 5
SELECT title, price
FROM titles
WHERE title NOT LIKE 'S%' AND title NOT LIKE 'B%' AND SUBSTRING(title, 2, 1) = 'o';

-- EXERCICE 6
SELECT title, price
FROM titles
WHERE title NOT LIKE 'S%' AND title NOT LIKE 'B%' AND SUBSTRING(title, 3, 1) = 'f';

-- EXERCICE7
SELECT title, price
FROM titles
WHERE title LIKE 'A%' OR title LIKE 'B%' OR title LIKE 'C%' OR title LIKE 'D%' OR title LIKE 'E%' OR title LIKE 'F%' OR title LIKE 'G%' OR title LIKE 'H%' OR title LIKE 'I%' OR title LIKE 'J%'