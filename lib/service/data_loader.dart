import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<void> loadJsonData() async {
  final String response = await rootBundle.loadString('assets/structure.json');
  final data = await json.decode(response);
  print(data); // Ou fais ce que tu veux avec les données
}
