class ArborescenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vue Globale")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Accueil"),
            onTap: () => Navigator.pushNamed(context, '/accueil'),
          ),
          ListTile(
            title: Text("Formulaire d'inscription"),
            onTap: () => Navigator.pushNamed(context, '/inscription'),
          ),
          ListTile(
            title: Text("Espace Vente"),
            onTap: () => Navigator.pushNamed(context, '/vente'),
          ),
          ListTile(
            title: Text("Formation Métier"),
            onTap: () => Navigator.pushNamed(context, '/formation'),
          ),
          Divider(),
          ListTile(
            title: Text("Électricité Bâtiment"),
            onTap: () => Navigator.pushNamed(context, '/electricite_batiment'),
          ),
          ListTile(
            title: Text("Électricité Industrielle"),
            onTap: () => Navigator.pushNamed(context, '/electricite_industrielle'),
          ),
          ListTile(
            title: Text("Électronique"),
            onTap: () => Navigator.pushNamed(context, '/electronique'),
          ),
          ListTile(
            title: Text("Panneaux Solaires"),
            onTap: () => Navigator.pushNamed(context, '/panneaux_solaires'),
          ),
          ListTile(
            title: Text("Antennes Paraboliques"),
            onTap: () => Navigator.pushNamed(context, '/antennes_paraboliques'),
          ),
          ListTile(
            title: Text("Dépannage Téléphone"),
            onTap: () => Navigator.pushNamed(context, '/depannage_telephone'),
          ),
          ListTile(
            title: Text("Informatique"),
            onTap: () => Navigator.pushNamed(context, '/informatique'),
          ),
          Divider(),
          ListTile(
            title: Text("Éditeur Structure Admin"),
            onTap: () => Navigator.pushNamed(context, '/admin_structure_editor'),
          ),
        ],
      ),
    );
  }
}
