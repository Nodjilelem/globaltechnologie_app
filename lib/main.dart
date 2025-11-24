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

// Écran de connexion
import 'screens/connexion_screen.dart';

// Écran lié au backend
import 'screens/service_list_screen.dart';

// 🔹 Nouvelle page choix connexion
import 'screens/choix_connexion.dart';

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
        '/choixConnexion': (context) => const ChoixConnexion(), // 🔹 ajoutée
        '/inscription': (context) => FormulaireInscription(),
        '/connexion': (context) => ConnexionScreen(),
        '/admin_structure_editor': (context) => AdminStructureEditor(),

        '/vente': (context) => const EspaceVenteProduits(),
        '/formation': (context) => const FormationScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/structure': (context) => const StructureViewer(),

        '/electricite_batiment': (context) => const ElectriciteBatimentScreen(),
        '/electricite_industrielle': (context) => const ElectriciteIndustrielleScreen(),
        '/electronique': (context) => const ElectroniqueScreen(),
        '/panneaux_solaires': (context) => const PanneauxSolairesScreen(),
        '/antennes_paraboliques': (context) => const AntennesParaboliquesScreen(),
        '/depannage_telephone': (context) => const DepannageTelephoneScreen(),
        '/informatique': (context) => const InformatiqueScreen(),

        // Nouvelle route pour les services backend
        '/services': (context) => ServiceListScreen(),
      },
    );
  }
}
