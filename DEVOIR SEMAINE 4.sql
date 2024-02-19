use library
-- Question 1:  Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre
SELECT au_id, au_fname, au_lname
FROM authors
WHERE au_id NOT IN (
SELECT  DISTINCT ta.au_id
FROM titleauthor ta
 JOIN titles t ON ta.title_id = t.title_id
WHERE t.pub_id= (SELECT pub_id
FROM publishers WHERE pub_name = 'Harmattan'));

-- Question 2 : Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres
SELECT au_fname, au_lname
FROM authors
WHERE au_id NOT IN (
    SELECT DISTINCT au_id
    FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    WHERE pub_id = (
        SELECT pub_id
        FROM publishers
        WHERE pub_name = 'Eyrolles'
    )
);

-- Question 3 : Obtenir la liste des noms d’auteurs ayant touché une avance supérieure a toutes les avances versees par l'editeur " Harmattan"
SELECT au_fname, au_lname
FROM authors
WHERE au_id IN (SELECT au_id
FROM titleauthor 
JOIN titles ON titleauthor.title_id = titles.title_id
WHERE advance > (SELECT MAX(advance)
FROM titles
WHERE pub_id = (SELECT pub_id 
FROM publishers WHERE pub_name = 'Harmattan'))

);
