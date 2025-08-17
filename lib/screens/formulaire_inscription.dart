import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormulaireInscription extends StatefulWidget {
  @override
  _FormulaireInscriptionState createState() => _FormulaireInscriptionState();
}

class _FormulaireInscriptionState extends State<FormulaireInscription> {
  final _formKey = GlobalKey<FormState>();
  String? nom, prenom, email, motDePasse;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery); // 📸 Ou .camera
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
        leading: BackButton(),
        title: Text("Créer un compte"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : AssetImage('assets/di.png') as ImageProvider,
                  child: _image == null
                      ? Icon(Icons.add_a_photo, size: 30, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 10),
              Text("Ajouter une photo de profil", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(labelText: "Nom"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Entrez votre nom' : null,
                onSaved: (value) => nom = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Prénom"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Entrez votre prénom' : null,
                onSaved: (value) => prenom = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value == null || !value.contains('@') ? 'Email invalide' : null,
                onSaved: (value) => email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                validator: (value) =>
                    value == null || value.length < 6 ? 'Mot de passe trop court' : null,
                onSaved: (value) => motDePasse = value,
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Veuillez ajouter une photo")),
                      );
                      return;
                    }

                    _formKey.currentState!.save();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                  "Compte créé avec succès pour \$prenom \$nom"),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: Text("Créer mon compte"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}