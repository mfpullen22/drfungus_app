import 'package:drfungus_app/widgets/markdown_section.dart';
import 'package:flutter/material.dart';

class TestBugDetailsScreen extends StatelessWidget {
  const TestBugDetailsScreen({
    required this.name,
    required this.data,
    super.key,
  });

  final String name;
  final dynamic data;

  Widget sectionHeader(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.description.isNotEmpty)
                sectionHeader(context, "Description and Natural Habitats"),
              if (data.description.isNotEmpty)
                MarkdownSection(data.description),
              if (data.species.isNotEmpty) sectionHeader(context, "Species"),
              if (data.species.isNotEmpty) MarkdownSection(data.species),
              if (data.clinical.isNotEmpty)
                sectionHeader(
                    context, "Pathogenicity and Clinical Significance"),
              if (data.clinical.isNotEmpty) MarkdownSection(data.clinical),
              if (data.features.isNotEmpty)
                sectionHeader(
                    context, "Micro/Macroscopic, and Histologic features"),
              if (data.features.isNotEmpty) MarkdownSection(data.features),
              if (data.precautions.isNotEmpty)
                sectionHeader(context, "Laboratory Precautions"),
              if (data.precautions.isNotEmpty)
                MarkdownSection(data.precautions),
              if (data.susceptibility.isNotEmpty)
                sectionHeader(context, "Susceptibility Patterns"),
              if (data.susceptibility.isNotEmpty)
                MarkdownSection(data.susceptibility),
              if (data.references.length > 0 && data.references[0] != "")
                sectionHeader(context, "References"),
              if (data.references.length > 0 && data.references[0] != "")
                ...data.references.map((ref) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        ref,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
