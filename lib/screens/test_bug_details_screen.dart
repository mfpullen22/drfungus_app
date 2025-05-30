import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';

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

  Widget markdownSection(BuildContext context, String markdownText) {
    final baseTextStyle = GoogleFonts.lato(
      fontSize: 16,
      height: 1.5,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: MarkdownBody(
        data: markdownText,
        shrinkWrap: true,
        styleSheet: MarkdownStyleSheet(
          p: baseTextStyle,
          h1: baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          h2: baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          h3: baseTextStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          strong: baseTextStyle.copyWith(fontWeight: FontWeight.bold),
          em: baseTextStyle.copyWith(fontStyle: FontStyle.italic),
          blockquotePadding: const EdgeInsets.only(left: 20),
          blockquoteDecoration: const BoxDecoration(
            border: Border(left: BorderSide(color: Colors.grey, width: 4)),
          ),
          listIndent: 20,
          blockSpacing: 14,
          textAlign: WrapAlignment.start,
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
                markdownSection(context, data.description),
              if (data.species.isNotEmpty) sectionHeader(context, "Species"),
              if (data.species.isNotEmpty)
                markdownSection(context, data.species),
              if (data.clinical.isNotEmpty)
                sectionHeader(
                    context, "Pathogenicity and Clinical Significance"),
              if (data.clinical.isNotEmpty)
                markdownSection(context, data.clinical),
              if (data.features.isNotEmpty)
                sectionHeader(
                    context, "Micro/Macroscopic, and Histologic features"),
              if (data.features.isNotEmpty)
                markdownSection(context, data.features),
              if (data.precautions.isNotEmpty)
                sectionHeader(context, "Laboratory Precautions"),
              if (data.precautions.isNotEmpty)
                markdownSection(context, data.precautions),
              if (data.susceptibility.isNotEmpty)
                sectionHeader(context, "Susceptibility Patterns"),
              if (data.susceptibility.isNotEmpty)
                markdownSection(context, data.susceptibility),
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
