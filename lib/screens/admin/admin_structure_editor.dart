import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// 🇫🇷 Éditeur JSON pour la structure du projet  
/// 🇬🇧 JSON editor for project structure
class AdminStructureEditor extends StatefulWidget {
  const AdminStructureEditor({super.key}); // ✅ constructeur bien placé

  @override
  State<AdminStructureEditor> createState() => _AdminStructureEditorState(); // ✅ méthode unique
}

class _AdminStructureEditorState extends State<AdminStructureEditor> {
  final TextEditingController _jsonController = TextEditingController(); // ✅ final ajouté

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    final String jsonString = await rootBundle.loadString('assets/structure.json');
    _jsonController.text = jsonString;
  }

  Future<void> _saveJson() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/structure_modified.json');
    await file.writeAsString(_jsonController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("✅ JSON sauvegardé localement")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🛠️ Éditeur de Structure"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _jsonController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fichier JSON',
                  alignLabelWithHint: true,
                ),
                style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Sauvegarder"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: _saveJson,
            ),
          ],
        ),
      ),
    );
  }
}
