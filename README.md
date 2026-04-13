# Projet Tifosi - Base de données MySQL

Voici mon rendu pour le projet de création de la base de données du restaurant "Tifosi". 

Comme demandé dans l'énoncé, le projet est divisé en trois scripts SQL principaux :

- `schema.sql` : Il contient la logique de création de l'utilisateur (tifosi) et de la base de données. Il contient aussi la construction de toutes les tables selon le modèle conceptuel fourni. J'y ai ajouté les contraintes de sécurité demandées (clés primaires, étrangères, suppressions en cascade et contraintes d'unicité).
- `data.sql` : C'est le script d'alimentation (peuplement). Les données ont été converties depuis les fichiers du dossier contenant les ressources obligatoires en requêtes d'insertion.
- `queries.sql` : C'est le fichier avec les 10 requêtes de vérification demandées. 

J'ai également ajouté un fichier `script-requêtes.md` qui liste proprement le résultat attendu et obtenu de toutes les requêtes afin de ne pas surcharger et "polluer" le script SQL avec de longs blocs de texte.

## Pour tester le projet :
1. Importer `schema.sql` dans un SGBD MySQL.
2. Importer `data.sql` pour remplir les tables.
3. Exécuter les commandes du fichier `queries.sql`.
