class Drug {
  const Drug(
      {required this.name,
      required this.name_lower,
      required this.mechanism,
      required this.susceptibility,
      required this.dosage,
      required this.adverse,
      required this.status});

  final String name;
  final String name_lower;
  final String mechanism;
  final String susceptibility;
  final String dosage;
  final String adverse;
  final String status;

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      name: map['name'] ?? '',
      name_lower: map["name_lower"] ?? '',
      mechanism: map['mechanism'] ?? {},
      susceptibility: map['susceptibility'] ?? '',
      dosage: map['dosage'] ?? '',
      adverse: map['adverse'] ?? '',
      status: map['status'] ?? '',
    );
  }
}
