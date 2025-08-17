import 'package:flutter/material.dart';

// Écrans principaux
import 'screens/accueil.dart';
import 'screens/formulaire_inscription.dart';
import 'screens/espace_vente.dart';
import 'screens/formation.dart';
import 'screens/dashboard_screen.dart';

// Écrans de formation métier
import 'screens/formation/electricite_batiment.dart';
import 'screens/formation/electricite_industrielle.dart';
import 'screens/formation/electronique.dart';
import 'screens/formation/panneaux_solaires.dart';
import 'screens/formation/antennes_paraboliques.dart';
import 'screens/formation/depannage_telephone.dart';
import 'screens/formation/informatique.dart';

// Écrans de structure et admin
import 'screens/structure_viewer.dart';
import 'screens/admin/admin_structure_editor.dart';

// Écran de connexion (à ajouter si pas encore créé)
import 'screens/connexion_screen.dart'; // 🔑 Assure-toi que ce fichier existe
import 'screens/product_detail_page.dart';

void main() {
  runApp(const GlobalTechnologieApp());
}

class GlobalTechnologieApp extends StatelessWidget {
  const GlobalTechnologieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlobalTechnologie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFE0F7FA),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AccueilGlobalTechnologie(),

        // ⛔️ Correction ici : suppression du "const" pour éviter erreur de compilation
        '/inscription': (context) => FormulaireInscription(),
        '/connexion': (context) => ConnexionScreen(),

        '/vente': (context) => EspaceVenteProduits(),
        '/formation': (context) => FormationScreen(),
        '/dashboard': (context) => const DashboardScreen(),

        // Routes de formation métier
        '/electricite_batiment': (context) => ElectriciteBatimentScreen(),
        '/electricite_industrielle': (context) => ElectriciteIndustrielleScreen(),
        '/electronique': (context) => ElectroniqueScreen(),
        '/panneaux_solaires': (context) => PanneauxSolairesScreen(),
        '/antennes_paraboliques': (context) => AntennesParaboliquesScreen(),
        '/depannage_telephone': (context) => DepannageTelephoneScreen(),
        '/informatique': (context) => InformatiqueScreen(),

        // Routes structure et admin
        '/structure': (context) => StructureViewer(),
        '/admin_structure_editor': (context) => AdminStructureEditor(),
      },
    );
  }
}
