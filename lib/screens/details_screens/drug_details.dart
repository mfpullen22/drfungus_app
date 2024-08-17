import "package:flutter/material.dart";
import "package:simple_rich_text/simple_rich_text.dart";

class DrugDetailsScreen extends StatelessWidget {
  const DrugDetailsScreen({required this.data, super.key});

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
  }
}
