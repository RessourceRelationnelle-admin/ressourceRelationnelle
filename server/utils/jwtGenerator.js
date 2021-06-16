const jwt = require("jsonwebtoken");
require("dotenv").config();

function jwtGenerator(idUser, isAdmin, isSuperAdmin, isModerateur) {
  const payload = {
    idUser: idUser,
    isAdmin: isAdmin,
    isSuperAdmin: isSuperAdmin,
    isModerateur: isModerateur,
  };

  // eslint-disable-next-line no-undef
  return jwt.sign(payload, process.env.JWTSECRET, { expiresIn: "3h" });
}

module.exports = jwtGenerator;
