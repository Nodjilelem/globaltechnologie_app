import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> produit;

  const ProductDetailPage({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détails du produit")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(produit['image'] ?? 'assets/ordinateur.png'),
            const SizedBox(height: 16),
            Text("Nom : ${produit['nom'] ?? 'Ordinateur Portable'}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Prix : ${produit['prix'] ?? '450 000 FCFA'}",
                style: const TextStyle(fontSize: 18, color: Colors.deepPurple)),
            const SizedBox(height: 24),
            const Text(
              "💬 Commentaire politique commercial :\nCe produit est très apprécié pour sa qualité et ses performances. Idéal pour les professionnels exigeants !",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
