-- Question 1: La liste des paires (auteur, éditeur) demeurant dans la même ville.
SELECT a.au_fname AS auteur, p.pub_name AS editeur
FROM authors a
JOIN publishers p ON a.city = p.city;

-- Question 2: La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère.
SELECT a.au_fname AS auteur, COALESCE(p.pub_name, 'N/A') AS editeur
FROM authors a
LEFT JOIN publishers p ON a.city = p.city;

-- Question 3: La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les éditeurs qui ne répondent pas à ce critère.
SELECT COALESCE(a.au_fname, 'N/A') AS auteur, p.pub_name AS editeur
FROM authors a
RIGHT JOIN publishers p ON a.city = p.city;

-- Question 4: La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et les éditeurs qui ne répondent pas à ce critère.
SELECT au.au_fname, au.au_lname, p.pub_name
FROM authors au
LEFT JOIN titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN publishers p ON t.pub_id = p.pub_id AND (au.city = p.city OR p.city IS NULL);


-- Question 5: Effectif(nombre) d'employes par niveau d'experience
SELECT job_lvl AS niveau_experience, COUNT(*) AS nombre_employes
FROM employees
GROUP BY job_lvl;

-- Question 6: Liste des employes par maison d'edition
SELECT p.pub_name, e.fname, e.lname
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
ORDER BY p.pub_name;

-- Question 7: Salaires horaires moyens des employes par maison d'edition
SELECT p.pub_name, AVG(e.salary) as salaire_horaire
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
GROUP BY p.pub_name;


-- Question 8: Effectif(nombre) d'employées de niveau SEINIOR par maison d'edition
SELECT p.pub_name AS maison_edition, COUNT(*) AS nombre_employes_senior
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE e.job_lvl = 'SEINIOR'
GROUP BY maison_edition;


