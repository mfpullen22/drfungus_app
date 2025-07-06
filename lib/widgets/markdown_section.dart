import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownSection extends StatelessWidget {
  const MarkdownSection(this.text, {super.key});

  //final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = GoogleFonts.lato(
      fontSize: 16,
      height: 1.5,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: MarkdownBody(
        data: text,
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
        onTapLink: (text, href, title) async {
          if (href != null && await canLaunchUrl(Uri.parse(href))) {
            await launchUrl(Uri.parse(href),
                mode: LaunchMode.externalApplication);
          } else {
            debugPrint('Could not launch $href');
          }
        },
      ),
    );
  }
}
