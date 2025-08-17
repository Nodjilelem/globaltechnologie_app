import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AdminStructureEditor extends StatefulWidget {
  @override
  _AdminStructureEditorState createState() => _AdminStructureEditorState();
}

class _AdminStructureEditorState extends State<AdminStructureEditor> {
  TextEditingController _jsonController = TextEditingController();

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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("✅ JSON sauvegardé localement")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🛠️ Éditeur de Structure"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _jsonController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fichier JSON',
                  alignLabelWithHint: true,
                ),
                style: TextStyle(fontFamily: 'monospace', fontSize: 14),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              icon: Icon(Icons.save),
              label: Text("Sauvegarder"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: _saveJson,
            ),
          ],
        ),
      ),
    );
  }
}
