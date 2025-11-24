import 'package:flutter/material.dart';
import '../models/service.dart';
import '../services/api_service.dart';
import 'add_service_screen.dart';

class ServiceListScreen extends StatefulWidget {
  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  late Future<List<Service>> _services;

  @override
  void initState() {
    super.initState();
    _loadServices();
  }

  void _loadServices() {
    setState(() {
      _services = ApiService.fetchServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des services'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddServiceScreen()),
              );
              if (result == true) _loadServices(); // rafraîchir si ajout réussi
            },
          )
        ],
      ),
      body: FutureBuilder<List<Service>>(
        future: _services,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          final services = snapshot.data ?? [];
          if (services.isEmpty) {
            return const Center(child: Text('Aucun service disponible'));
          }

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return ListTile(
                title: Text(service.nom),
                subtitle: Text('${service.description} - ${service.prix} FCFA'),
              );
            },
          );
        },
      ),
    );
  }
}
