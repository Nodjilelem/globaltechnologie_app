// controllers/user.controller.js
const User = require("../models/user.model");

// 📌 Obtenir les infos d'un utilisateur connecté
exports.getUserProfile = async (req, res) => {
  try {
    // req.user.id vient du middleware JWT
    const user = await User.findById(req.user.id).select("-password");

    if (!user) {
      return res.status(404).json({ message: "Utilisateur non trouvé" });
    }

    res.status(200).json(user);
  } catch (error) {
    console.error("Erreur getUserProfile :", error);
    res.status(500).json({ message: "Erreur serveur" });
  }
};

// 📌 Modifier les infos d'un utilisateur
exports.updateUser = async (req, res) => {
  try {
    // Champs autorisés pour modification
    const allowedUpdates = ["name", "email", "phone"];
    const updates = {};

    // On ne laisse pas l'utilisateur modifier tout librement
    Object.keys(req.body).forEach((key) => {
      if (allowedUpdates.includes(key)) {
        updates[key] = req.body[key];
      }
    });

    // Empêcher modification du mot de passe ici
    if (req.body.password) {
      return res.status(400).json({
        message: "Le mot de passe ne peut pas être modifié ici."
      });
    }

    const updatedUser = await User.findByIdAndUpdate(
      req.user.id,
      updates,
      { new: true, runValidators: true }
    ).select("-password");

    if (!updatedUser) {
      return res.status(404).json({ message: "Utilisateur non trouvé" });
    }

    res.status(200).json({
      message: "Profil mis à jour avec succès",
      user: updatedUser,
    });

  } catch (error) {
    console.error("Erreur updateUser :", error);
    res.status(500).json({ message: "Erreur serveur", error });
  }
};
