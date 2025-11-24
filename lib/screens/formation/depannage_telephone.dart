import 'package:flutter/material.dart';

/// 🇫🇷 Écran de formation : Dépannage Téléphone
/// 🇬🇧 Training screen: Phone Repair
class DepannageTelephoneScreen extends StatelessWidget {
  const DepannageTelephoneScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dépannage Téléphone"),
      ),
      body: const Center(
        child: Text("Contenu de la formation en dépannage de téléphone"),
      ),
    );
  }
}
