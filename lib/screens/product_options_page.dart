import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class ProductOptionsPage extends StatelessWidget {
  final Map<String, String> produit;

  const ProductOptionsPage({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produit['nom'] ?? "Ordinateur Portable")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(produit['image'] ?? 'assets/ordinateur.png'),
            const SizedBox(height: 16),
            Text("Prix : ${produit['prix'] ?? '450 000 FCFA'}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Ajouter au panier"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("🛒 Produit ajouté au panier")),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.info_outline),
              label: const Text("Voir les détails"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(produit: produit),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
