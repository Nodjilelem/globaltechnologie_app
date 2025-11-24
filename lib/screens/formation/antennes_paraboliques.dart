import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation sur les antennes paraboliques
/// 🇬🇧 Training screen for satellite dishes
class AntennesParaboliquesScreen extends StatelessWidget {
  const AntennesParaboliquesScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Antennes Paraboliques"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en antennes paraboliques"),
      ),
    );
  }
}
