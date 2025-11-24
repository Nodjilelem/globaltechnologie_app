import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

/// 🇫🇷 Widget principal pour afficher la structure du projet
/// 🇬🇧 Main widget to display project structure
class StructureViewer extends StatefulWidget {
  const StructureViewer({super.key}); // ✅ constructeur correct

  @override
  State<StructureViewer> createState() => _StructureViewerState(); // ✅ méthode unique
}

class _StructureViewerState extends State<StructureViewer> {
  late Future<Map<String, dynamic>> structureFuture;

  @override
  void initState() {
    super.initState();
    structureFuture = loadAppStructure(); // ✅ chargement du JSON
  }

  Future<Map<String, dynamic>> loadAppStructure() async {
    final String jsonString = await rootBundle.loadString('assets/structure.json');
    return json.decode(jsonString); // ✅ décodage du JSON
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Structure du Projet"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: structureFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erreur de chargement"));
          } else {
            final screens = snapshot.data!['screens'] as List<dynamic>;
            final widgets = snapshot.data!['widgets'] as List<dynamic>;

            return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text("📱 Écrans :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ...screens.map((screen) => ListTile(title: Text(screen))),
                const SizedBox(height: 20),
                const Text("🔧 Widgets :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ...widgets.map((widgetName) => ListTile(title: Text(widgetName))),
              ],
            );
          }
        },
      ),
    );
  }
}
