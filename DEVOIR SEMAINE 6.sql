drop database if exists library;
Create database if not exists library_08_03_24;
use library_08_03_24;

-- Reponse 1
SELECT CONCAT(e.fname, ' ', e.lname) AS Nom_Complet, e.job_lvl, p.pub_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE e.job_lvl = 'SEINIOR' ;

-- Reponse 2

SELECT CONCAT(fname, ' ', lname) AS full_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE lname = 'Zongo' AND fname = 'Norbert');

-- Reponse 3

SELECT CONCAT(e.fname, ' ', e.lname) AS full_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.country = 'Canada';

-- Reponse 4

SELECT CONCAT(fname, ' ', lname) AS full_name
FROM employees e
WHERE e.job_lvl = 'SEINIOR';

-- Reponse 5

SELECT CONCAT(e.fname, ' ', e.lname) AS full_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE salary > (SELECT AVG(salary) FROM employees WHERE pub_id = e.pub_id);

-- Reponse 6

SELECT CONCAT(e.fname, ' ', e.lname) AS full_name, e.salary
FROM employees e
WHERE e.salary = ( SELECT MIN(salary) FROM employees e2 WHERE e2.job_lvl = e.job_lvl);

-- Reponse 7

SELECT t.type ,  SUM(s.qty)
FROM titles t
INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY t.type
ORDER BY SUM(s.qty) DESC
LIMIT 1;

-- Reponse 8

SELECT s.stor_id, t.title, t.price
FROM sales s INNER JOIN titles t ON s.title_id = t.title_id
GROUP BY s.stor_id, t.title
ORDER BY s.stor_id, SUM(s.qty) DESC
LIMIT 2;

-- Reponse 9

SELECT a.au_fname, a.au_lname
FROM authors a INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SUM(s.qty) DESC
LIMIT 5;


-- Reponse 10

SELECT p.pub_name, AVG(t.price) AS avg_price
FROM publishers p INNER JOIN titles t ON p.pub_id = t.pub_id
GROUP BY p.pub_id;


-- Reponse 11

SELECT a.au_fname, a.au_lname, COUNT(ta.title_id) AS book_count
FROM authors a INNER JOIN titleauthor ta ON a.au_id = ta.au_id
GROUP BY a.au_id
ORDER BY book_count DESC
LIMIT 3;
