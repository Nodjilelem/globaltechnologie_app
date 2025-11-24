const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const userRoute = require("./routes/userRoute");
const serviceRoute = require("./routes/serviceRoute");
const formationRoute = require("./routes/formationRoute");

const app = express();

// 🔹 Middlewares
app.use(cors());
app.use(express.json());

// 🔹 Routes
app.use("/api/users", userRoute);
app.use("/api/services", serviceRoute);
app.use("/api/formations", formationRoute);

// 🔹 Route racine
app.get("/", (req, res) => {
  res.send("Bienvenue sur l'API GlobalTechnologie !");
});

// 🔹 Gestion des erreurs
app.use((req, res, next) => {
  res.status(404).json({ message: "Route non trouvée" });
});

// 🔹 Connexion MongoDB + démarrage serveur
mongoose.connect(process.env.MONGO_URI)
  .then(() => {
    console.log("✅ MongoDB connecté");
    const port = process.env.PORT || 3000;
    app.listen(port, () => console.log(`🚀 Serveur démarré sur le port ${port}`));
  })
  .catch(err => {
    console.error("❌ Erreur MongoDB :", err);
    process.exit(1);
  });
