// controllers/service.controller.js
const Service = require("../models/service.model");

// Ajouter un service
exports.createService = async (req, res) => {
  try {
    const service = await Service.create(req.body);
    res.status(201).json({ message: "Service créé", service });
  } catch (error) {
    res.status(500).json({ message: "Erreur", error });
  }
};

// Récupérer tous les services
exports.getAllServices = async (req, res) => {
  try {
    const services = await Service.find();
    res.status(200).json(services);
  } catch (error) {
    res.status(500).json({ message: "Erreur serveur", error });
  }
};

// Récupérer un service par ID
exports.getServiceById = async (req, res) => {
  try {
    const service = await Service.findById(req.params.id);
    if (!service) return res.status(404).json({ message: "Service non trouvé" });
    res.status(200).json(service);
  } catch (error) {
    res.status(500).json({ message: "Erreur serveur", error });
  }
};

// Supprimer un service
exports.deleteService = async (req, res) => {
  try {
    await Service.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: "Service supprimé" });
  } catch (error) {
    res.status(500).json({ message: "Erreur", error });
  }
};
