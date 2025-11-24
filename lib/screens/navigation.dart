import 'package:flutter/material.dart';

/// 🇫🇷 Écran d’arborescence pour naviguer dans les sections du projet
/// 🇬🇧 Tree view screen to navigate project sections
class ArborescenceScreen extends StatelessWidget {
  const ArborescenceScreen({super.key}); // ✅ constructeur bien placé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vue Globale")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Accueil"),
            onTap: () => Navigator.pushNamed(context, '/accueil'),
          ),
          ListTile(
            title: const Text("Formulaire d'inscription"),
            onTap: () => Navigator.pushNamed(context, '/inscription'),
          ),
          ListTile(
            title: const Text("Espace Vente"),
            onTap: () => Navigator.pushNamed(context, '/vente'),
          ),
          ListTile(
            title: const Text("Formation Métier"),
            onTap: () => Navigator.pushNamed(context, '/formation'),
          ),
          const Divider(),
          ListTile(
            title: const Text("Électricité Bâtiment"),
            onTap: () => Navigator.pushNamed(context, '/electricite_batiment'),
          ),
          ListTile(
            title: const Text("Électricité Industrielle"),
            onTap: () => Navigator.pushNamed(context, '/electricite_industrielle'),
          ),
          ListTile(
            title: const Text("Électronique"),
            onTap: () => Navigator.pushNamed(context, '/electronique'),
          ),
          ListTile(
            title: const Text("Panneaux Solaires"),
            onTap: () => Navigator.pushNamed(context, '/panneaux_solaires'),
          ),
          ListTile(
            title: const Text("Antennes Paraboliques"),
            onTap: () => Navigator.pushNamed(context, '/antennes_paraboliques'),
          ),
          ListTile(
            title: const Text("Dépannage Téléphone"),
            onTap: () => Navigator.pushNamed(context, '/depannage_telephone'),
          ),
          ListTile(
            title: const Text("Informatique"),
            onTap: () => Navigator.pushNamed(context, '/informatique'),
          ),
          const Divider(),
          ListTile(
            title: const Text("Éditeur Structure Admin"),
            onTap: () => Navigator.pushNamed(context, '/admin_structure_editor'),
          ),
        ],
      ),
    );
  }
}
