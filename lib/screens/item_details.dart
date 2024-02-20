import "package:drfungus_app/models/bug.dart";
import "package:drfungus_app/models/drug.dart";
import "package:drfungus_app/models/trial.dart";
import "package:flutter/material.dart";

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({required this.name, required this.data, super.key});

  final String name;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (data is Drug) {
      content = Column(
        children: [
          Text(
            data.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            data.mechanism,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.susceptibility,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.dosage,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.adverse,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.status,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      );
    } else if (data is Bug) {
      content = Column(
        children: [
          Text(
            data.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
/*           Text(
            data.taxonomy,
            style: Theme.of(context).textTheme.bodyLarge,
          ), */
          Text(
            data.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.species,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.clinical,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.features,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.precautions,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.susceptibility,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      );
    } else if (data is Trial) {
      content = Column(
        children: [
          Text(
            data.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            data.organization,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            data.url,
            style: Theme.of(context).textTheme.bodyLarge,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: content,
        ),
      ),
    );
  }
}
