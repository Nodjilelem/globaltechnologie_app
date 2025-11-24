const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const Formation = require("../models/Formation");

// ✅ GET all formations
router.get("/", async (req, res) => {
  try {
    const formations = await Formation.find();
    res.json(formations);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Erreur serveur lors de la récupération des formations" });
  }
});

// ✅ POST a new formation
router.post("/", async (req, res) => {
  const { titre, description, prix } = req.body;
  if (!titre || !description || prix == null)
    return res.status(400).json({ message: "Tous les champs (titre, description, prix) sont requis" });

  try {
    const formation = new Formation({ titre, description, prix });
    const newFormation = await formation.save();
    res.status(201).json(newFormation);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Impossible de créer la formation" });
  }
});

// ✅ PUT update a formation
router.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { titre, description, prix } = req.body;

  if (!mongoose.Types.ObjectId.isValid(id))
    return res.status(400).json({ message: "ID invalide" });

  try {
    const updatedFormation = await Formation.findByIdAndUpdate(
      id,
      { titre, description, prix },
      { new: true, runValidators: true }
    );

    if (!updatedFormation)
      return res.status(404).json({ message: "Formation introuvable" });

    res.json(updatedFormation);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Erreur lors de la mise à jour de la formation" });
  }
});

// ✅ DELETE a formation
router.delete("/:id", async (req, res) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id))
    return res.status(400).json({ message: "ID invalide" });

  try {
    const deletedFormation = await Formation.findByIdAndDelete(id);
    if (!deletedFormation)
      return res.status(404).json({ message: "Formation introuvable" });

    res.json({ message: "Formation supprimée avec succès" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Erreur lors de la suppression de la formation" });
  }
});

module.exports = router;
