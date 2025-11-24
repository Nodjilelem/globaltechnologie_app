const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// 🔹 Import des routes
const userRoute = require('./routes/userRoute');
const serviceRoute = require('./routes/serviceRoute');
const formationRoute = require('./routes/formationRoute');

// 🔹 Déclaration des routes
app.use('/api/users', userRoute);
app.use('/api/services', serviceRoute);
app.use('/api/formations', formationRoute);

// 🔹 Route racine (IMPORTANT)
app.get('/', (req, res) => {
  res.send('Bienvenue sur l’API GlobalTechnologie !');
});

// 🔹 Gestion des routes non trouvées
app.use((req, res) => {
  res.status(404).json({ message: 'Route non trouvée' });
});

// 🔹 Connexion MongoDB + démarrage du serveur
mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    console.log('✅ Connexion MongoDB réussie');
    app.listen(PORT, () => {
      console.log(`🚀 Serveur lancé sur http://localhost:${PORT}`);
    });
  })
  .catch((err) => {
    console.error('❌ Erreur MongoDB :', err);
  });
