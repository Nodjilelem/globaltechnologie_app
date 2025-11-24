const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const Service = require("../models/Service");

// ✅ GET all services
router.get("/", async (req, res) => {
  try {
    const services = await Service.find();
    res.json(services);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Erreur serveur lors de la récupération des services" });
  }
});

// ✅ POST a new service
router.post("/", async (req, res) => {
  const { nom, description, prix } = req.body;
  if (!nom || !description || prix == null)
    return res.status(400).json({ message: "Tous les champs (nom, description, prix) sont requis" });

  try {
    const service = new Service({ nom, description, prix });
    const newService = await service.save();
    res.status(201).json(newService);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Impossible de créer le service" });
  }
});

// ✅ PUT update a service
router.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { nom, description, prix } = req.body;

  if (!mongoose.Types.ObjectId.isValid(id))
    return res.status(400).json({ message: "ID invalide" });

  try {
    const updatedService = await Service.findByIdAndUpdate(
      id,
      { nom, description, prix },
      { new: true, runValidators: true }
    );

    if (!updatedService)
      return res.status(404).json({ message: "Service introuvable" });

    res.json(updatedService);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Erreur lors de la mise à jour du service" });
  }
});

// ✅ DELETE a service
router.delete("/:id", async (req, res) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id))
    return res.status(400).json({ message: "ID invalide" });

  try {
    const deletedService = await Service.findByIdAndDelete(id);
    if (!deletedService)
      return res.status(404).json({ message: "Service introuvable" });

    res.json({ message: "Service supprimé avec succès" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Erreur lors de la suppression du service" });
  }
});

module.exports = router;
