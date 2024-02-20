class Bug {
  const Bug(
      {required this.name,
      required this.taxonomy,
      required this.description,
      required this.species,
      required this.clinical,
      required this.features,
      required this.precautions,
      required this.susceptibility});

  final String name;
  final Map taxonomy;
  final String description;
  final String species;
  final String clinical;
  final String features;
  final String precautions;
  final String susceptibility;
}
