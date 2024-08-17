import "package:flutter/material.dart";
import "package:simple_rich_text/simple_rich_text.dart";
import 'package:url_launcher/url_launcher.dart';

class TrialDetailsScreen extends StatelessWidget {
  const TrialDetailsScreen({required this.data, super.key});

  final dynamic data;

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        if (data.url != null)
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                _launchURL(data.url);
              },
              child: Text(
                "Website: " + data.url,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blue[
                          900], // Optional: make the text look like a link
                      decoration: TextDecoration
                          .underline, // Optional: underline the text
                    ),
              ),
            ),
          ),
        if (data.email != null)
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                _launchURL(data.url);
              },
              child: Text(
                "Email: " + data.email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blue[
                          900], // Optional: make the text look like a link
                      decoration: TextDecoration
                          .underline, // Optional: underline the text
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
