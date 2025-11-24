import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation : Électricité Industrielle  
/// 🇬🇧 Training screen: Industrial Electricity
class ElectriciteIndustrielleScreen extends StatelessWidget {
  const ElectriciteIndustrielleScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Électricité Industrielle"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en électricité industrielle"),
      ),
    );
  }
}
