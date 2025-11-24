class Service {
  final String id;
  final String nom;
  final String description;
  final int prix;

  Service({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      nom: json['nom'],
      description: json['description'] ?? '',
      prix: json['prix'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "description": description,
      "prix": prix,
    };
  }
}
