import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 🇫🇷 Formulaire d'inscription avec photo de profil
/// 🇬🇧 Registration form with profile picture
class FormulaireInscription extends StatefulWidget {
  const FormulaireInscription({super.key});

  @override
  State<FormulaireInscription> createState() => _FormulaireInscriptionState();
}

class _FormulaireInscriptionState extends State<FormulaireInscription> {
  final _formKey = GlobalKey<FormState>();
  String? nom, prenom, email, motDePasse;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // 🔹 Fonction pour choisir une image
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Créer un compte"),
        backgroundColor: Colors.blue[800], // Bleu professionnel
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 🔹 Avatar / photo de profil
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : const AssetImage('assets/di.png') as ImageProvider,
                  child: _image == null
                      ? const Icon(Icons.add_a_photo, size: 30, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ajouter une photo de profil",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // 🔹 Champs du formulaire
              TextFormField(
                decoration: const InputDecoration(labelText: "Nom"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Entrez votre nom' : null,
                onSaved: (value) => nom = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Prénom"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Entrez votre prénom' : null,
                onSaved: (value) => prenom = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value == null || !value.contains('@') ? 'Email invalide' : null,
                onSaved: (value) => email = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                validator: (value) =>
                    value == null || value.length < 6 ? 'Mot de passe trop court' : null,
                onSaved: (value) => motDePasse = value,
              ),

              const SizedBox(height: 30),

              // 🔹 Bouton soumission
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Veuillez ajouter une photo")),
                      );
                      return;
                    }

                    _formKey.currentState!.save();

                    // 🔹 Message de succès
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.white),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text("Compte créé avec succès pour $prenom $nom"),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 3),
                      ),
                    );

                    // 🔹 Réinitialisation automatique du formulaire et de l'image
                    _formKey.currentState!.reset();
                    setState(() {
                      _image = null;
                      nom = null;
                      prenom = null;
                      email = null;
                      motDePasse = null;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  "Créer mon compte",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
