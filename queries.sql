USE tifosi;
 
SELECT nom FROM focaccia ORDER BY nom ASC;
 
SELECT COUNT(*) AS total_ingredients FROM ingredient;
 
SELECT AVG(prix) AS prix_moyen FROM focaccia;
 
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom;
 
SELECT i.nom
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON f.id_focaccia = c.id_focaccia
WHERE f.nom = 'Raclaccia';
 
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia;
 
SELECT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia
ORDER BY COUNT(c.id_ingredient) DESC
LIMIT 1;
 
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE i.nom = 'Ail';
 
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;
 
SELECT f.nom
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON i.id_ingredient = c.id_ingredient
    WHERE i.nom = 'Champignon'
);
