import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/service.dart';

class ApiService {
  // 🔗 Base URL du backend
  // Pour PC (Flutter Web ou Linux/Windows) : 'http://localhost:5000/api/services'
  // Pour Android Emulator : 'http://10.0.2.2:5000/api/services'
  // Pour téléphone réel connecté au même Wi-Fi : 'http://192.168.x.x:5000/api/services'
  static const String baseUrl = 'http://10.0.2.2:5000/api/services';

  // 🔹 GET : récupérer tous les services
  static Future<List<Service>> fetchServices() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((service) => Service.fromJson(service)).toList();
    } else {
      throw Exception('Erreur lors du chargement des services : ${response.statusCode}');
    }
  }

  // 🔹 POST : ajouter un service
  static Future<Service> addService(Service service) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(service.toJson()),
    );

    if (response.statusCode == 201) {
      return Service.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur lors de la création du service : ${response.statusCode}');
    }
  }
}
