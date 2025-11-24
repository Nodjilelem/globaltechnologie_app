import 'package:flutter/material.dart';

/// 🇫🇷 Écran pour afficher les détails d’une formation
/// 🇬🇧 Screen to display training details
class FormationDetailScreen extends StatelessWidget {
  final String titre;
  final String description;

  const FormationDetailScreen({
    required this.titre,
    required this.description,
    super.key, // ✅ Ajout du paramètre key dans le constructeur
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(titre),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// 🇫🇷 Écran principal listant les formations disponibles
/// 🇬🇧 Main screen listing available trainings
class FormationScreen extends StatelessWidget {
  const FormationScreen({super.key}); // ✅ Correction de la déclaration

  final List<Map<String, String>> formations = const [
    {
      "titre": "Électricité bâtiment",
      "description": "Bases et techniques de câblage domestique.",
    },
    {
      "titre": "Électricité industrielle",
      "description": "Installation et automatisation industrielle.",
    },
    {
      "titre": "Électronique",
      "description": "Diagnostic, soudure et composants.",
    },
    {
      "titre": "Installation panneaux solaires",
      "description": "Autonomie énergétique et mise en réseau.",
    },
    {
      "titre": "Installation antennes paraboliques",
      "description": "Réception satellite et configuration.",
    },
    {
      "titre": "Dépannage téléphone portable",
      "description": "Réparation matérielle et logicielle.",
    },
    {
      "titre": "Initiation informatique",
      "description": "Compétences de base et bureautique.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Formations Métiers"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: formations.length,
        itemBuilder: (context, index) {
          final item = formations[index];
          return Card(
            elevation: 5,
            shadowColor: Colors.indigo,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["titre"]!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item["description"]!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FormationDetailScreen(
                              titre: item["titre"]!,
                              description: item["description"]!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        ),
                      ),
                      child: const Text("Commencer la formation"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
