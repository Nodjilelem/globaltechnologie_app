import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation : Électronique  
/// 🇬🇧 Training screen: Electronics
class ElectroniqueScreen extends StatelessWidget {
  const ElectroniqueScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Électronique"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en électronique"),
      ),
    );
  }
}
