-- EXERCICE 1;

-- Reponse 1
-- Le modele entité-association que je propose :
 
Entité ( Candidat ) avec les attributs : IUC (Identifiant Unique du Candidat), nom, prénom, date de naissance, pays d’origine, numéro de téléphone, numéro de passeport, statut matrimonial.
Entité ( Programme d’immigration » avec l’attribut nom)
Entité ( Test de langues ) avec les attributs : nom du test, date du test, performance.
Entité ( Agent consultant ) avec les attributs : compte, nombre maximum de dossiers à suivre.
Entité ( Commentaire ) avec l’attribut pertinent.
Les relations entre ces entités peuvent être définies comme suit :
Une relation ( Candidat_Participe_Programme ) entre Candidat et Programme d’immigration.
Une relation ( Candidat_Passe_Test ) entre Candidat et Test de langues.
Une relation ( Agent_Suit_Candidat ) entre Agent consultant et Candidat.
Une relation ( Agent_Ajoute_Commentaire ) entre Agent consultant et Commentaire;

-- REPONSE 2 --

-- Le modele relationnel que je propose :

Table ( Candidat ) avec les colonnes : IUC (clé primaire), nom, prénom, date de naissance, pays d’origine, numéro de téléphone, numéro de passeport, statut matrimonial.
Table ( Programme_Immigration ) avec la colonne nom (clé primaire).
Table ( Test_Langues ) avec les colonnes : nom du test, date du test, performance, IUC (clé étrangère vers Candidat).
Table ( Agent_Consultant ) avec les colonnes : compte (clé primaire), nombre maximum de dossiers à suivre.
Table ( Commentaire ) avec les colonnes : id_commentaire (clé primaire), texte_commentaire, IUC (clé étrangère vers Candidat);


-- EXERCICE 2

-- Reponse 1

SELECT 
  u.full_name,
  r.name AS role
FROM users u
INNER JOIN roles r ON u.role_id = r.id
ORDER BY u.full_name;



SELECT u.full_name AS 'Nom complet', r.name AS 'Rôle'
FROM `user` u
JOIN `role` r ON u.role_id = r.id;

-- Reponse 2

SELECT p.name AS Product_Name, ol.quantity AS Quantity
FROM `user` u
JOIN `invoice` i ON u.id = i.customer_id
JOIN `orders` o ON i.order_id = o.id
JOIN `OrderLine` ol ON o.id = ol.order_id
JOIN `product` p ON ol.product_id = p.id
WHERE u.full_name = 'Oumar Moussa';

-- Reponse 3

SELECT p.name AS Product_Name
FROM `product` p
JOIN `supplier` s ON p.supplier_id = s.id
WHERE s.city = 'Moncton';


-- BONUS

-- Reponse 4

SELECT u.full_name, TIMEDIFF(ch.logout_date, ch.login_date) AS time_connected
FROM user u
JOIN connection_history ch ON u.id = ch.user_id
ORDER BY time_connected DESC
LIMIT 1;


-- reponse 5

SELECT u.full_name AS last_user_disconnected
FROM user u
JOIN connection_history ch ON u.id = ch.user_id
ORDER BY ch.logout_date DESC
LIMIT 1;