// ignore_for_file: non_constant_identifier_names

class Bug {
  const Bug(
      {required this.name,
      required this.name_lower,
      required this.keywords,
      required this.taxonomy,
      required this.description,
      required this.species,
      required this.clinical,
      required this.features,
      required this.precautions,
      required this.susceptibility});

  final String name;
  final String name_lower;
  final List<dynamic> keywords;
  final Map taxonomy;
  final String description;
  final String species;
  final String clinical;
  final String features;
  final String precautions;
  final String susceptibility;

  factory Bug.fromMap(Map<String, dynamic> map) {
    return Bug(
      name: map['name'] ?? '',
      name_lower: map["name_lower"] ?? '',
      keywords: map['keywords'] ?? [""],
      taxonomy: map['taxonomy'] ?? {},
      description: map['description'] ?? '',
      species: map['species'] ?? '',
      clinical: map['clinical'] ?? '',
      features: map['features'] ?? '',
      precautions: map['precautions'] ?? '',
      susceptibility: map['susceptibility'] ?? '',
    );
  }
}
