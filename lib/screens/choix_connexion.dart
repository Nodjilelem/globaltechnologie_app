import 'package:flutter/material.dart';

class ChoixConnexion extends StatelessWidget {
  const ChoixConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: Colors.blue[800], // bleu foncé
        foregroundColor: Colors.white, // texte blanc
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Bouton S’inscrire (bleu)
              ElevatedButton.icon(
                icon: const Icon(Icons.person_add),
                label: const Text("S’inscrire"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800], // bleu
                  foregroundColor: Colors.white, // texte blanc
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/inscription');
                },
              ),

              const SizedBox(height: 20),

              // Bouton Se connecter (jaune)
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("Se connecter"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[600], // jaune
                  foregroundColor: Colors.white, // texte blanc
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/connexion');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
