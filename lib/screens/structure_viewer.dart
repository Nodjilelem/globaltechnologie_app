import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class StructureViewer extends StatefulWidget {
  @override
  _StructureViewerState createState() => _StructureViewerState();
}

class _StructureViewerState extends State<StructureViewer> {
  late Future<Map<String, dynamic>> structureFuture;

  @override
  void initState() {
    super.initState();
    structureFuture = loadAppStructure();
  }

  Future<Map<String, dynamic>> loadAppStructure() async {
    final String jsonString = await rootBundle.loadString('assets/structure.json');
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Structure du Projet"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: structureFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur de chargement"));
          } else {
            final screens = snapshot.data!['screens'] as List<dynamic>;
            final widgets = snapshot.data!['widgets'] as List<dynamic>;

            return ListView(
              padding: EdgeInsets.all(15),
              children: [
                Text("📱 Écrans :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ...screens.map((screen) => ListTile(title: Text(screen))),
                SizedBox(height: 20),
                Text("🔧 Widgets :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ...widgets.map((widgetName) => ListTile(title: Text(widgetName))),
              ],
            );
          }
        },
      ),
    );
  }
}
