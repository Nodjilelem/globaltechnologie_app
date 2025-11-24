import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart'; // Pour debugPrint

Future<void> loadJsonData() async {
  try {
    final String response = await rootBundle.loadString('assets/structure.json');
    final dynamic data = json.decode(response);

    // ✅ Utilise debugPrint au lieu de print
    debugPrint(data.toString());

    // ✅ Tu peux aussi retourner les données si besoin
    // return data;
  } catch (e) {
    debugPrint('❌ Erreur lors du chargement du JSON : $e');
  }
}
