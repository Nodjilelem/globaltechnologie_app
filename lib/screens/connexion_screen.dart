import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 🔹 Modèle utilisateur simple
class User {
  final String nom;
  final String prenom;
  final String email;

  User({required this.nom, required this.prenom, required this.email});
}

/// 🔹 Singleton pour stocker l’utilisateur courant
class CurrentUser {
  static User? user;
}

/// 🔹 Page de connexion
class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();

  /// 🔹 Connexion classique
  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final nom = _nomController.text.isNotEmpty ? _nomController.text : "Utilisateur";
      final prenom = _prenomController.text.isNotEmpty ? _prenomController.text : "";

      // 🔹 Stockage de l'utilisateur
      CurrentUser.user = User(nom: nom, prenom: prenom, email: email);

      // 🔹 Réinitialisation du formulaire
      _formKey.currentState!.reset();
      _emailController.clear();
      _passwordController.clear();
      _nomController.clear();
      _prenomController.clear();

      // 🔹 Navigation vers Dashboard
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  /// 🔹 Connexion Google (simulation)
  void _loginWithGoogle() {
    CurrentUser.user = User(
      nom: "Google",
      prenom: "User",
      email: "googleuser@gmail.com",
    );
    Navigator.pushNamed(context, '/dashboard');
  }

  /// 🔹 Connexion Facebook (simulation)
  void _loginWithFacebook() {
    CurrentUser.user = User(
      nom: "Facebook",
      prenom: "User",
      email: "facebookuser@gmail.com",
    );
    Navigator.pushNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 Email
              const Text("Adresse email", style: TextStyle(fontSize: 16, color: Colors.black)),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'exemple@email.com'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains("@")) {
                    return 'Entre une adresse valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // 🔹 Mot de passe
              const Text("Mot de passe", style: TextStyle(fontSize: 16, color: Colors.black)),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: '********'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Mot de passe trop court';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // 🔹 Bouton connexion
              Center(
                child: ElevatedButton(
                  onPressed: _submitLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(child: Text("ou se connecter avec", style: TextStyle(color: Colors.black))),
              const SizedBox(height: 20),

              // 🔹 Connexion Google / Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _loginWithGoogle,
                    icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                    label: const Text("Google", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4C20D),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _loginWithFacebook,
                    icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                    label: const Text("Facebook", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1877F2),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
