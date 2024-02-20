class Drug {
  const Drug(
      {required this.name,
      required this.mechanism,
      required this.susceptibility,
      required this.dosage,
      required this.adverse,
      required this.status});

  final String name;
  final String mechanism;
  final String susceptibility;
  final String dosage;
  final String adverse;
  final String status;
}
