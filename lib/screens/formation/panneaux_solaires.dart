import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation : Panneaux Solaires  
/// 🇬🇧 Training screen: Solar Panels
class PanneauxSolairesScreen extends StatelessWidget {
  const PanneauxSolairesScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panneaux Solaires"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en panneaux solaires"),
      ),
    );
  }
}
