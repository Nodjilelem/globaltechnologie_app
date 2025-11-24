const mongoose = require("mongoose");

const formationSchema = new mongoose.Schema({
  titre: { type: String, required: true },
  description: { type: String, required: true },
  prix: { type: Number, required: true },
}, { timestamps: true });

module.exports = mongoose.model("Formation", formationSchema);
