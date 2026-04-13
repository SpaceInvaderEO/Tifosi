# Tests des requêtes SQL

### Requête 1
- **But de la requête :** Afficher la liste des noms des focaccias par ordre alphabétique croissant.
- **Code SQL :** 
  ```sql
  SELECT nom FROM focaccia ORDER BY nom ASC;
  ```
- **Résultat attendu :** Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione
- **Résultat obtenu :** Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione
- **Écarts :** Aucun écart constaté.

---

### Requête 2
- **But de la requête :** Afficher le nombre total d'ingrédients.
- **Code SQL :** 
  ```sql
  SELECT COUNT(*) AS total_ingredients FROM ingredient;
  ```
- **Résultat attendu :** 25
- **Résultat obtenu :** 25
- **Écarts :** Aucun écart constaté.

---

### Requête 3
- **But de la requête :** Afficher le prix moyen des focaccias.
- **Code SQL :** 
  ```sql
  SELECT AVG(prix) AS prix_moyen FROM focaccia;
  ```
- **Résultat attendu :** 10.25
- **Résultat obtenu :** 10.25
- **Écarts :** Aucun écart constaté.

---

### Requête 4
- **But de la requête :** Afficher la liste des boissons avec leur marque, triée par nom de boisson.
- **Code SQL :** 
  ```sql
  SELECT b.nom AS boisson, m.nom AS marque
  FROM boisson b
  JOIN marque m ON b.id_marque = m.id_marque
  ORDER BY b.nom ASC;
  ```
- **Résultat attendu :** Capri-sun (Coca-cola), Coca-cola original (Coca-cola), Coca-cola zéro (Coca-cola), Eau de source (Cristalline), Fanta citron (Coca-cola), Fanta orange (Coca-cola), Lipton Peach (Pepsico), Lipton zéro citron (Pepsico), Monster energy ultra blue (Monster), Monster energy ultra gold (Monster), Pepsi (Pepsico), Pepsi Max Zéro (Pepsico)
- **Résultat obtenu :** Capri-sun (Coca-cola), Coca-cola original (Coca-cola), Coca-cola zéro (Coca-cola), Eau de source (Cristalline), Fanta citron (Coca-cola), Fanta orange (Coca-cola), Lipton Peach (Pepsico), Lipton zéro citron (Pepsico), Monster energy ultra blue (Monster), Monster energy ultra gold (Monster), Pepsi (Pepsico), Pepsi Max Zéro (Pepsico)
- **Écarts :** Aucun écart constaté.

---

### Requête 5
- **But de la requête :** Afficher la liste des ingrédients pour une Raclaccia.
- **Code SQL :** 
  ```sql
  SELECT i.nom
  FROM ingredient i
  JOIN comprend c ON i.id_ingredient = c.id_ingredient
  JOIN focaccia f ON f.id_focaccia = c.id_focaccia
  WHERE f.nom = 'Raclaccia';
  ```
- **Résultat attendu :** Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
- **Résultat obtenu :** Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
- **Écarts :** Aucun écart constaté.

---

### Requête 6
- **But de la requête :** Afficher le nom et le nombre d'ingrédients pour chaque focaccia.
- **Code SQL :** 
  ```sql
  SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
  FROM focaccia f
  LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
  GROUP BY f.id_focaccia;
  ```
- **Résultat attendu :** Américaine (8), Emmentalaccia (7), Gorgonzollaccia (8), Hawaienne (9), Mozaccia (10), Paysanne (13), Raclaccia (7), Tradizione (9)
- **Résultat obtenu :** Américaine (8), Emmentalaccia (7), Gorgonzollaccia (8), Hawaienne (9), Mozaccia (10), Paysanne (13), Raclaccia (7), Tradizione (9)
- **Écarts :** Aucun écart constaté.

---

### Requête 7
- **But de la requête :** Afficher le nom de la focaccia qui a le plus d'ingrédients.
- **Code SQL :** 
  ```sql
  SELECT f.nom
  FROM focaccia f
  JOIN comprend c ON f.id_focaccia = c.id_focaccia
  GROUP BY f.id_focaccia
  ORDER BY COUNT(c.id_ingredient) DESC
  LIMIT 1;
  ```
- **Résultat attendu :** Paysanne
- **Résultat obtenu :** Paysanne
- **Écarts :** Aucun écart constaté.

---

### Requête 8
- **But de la requête :** Afficher la liste des focaccias qui contiennent de l'ail.
- **Code SQL :** 
  ```sql
  SELECT DISTINCT f.nom
  FROM focaccia f
  JOIN comprend c ON f.id_focaccia = c.id_focaccia
  JOIN ingredient i ON i.id_ingredient = c.id_ingredient
  WHERE i.nom = 'Ail';
  ```
- **Résultat attendu :** Gorgonzollaccia, Mozaccia, Paysanne, Raclaccia
- **Résultat obtenu :** Gorgonzollaccia, Mozaccia, Paysanne, Raclaccia
- **Écarts :** Aucun écart constaté.

---

### Requête 9
- **But de la requête :** Afficher la liste des ingrédients inutilisés.
- **Code SQL :** 
  ```sql
  SELECT i.nom
  FROM ingredient i
  LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
  WHERE c.id_ingredient IS NULL;
  ```
- **Résultat attendu :** Salami, Tomate cerise
- **Résultat obtenu :** Salami, Tomate cerise
- **Écarts :** Aucun écart constaté.

---

### Requête 10
- **But de la requête :** Afficher la liste des focaccias qui n'ont pas de champignons.
- **Code SQL :** 
  ```sql
  SELECT f.nom
  FROM focaccia f
  WHERE f.id_focaccia NOT IN (
      SELECT c.id_focaccia
      FROM comprend c
      JOIN ingredient i ON i.id_ingredient = c.id_ingredient
      WHERE i.nom = 'Champignon'
  );
  ```
- **Résultat attendu :** Américaine, Hawaienne
- **Résultat obtenu :** Américaine, Hawaienne
- **Écarts :** Aucun écart constaté.
