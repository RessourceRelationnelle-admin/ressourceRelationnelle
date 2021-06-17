const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

//Participer à une ressource
router.post("/", userAuth, async (res, req) => {
  try {
    const { idRes, Relation, idLeader } = req.body;

    const idRel = await db.query(
      `SELECT idTypRel FROM type_relation WHERE libelleTypRel='${Relation}'`
    );

    const resEnCours = await db.query(
      `INSERT INTO ressource_en_cours (idRessource,idRelation,idLeader) VALUES ($1,$2,$3,$4) RETURNING *`,
      [idRes, idRel, idLeader]
    );

    const Duree = await db.query(
      `SELECT dureeRessource FROM ressource WHERE idRessource='${idRes}'`
    );
    const dateFin = resEnCours.rows[0].datedebutparticipation + Duree;
    const participants = await db.query(
      `SELECT idUser FROM utilisateur,relation,type_relation 
      WHERE (utilisateur.idUser = relation.idUser1 OR utilisateur.idUser = relation.idUser2) 
      AND (type_relation.idTypRel = relation.idTypRel)
      AND (idUser1=$1 OR idUser2=$1)
      AND idTypRel=$2`,
      [idLeader, idRel]
    );

    participants.rows.filter((relation) => relation.id != relation.iduser);

    const ajoutsFinaux = await db.query(
      `UPDATE ressource_en_cours SET dateFinParticipation=$1 ,participants=$2 Where idRessource=$3 AND idRelation=$4 AND idLeader=$5 RETURNING *`,
      [dateFin, participants.rows, idRes, idRel, idLeader]
    );

    res.status(200).json({
      ressourceEnCours: ajoutsFinaux,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//Refuser la participation
router.put("/no/:id", userAuth, async (res, req) => {
  try {
    const participants = await db.query(
      `SELECT participants FROM ressource_en_cours WHERE idRessourceEnCours='${req.body.id}'`
    );
    participants.filter((user) => req.idUser != user);

    const res = await db.query(
      `UPDATE ressource_en_cours SET participants=$1 WHERE idRessourceEnCours=$2 RETURNING *`,
      [participants, req.body.id]
    );
    res.status(200).json({
      ressourceEnCours: res,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});
//POST Commentaire
router.post("/comm/:id", userAuth, async (req, res) => {
  try {
    const { contenu, idUser } = req.body;

    const commentaire = await db.query(
      "INSERT INTO commentaire (contenuCommentaire, idUser) VALUES ($1, $2) RETURNING *",
      [contenu, idUser]
    );

    const ajoutCommRess = await db.query(
      `INSERT INTO ressource_en_cours (commentaires) VALUES (${commentaire.rows[0].idcommentaire}) WHERE idRessourceEnCours='${req.body.id}' RETURNING *`
    );

    res.status(200).json({
      commentaire: commentaire.rows[0],
      ressource: ajoutCommRess.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});
// export the Router
module.exports = router;
