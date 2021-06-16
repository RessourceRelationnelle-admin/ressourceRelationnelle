require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");

// Import all Routes
const usersRoutes = require("./routes/users");
const relationsRoutes = require("./routes/relations");
const relationTypesRoutes = require("./routes/relationTypes");
const ressourceCategoriesRoutes = require("./routes/ressourceCategories");
const ressourceTypesRoutes = require("./routes/ressourceTypes");
const ressourcesRoutes = require("./routes/ressources");
const participationRoutes = require("./routes/participation");
const favorisRoutes = require("./routes/favoris");

// Middlewares
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(bodyParser.raw());

// Routes
app.use("/users", usersRoutes);
app.use("/reltyp", relationTypesRoutes);
app.use("/rel", relationsRoutes);
app.use("/rescat", ressourceCategoriesRoutes);
app.use("/restyp", ressourceTypesRoutes);
app.use("/res", ressourcesRoutes);
app.use("/participation", participationRoutes);
app.use("/fav", favorisRoutes);

// Launching the server
// eslint-disable-next-line no-undef
const port = process.env.PORT || 5001;
app.listen(port, () => {
  console.log(`ResRel API is running on port ${port}`);
});
