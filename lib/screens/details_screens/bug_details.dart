import "package:flutter/material.dart";
import "package:simple_rich_text/simple_rich_text.dart";

class BugDetailsScreen extends StatelessWidget {
  const BugDetailsScreen({required this.data, super.key});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
