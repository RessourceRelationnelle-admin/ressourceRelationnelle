const jwt = require("jsonwebtoken");
require("dotenv").config();

module.exports = (req, res, next) => {
  try {
    const jwtToken = req.headers.authorization.split(" ")[1];
    if (!jwtToken) {
      return res.status(403).json("Non autorisÃ©");
    } else {
      // eslint-disable-next-line no-undef
      const decodedToken = jwt.verify(jwtToken, process.env.JWTSECRET);
      req.idUser = decodedToken.idUser;
      req.isAdmin = decodedToken.isAdmin;
      req.isSuperAdmin = decodedToken.isSuperAdmin;
      req.isModerateur = decodedToken.isModerateur;
      next();
    }
  } catch (err) {
    res.status(403).json({ err });
  }
};
