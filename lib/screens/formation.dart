import 'package:flutter/material.dart';

// Écran pour afficher les détails d’une formation
class FormationDetailScreen extends StatelessWidget {
  final String titre;
  final String description;

  const FormationDetailScreen({
    required this.titre,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(titre),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Liste des formations
class FormationScreen extends StatelessWidget {
  final List<Map<String, String>> formations = [
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Formations Métiers"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: formations.length,
        itemBuilder: (context, index) {
          final item = formations[index];
          return Card(
            elevation: 5,
            shadowColor: Colors.indigo,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["titre"]!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item["description"]!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
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
                      child: Text("Commencer la formation"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        ),
                      ),
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
