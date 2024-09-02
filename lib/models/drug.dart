// ignore_for_file: non_constant_identifier_names

import 'package:drfungus_app/data/data.dart';

class Drug {
  const Drug(
      {required this.name,
      required this.name_lower,
      required this.keywords,
      required this.mechanism,
      required this.susceptibility,
      required this.dosage,
      required this.adverse,
      required this.status,
      required this.references,
      required this.trials});

  final String name;
  final String name_lower;
  final List<dynamic> keywords;
  final String mechanism;
  final String susceptibility;
  final String dosage;
  final String adverse;
  final String status;
  final List<dynamic> references;
  final List<dynamic> trials;

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      name: map['name'] ?? '',
      name_lower: map["name_lower"] ?? '',
      keywords: map['keywords'] ?? [""],
      mechanism: map['mechanism'] ?? {},
      susceptibility: map['susceptibility'] ?? '',
      dosage: map['dosage'] ?? '',
      adverse: map['adverse'] ?? '',
      status: map['status'] ?? '',
      references: map['references'] ?? [],
      trials: map['trials'] ?? [],
    );
  }
}
