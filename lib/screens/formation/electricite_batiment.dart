import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation : Électricité Bâtiment  
/// 🇬🇧 Training screen: Building Electricity
class ElectriciteBatimentScreen extends StatelessWidget {
  const ElectriciteBatimentScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Électricité Bâtiment"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en électricité bâtiment"),
      ),
    );
  }
}
