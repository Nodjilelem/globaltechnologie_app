import 'package:flutter/material.dart';
import '../screens/product_options_page.dart'; // Assure-toi d’avoir ce fichier !

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String nom;
  final String prix;
  final Map<String, String> produit;

  const ProductCard({
    required this.imagePath,
    required this.nom,
    required this.prix,
    required this.produit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductOptionsPage(produit: produit),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                nom,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                prix,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
