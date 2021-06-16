/* Création de la base de données -------------------------------------------------------------- */
CREATE DATABASE resrel;

/* Ligne de commande à rentrer dans psql pour accéder à la base nouvellement créée -------------- */
\c resrel

/* On importe l'extension uuid pour générer des id complexes pour utilisateur et ressource ------ */
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

/* Tables ressource, type_ressource et categorie_ressource  ------------------------------------ */


CREATE TABLE type_ressource (
    idTypRes INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    libelleTypRes varchar(255) NOT NULL
);

CREATE TABLE categorie_ressource (
  idCatRes INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  libelleCatRes varchar(255) NOT NULL
);

CREATE TABLE ressource (
    idRessource uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    titreRessource varchar(255) NOT NULL,
    illustrationRessource varchar(255),
    messageRessource text NOT NULL,
    dureeRessource int NOT NULL,
    commentaires uuid [],
    isVerified boolean,
    idAuteur uuid REFERENCES utilisateur (idUser) ON DELETE CASCADE,
    idTypRes int REFERENCES  type_ressource(idTypRes)  ON DELETE CASCADE ,
    idCatRes int REFERENCES categorie_ressource (idCatRes)  ON DELETE CASCADE 
);

/* Tables utilisateur, admin, superardmin, et moderateur  ------------------------------------- */

CREATE TABLE utilisateur (
    idUser uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    emailUser varchar(255) UNIQUE NOT NULL,
    mdpUser varchar(100) NOT NULL,
    nomUser varchar(100) NOT NULL,
    prenomUser varchar(10) NOT NULL,
    telUser varchar(20),
    adresseUser varchar(255),
    paysUser varchar(100) NOT NULL,
    situationUser varchar(100),
    handicapUser boolean,
    isAdmin boolean,
    isSuperAdmin boolean,
    isModerateur boolean
);

/* Tables relation, type_relation et relation_ressource --------------------------------------- */


CREATE TABLE type_relation (
  idTypRel INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  libelleTypRel varchar(255) NOT NULL
);

CREATE TABLE relation (
  idRelation uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  idUser1 uuid REFERENCES utilisateur (idUser) NOT NULL  ON DELETE CASCADE ,
  idUser2 uuid REFERENCES utilisateur (idUser) NOT NULL  ON DELETE CASCADE ,
  idTypRel INT REFERENCES type_relation (idTypRel) NOT NULL  ON DELETE CASCADE 
);

CREATE TABLE ressource_en_cours (
  idRessourceEnCours uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  idRessource uuid REFERENCES ressource (idRessource)  ON DELETE CASCADE ,
  idRelation uuid REFERENCES relation (idRelation)  ON DELETE CASCADE ,
  idLeader uuid REFERENCES utilisateur (idUser)  ON DELETE CASCADE ,
  idParticipants uuid [],
  dateDebutParticipation DATE DEFAULT CURRENT_DATE,
  dateFinParticipation DATE,
  isExploite boolean,
  commentaires uuid [],
);

/* Tables commentaire et favori ---------------------------------------------------------------- */

CREATE TABLE commentaire (
    idCommentaire uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    contenuCommentaire text NOT NULL,
    dateCommentaire date DEFAULT CURRENT_TIMESTAMP,
    idUser uuid REFERENCES utilisateur (idUser) NOT NULL  ON DELETE CASCADE ,
    idRessource uuid REFERENCES ressource (idRessource) NOT NULL  ON DELETE CASCADE 
);

CREATE TABLE favori (
  idRessource uuid REFERENCES ressource (idRessource)  ON DELETE CASCADE ,
  idUser uuid REFERENCES utilisateur (idUser)  ON DELETE CASCADE ,
  PRIMARY KEY ( idRessource, idUser )
);

/* Ligne de commande pour vérifier que toutes les tables ont été ajoutées  ------------------- */
\dt


