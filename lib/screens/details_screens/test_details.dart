import 'package:drfungus_app/widgets/formattedtext.dart';
import 'package:flutter/material.dart';
import "package:simple_rich_text/simple_rich_text.dart";

class TestDetailsScreen extends StatelessWidget {
  const TestDetailsScreen({required this.data, super.key});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (data.taxonomy["kingdom"].isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Text(
              "Taxonomic Classification",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.taxonomy["kingdom"].isNotEmpty)
          Row(
            children: [
              SimpleRichText(
                "Kingdom: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SimpleRichText(
                data.taxonomy["kingdom"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        if (data.taxonomy["phylum"].isNotEmpty)
          Row(
            children: [
              SimpleRichText(
                "Phylum: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SimpleRichText(
                data.taxonomy["phylum"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        if (data.taxonomy["subphylum"].isNotEmpty)
          Row(
            children: [
              SimpleRichText(
                "Subphylum: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SimpleRichText(
                data.taxonomy["subphylum"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        if (data.taxonomy["order"].isNotEmpty)
          Row(
            children: [
              SimpleRichText(
                "Order: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SimpleRichText(
                data.taxonomy["order"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        if (data.taxonomy["family"].isNotEmpty)
          Row(
            children: [
              SimpleRichText(
                "Family: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SimpleRichText(
                data.taxonomy["family"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        if (data.taxonomy["genus"].isNotEmpty)
          Row(
            children: [
              SimpleRichText(
                "Genus: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SimpleRichText(
                data.taxonomy["genus"],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
            ],
          ),
        if (data.taxonomy["kingdom"].isNotEmpty) const SizedBox(height: 14),
        if (data.description.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Description and Natural Habitats",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        FormattedText(firestoreString: data.description),
        if (data.description.isNotEmpty) const SizedBox(height: 14),
        if (data.species.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Species",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        FormattedText(firestoreString: data.species),
        if (data.species.isNotEmpty) const SizedBox(height: 14),
        if (data.clinical.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Pathogenicity and Clinical Significance",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        FormattedText(firestoreString: data.clinical),
        if (data.clinical.isNotEmpty) const SizedBox(height: 14),
        if (data.features.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Micro/Macroscopic, and Histologic features",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        FormattedText(firestoreString: data.features),
        if (data.features.isNotEmpty) const SizedBox(height: 14),
        if (data.precautions.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Laboratory Precautions",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        FormattedText(firestoreString: data.precautions),
        if (data.precautions.isNotEmpty) const SizedBox(height: 14),
        if (data.susceptibility.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Susceptibility Patterns",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        FormattedText(firestoreString: data.susceptibility),
        if (data.references.isNotEmpty) const SizedBox(height: 14),
        if (data.references.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "References",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        for (var ref in data.references)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              ref,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ),
      ],
    );
  }
}

/* Column(
      children: [
        if (data.mycology.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Mycology",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.mycology.isNotEmpty)
          FormattedText(firestoreString: data.mycology),
        if (data.mycology.isNotEmpty) const SizedBox(height: 14),
        if (data.epidemiology.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Epidemiology",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.epidemiology.isNotEmpty)
          FormattedText(firestoreString: data.epidemiology),
        if (data.epidemiology.isNotEmpty) const SizedBox(height: 14),
        if (data.pathogenesis.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Pathogenesis",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.pathogenesis.isNotEmpty)
          FormattedText(firestoreString: data.pathogenesis),
        if (data.pathogenesis.isNotEmpty) const SizedBox(height: 14),
        if (data.clinical.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Clinical Manifestations",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.clinical.isNotEmpty)
          FormattedText(firestoreString: data.clinical),
        if (data.clinical.isNotEmpty) const SizedBox(height: 14),
        if (data.diagnosis.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Diagnosis",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.diagnosis.isNotEmpty)
          FormattedText(firestoreString: data.diagnosis),
        if (data.diagnosis.isNotEmpty) const SizedBox(height: 14),
        if (data.treatment.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Treatment",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        if (data.treatment.isNotEmpty)
          FormattedText(firestoreString: data.treatment)
      ],
    ); */
