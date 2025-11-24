import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation : Informatique  
/// 🇬🇧 Training screen: Computer Basics
class InformatiqueScreen extends StatelessWidget {
  const InformatiqueScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informatique"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en informatique"),
      ),
    );
  }
}
