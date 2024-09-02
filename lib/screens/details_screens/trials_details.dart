import 'package:drfungus_app/widgets/formattedtext.dart';
import "package:flutter/material.dart";
import "package:simple_rich_text/simple_rich_text.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class TrialDetailsScreen extends StatelessWidget {
  const TrialDetailsScreen({required this.data, super.key});

  final dynamic data;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
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
        FormattedText(firestoreString: data.name),
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
        FormattedText(
            firestoreString: "${data.organization} - ${data.principal}"),
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
        FormattedText(firestoreString: data.description),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: SimpleRichText(
            "Study Website and\\/or Contact E-mail",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        if (data.url.isNotEmpty)
          SizedBox(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: "Study Website: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
                children: [
                  TextSpan(
                    text: data.url,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.blue[
                            900], // Optional: make the text look like a link
                        decoration: TextDecoration.underline,
                        fontSize: 16 // Optional: underline the text
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL(data.url);
                      },
                  ),
                ],
              ),
            ),
          ),
        if (data.email.isNotEmpty)
          SizedBox(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: "Contact E-mail: ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
                children: [
                  TextSpan(
                    text: data.email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue[
                              900], // Optional: make the text look like a link
                          decoration: TextDecoration.underline,
                          fontSize: 16, // Optional: underline the text
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchEmail(data.email);
                      },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/*
Column(
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
        if (data.url.isNotEmpty)
          SizedBox(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: "Study Website: ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: data.url,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue[
                              900], // Optional: make the text look like a link
                          decoration: TextDecoration
                              .underline, // Optional: underline the text
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL(data.url);
                      },
                  ),
                ],
              ),
            ),
          ),
        if (data.email.isNotEmpty)
          SizedBox(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: "Contact E-mail: ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: data.email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue[
                              900], // Optional: make the text look like a link
                          decoration: TextDecoration
                              .underline, // Optional: underline the text
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchEmail(data.email);
                      },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
    */

    