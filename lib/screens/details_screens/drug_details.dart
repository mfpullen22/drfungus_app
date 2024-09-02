import "package:drfungus_app/screens/datalist.dart";
import "package:drfungus_app/widgets/activetrials.dart";
import "package:drfungus_app/widgets/formattedtext.dart";
import "package:flutter/material.dart";
import "package:simple_rich_text/simple_rich_text.dart";

class DrugDetailsScreen extends StatelessWidget {
  const DrugDetailsScreen({required this.data, super.key});

  final dynamic data;

  void trialTile(BuildContext context) async {
    // Fetch the active trials for the doc IDs in the data.trials array
    List<String> trialDocIds = List<String>.from(data.trials);
    // Navigate to the DataListScreen with the active trials
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataListScreen(
          title: "Active Trials",
          docIds: trialDocIds, // Passing the docIds to DataListScreen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.trials[0] != "") ActiveTrialsListTile(data: data),
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
        FormattedText(firestoreString: data.name),
        const SizedBox(height: 14),
        if (data.mechanism.isNotEmpty)
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
        FormattedText(firestoreString: data.mechanism),
        if (data.mechanism.isNotEmpty) const SizedBox(height: 14),
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
        if (data.susceptibility.isNotEmpty) const SizedBox(height: 14),
        if (data.dosage.isNotEmpty)
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
        FormattedText(firestoreString: data.dosage),
        if (data.dosage.isNotEmpty) const SizedBox(height: 14),
        if (data.adverse.isNotEmpty)
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
        FormattedText(firestoreString: data.adverse),
        if (data.adverse.isNotEmpty) const SizedBox(height: 14),
        if (data.status.isNotEmpty)
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
        FormattedText(firestoreString: data.status),
        if (data.references.length > 1) const SizedBox(height: 14),
        if (data.references.length > 1)
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



    /*
Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Directionality(
          textDirection: TextDirection.ltr,
          child: SimpleRichText(data.name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(height: 14),
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
        const SizedBox(height: 14),
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
        const SizedBox(height: 14),
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
        const SizedBox(height: 14),
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
        const SizedBox(height: 14),
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
    */

