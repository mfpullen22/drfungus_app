import "package:drfungus_app/models/bug.dart";
import "package:drfungus_app/models/drug.dart";
import "package:drfungus_app/models/mycoses.dart";
import "package:drfungus_app/models/trial.dart";
import "package:flutter/material.dart";
import 'package:simple_rich_text/simple_rich_text.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({required this.name, required this.data, super.key});

  final String name;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (data is Drug) {
      //FIX DRUG WIDGET!
      content = Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Text(
              "Generic and Trade Names",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SimpleRichText(data.name,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Mechanism(s) of Action",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SimpleRichText(
            data.mechanism,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
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
          SimpleRichText(
            data.susceptibility,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Route and Dosage",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SimpleRichText(
            data.dosage,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Adverse Effects",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SimpleRichText(
            data.adverse,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Current Status",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SimpleRichText(
            data.status,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      );
    } else if (data is Bug) {
      content = Column(
        children: [
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
          const SizedBox(height: 8),
          Row(
            children: [
              SimpleRichText(
                "Kingdom: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SimpleRichText(
                data.taxonomy["kingdom"],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              SimpleRichText(
                "Phylum: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SimpleRichText(
                data.taxonomy["phylum"],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              SimpleRichText(
                "Subphylum: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SimpleRichText(
                data.taxonomy["subphylum"],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              SimpleRichText(
                "Order: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SimpleRichText(
                data.taxonomy["order"],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              SimpleRichText(
                "Family: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SimpleRichText(
                data.taxonomy["family"],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              SimpleRichText(
                "Genus: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SimpleRichText(
                data.taxonomy["genus"],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.species,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.clinical,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.features,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.precautions,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.susceptibility,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      );
    } else if (data is Mycoses) {
      content = Column(
        children: [
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.mycology,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.epidemiology,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.pathogenesis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.clinical,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.diagnosis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
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
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              data.treatment,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      );
    } else if (data is Trial) {
      content = Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Clinical Trial Title",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SimpleRichText(
            data.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Organization and Principal Investigator",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SimpleRichText(
              "${data.organization} - ${data.principal}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Study Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SimpleRichText(
            data.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: SimpleRichText(
              "Study Website and/or Contact E-mail",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SimpleRichText(
              data.url,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      );
    } else {
      content = const Center(
        child: Text("Invalid data type"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: content,
          ),
        ),
      ),
    );
  }
}
