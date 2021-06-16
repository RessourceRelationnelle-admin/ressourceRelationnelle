-- Insertion des utilisateurs
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('poiriertheoo@gmail.com', '0550002D', 'POIRIER', 'Théo', '0786849087', '73 rue Isabey', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('kirutxn@gmail.com', 'kirtuxn', 'TXN', 'KIRU', '0666666666', '667 rue de la Secte', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('baptiste.laur@gmail.com', 'kr47g98', 'bl1998', 'Baptiste', '0699784536', '9 rue du 19e BCP', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('kevbonuti@gmail.com', '8e7x1s22', 'KevB', 'Kevin', '0699745896', '20 rue de la marne', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('michel.dumas@yahoo.com', 'tarteframboise55', 'michelD55', 'Michel', '0788202698', '15 avenue de la forêt', 'France', '', true);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('jean5414@yahoo.com', 'bonjour89654', 'jeanMeuse55', 'Jean', '0647458966', '2 rue Jean Jaurès', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('karineDupo@yahoo.com', '897e2dz', 'KDUPO', 'Karine', '0699845632', '16 rue de la Marne', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('martine.dubert@laposte.fr', 'md654', 'MartineDubert', 'Martine', '0655441236', '2 rue du Près', 'France', '', false);
INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser) VALUES
('baptiste.dubert@gmail.com', '784874zdz21', 'BaptDubert', 'Baptiste', '0699853265', '2 rue du Près', 'France', '', false);

-- Insertion des types de relation
INSERT INTO type_relation (libelleTypRel) VALUES('Soi');
INSERT INTO type_relation (libelleTypRel) VALUES('Conjoint');
INSERT INTO type_relation (libelleTypRel) VALUES('Famille');
INSERT INTO type_relation (libelleTypRel) VALUES('Ami');
INSERT INTO type_relation (libelleTypRel) VALUES('Inconnu');
INSERT INTO type_relation (libelleTypRel) VALUES('Collegue');

/* permet d'ajouter la date de fin de participation d'une ressource --*/
(SELECT duree from ressource WHERE ressource.idRessource = ressource_en_cours.idRessource)

-- Insertion des relations
INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='kirutxn@gmail.com'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='poiriertheoo@gmail.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Collegue'));

INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='martine.dubert@laposte.fr'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='baptiste.dubert@gmail.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Conjoint'));

INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='baptiste.laur@gmail.com'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='poiriertheoo@gmail.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Collegue'));

INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='kevbonuti@gmail.com'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='jean5414@yahoo.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Ami'));

INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='michel.dumas@yahoo.com'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='kirutxn@gmail.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Famille'));

INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='kevbonuti@gmail.com'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='karineDupo@yahoo.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Inconnu'));

INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='martine.dubert@laposte.fr'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='jean5414@yahoo.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Ami'));

-- -- Insertion des catégories de ressources

INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Communication');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Cultures');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Développement personnel');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Intelligence émotionnelle');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Loisirs');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Monde professionnel');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Parentalité');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Qualité de vie');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Recherche de sens');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Santé physique');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Santé psychique');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Spiritualité');
INSERT INTO categorie_ressource (libelleCatRes) VALUES ('Vie affective');


-- -- Insertion des types de ressources

INSERT INTO type_ressource (libelleTypRes) VALUES ('Activité / Jeu à réaliser');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Article');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Carte défi');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Cours au format PDF');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Exercice / Atelier');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Fiche de lecture');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Jeu en ligne');
INSERT INTO type_ressource (libelleTypRes) VALUES ('Vidéo');

