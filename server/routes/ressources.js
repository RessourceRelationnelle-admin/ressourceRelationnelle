const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

//GET ALL VERIFIED Ressources
router.get("/Verified", async (req, res) => {
  try {
    const result = await db.query(
      "SELECT * FROM ressource WHERE isVerified=true"
    );
    res.status(200).json({
      status: "success",
      ressources: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//GET ALL NON VERIFIED Ressources
router.get("/NotVerified", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin || req.isModerateur) {
      const result = await db.query(
        "SELECT * FROM ressource WHERE isVerified=false"
      );
      res.status(200).json({
        status: "success",
        ressources: result.rows,
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.post("/isVerified/:id", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin || req.isModerateur) {
      const result = await db.query(
        `UPDATE ressource SET isVerified='true' WHERE idRessource='${req.body.id}' RETURNING *`
      );
      res.status(200).json({
        status: "success",
        ressources: result.rows,
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// POST Ressource
router.post("/create", userAuth, async (req, res) => {
  const { titre, illustration, message, duree, TypRes, CatRes } = req.body;
  try {
    const result = await db.query(
      `INSERT INTO ressource (titreRessource, illustrationRessource, messageRessource, dureeRessource, idAuteur, idTypRes, idCatRes, isVerified ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *`,
      [titre, illustration, message, duree, req.idUser, TypRes, CatRes, false]
    );

    res.status(200).json({
      status: "success",
      ressource: result.rows[0],
    });
  } catch (err) {
    console.log(err);
    res.status(500).json({ err });
  }
});

//UPDATE A Ressource
router.put("/update", userAuth, async (req, res) => {
  const { id, titre, illustration, message, duree, TypRes, CatRes } = req.body;
  try {
      const ressource = await db.query(
      `SELECT * from ressource where idRessource=$1`,
      [id]
    );

    if (
      req.idUser === ressource.rows[0].idauteur ||
      req.isAdmin ||
      req.isSuperAdmin ||
      req.isModerateur
    ) {
      const result = await db.query(
        `UPDATE ressource SET
            titreRessource = $1, illustrationRessource = $2, messageRessource = $3, dureeRessource = $4, idTypRes = $5,
            idCatRes = $6, isVerified = false WHERE idressource = $7 RETURNING *`,
        [titre, illustration, message, duree, TypRes, CatRes, id]
      );

      res.status(200).json({
        status: "success",
        utilisateur: result.rows[0],
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    console.log(err);
    res.status(500).json({ err });
  }
});

//DELETE Ressource
router.delete("/delete/:id", userAuth, async (req, res) => {
  const { id } = req.body;
  try {
    const ressource = await db.query(
        `SELECT * from ressource where idRessource=$1`,
        [id]
    );
    if (
      req.idUser === ressource.rows[0].idauteur ||
      req.isAdmin ||
      req.isSuperAdmin ||
      req.isModerateur
    ) {
      const result = await db.query(
        `DELETE FROM ressource WHERE idRessource = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        message: "Ressource supprimée",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

//GET ALL Commentaires
router.get("/comm", async (req, res) => {
  try {
    const result = await db.query(
        "SELECT * FROM commentaire"
    );
    res.status(200).json({
      status: "success",
      commentaires: result.rows,
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
      "INSERT INTO commentaire (contenuCommentaire, idUser, idRessource) VALUES ($1, $2, $3) RETURNING *",
      [contenu, req.idUser, req.params.id]
    );

    /*const commsRess = await db.query(
        `SELECT commentaires FROM ressource WHERE idRessource = '${req.params.id}'`
    );

    const commentaires = commsRess.rows[0].push(
        commentaire.rows[0].idcommentaire
    );

    const ajoutCommRess = await db.query(
        `INSERT INTO ressource (commentaires) VALUES ($1) WHERE idRessource=$2 RETURNING *`,
        [commentaires, req.params.id]
    );*/

    res.status(200).json({
      /*commentaire: commentaire.rows[0],
      ressource: ajoutCommRess.rows[0],*/
      status: "success",
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//DELETE Commentaire
router.delete("/comm/delete/:id", userAuth, async (req, res) => {
  const { id } = req.body;
  try {
    const ressource = await db.query(
        `SELECT * from commentaire where idCommentaire=$1`,
        [id]
    );
    if (
        req.idUser === ressource.rows[0].idauteur ||
        req.isAdmin ||
        req.isSuperAdmin ||
        req.isModerateur
    ) {
      const result = await db.query(
          `DELETE FROM commentaire WHERE idCommentaire = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        message: "Commentaire supprimé",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE Ressource BY ID
router.get("/:id", async (req, res) => {
  try {
    const result = await db.query(
        `SELECT * FROM ressource WHERE idRessource = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      ressource: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

module.exports = router;
