import 'package:flutter/material.dart';

/// 🇫🇷 Écran principal de l’espace vente
/// 🇬🇧 Main screen for product showcase
class EspaceVenteProduits extends StatelessWidget {
  const EspaceVenteProduits({super.key}); // ✅ constructeur bien placé

  final List<Map<String, String>> produits = const [
    {
      'nom': 'Ordinateur Portable',
      'image': 'assets/ordinateur.png',
      'prix': '450 000 FCFA',
    },
    {
      'nom': 'Circuit Intégré TTL',
      'image': 'assets/circuit.png',
      'prix': '5 000 FCFA',
    },
    {
      'nom': 'Chargeur USB Rapide',
      'image': 'assets/chargeur.png',
      'prix': '8 000 FCFA',
    },
    {
      'nom': 'Batterie Lithium',
      'image': 'assets/batterie.png',
      'prix': '12 000 FCFA',
    },
    {
      'nom': 'Panneau Solaire 100W',
      'image': 'assets/panneau.png',
      'prix': '95 000 FCFA',
    },
    {
      'nom': 'Câble Ethernet',
      'image': 'assets/cable.png',
      'prix': '3 000 FCFA',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Espace Vente"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: produits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final produit = produits[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.shopping_cart),
                              title: const Text('Ajouter au panier'),
                              onTap: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${produit['nom']} ajouté au panier.')),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.info_outline),
                              title: const Text('Voir les détails'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailPage(produit: produit),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          produit['image'] ?? '',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      produit['nom'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      produit['prix'] ?? '',
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 🇫🇷 Écran de détail pour un produit sélectionné
/// 🇬🇧 Detail screen for selected product
class DetailPage extends StatelessWidget {
  final Map<String, String> produit;

  const DetailPage({required this.produit, super.key}); // ✅ Ajout du super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produit['nom'] ?? 'Détail'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              produit['image'] ?? '',
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              produit['nom'] ?? '',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              produit['prix'] ?? '',
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description du produit à ajouter ici...',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
