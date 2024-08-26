// ignore_for_file: non_constant_identifier_names

class Mycoses {
  const Mycoses({
    required this.name,
    required this.name_lower,
    required this.keywords,
    required this.mycology,
    required this.epidemiology,
    required this.clinical,
    required this.pathogenesis,
    required this.diagnosis,
    required this.treatment,
  });

  final String name;
  final String name_lower;
  final List<dynamic> keywords;
  final String mycology;
  final String epidemiology;
  final String clinical;
  final String pathogenesis;
  final String diagnosis;
  final String treatment;

  factory Mycoses.fromMap(Map<String, dynamic> map) {
    return Mycoses(
      name: map['name'] ?? '',
      name_lower: map["name_lower"] ?? '',
      keywords: map['keywords'] ?? [""],
      mycology: map['mycology'] ?? {},
      epidemiology: map['epidemiology'] ?? '',
      clinical: map['clinical'] ?? '',
      pathogenesis: map['pathogenesis'] ?? '',
      diagnosis: map['diagnosis'] ?? '',
      treatment: map['treatment'] ?? '',
    );
  }
}
