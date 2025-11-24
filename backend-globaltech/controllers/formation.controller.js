// controllers/formation.controller.js
const Formation = require("../models/formation.model");

// ➤ Ajouter une nouvelle formation
exports.createFormation = async (req, res) => {
  try {
    const formation = await Formation.create(req.body);
    res.status(201).json({ message: "Formation créée avec succès", formation });
  } catch (error) {
    res.status(500).json({ message: "Erreur de création", error });
  }
};

// ➤ Obtenir toutes les formations
exports.getAllFormations = async (req, res) => {
  try {
    const formations = await Formation.find();
    res.status(200).json(formations);
  } catch (error) {
    res.status(500).json({ message: "Erreur serveur", error });
  }
};

// ➤ Obtenir une formation par ID
exports.getFormationById = async (req, res) => {
  try {
    const formation = await Formation.findById(req.params.id);
    if (!formation) return res.status(404).json({ message: "Formation non trouvée" });

    res.status(200).json(formation);
  } catch (error) {
    res.status(500).json({ message: "Erreur serveur", error });
  }
};

// ➤ Supprimer une formation
exports.deleteFormation = async (req, res) => {
  try {
    await Formation.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: "Formation supprimée" });
  } catch (error) {
    res.status(500).json({ message: "Erreur", error });
  }
};
