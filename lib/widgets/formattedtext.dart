// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

class FormattedText extends StatelessWidget {
  const FormattedText({required this.firestoreString, super.key});
  final String firestoreString;

  @override
  Widget build(BuildContext context) {
// Replace escaped newline characters with actual newline characters
    final normalizedString = firestoreString.replaceAll(r'\\n', '\n');

    // Split the string into parts by newline character
    final parts = normalizedString.split('\n');

    // List to hold the formatted text widgets
    List<Widget> spans = [];
    bool isInIndentBlock = false;
    StringBuffer buffer = StringBuffer();

    for (var part in parts) {
      part = part.trim();

      if (part.contains('[INDENT]{') && !isInIndentBlock) {
        // Start of an indented block
        isInIndentBlock = true;
        buffer.write(part.replaceFirst('[INDENT]{', '').trim());
      } else if (part.contains('}') && isInIndentBlock) {
        // End of an indented block
        isInIndentBlock = false;
        buffer.write('\n' + part.replaceFirst('}', '').trim());
        spans.add(
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SimpleRichText(
              buffer.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        );
        buffer.clear();
      } else if (isInIndentBlock) {
        // Inside an indented block
        buffer.write('\n' + part.trim());
      } else {
        // Regular text
        spans.add(
          SimpleRichText(
            part.trim(),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        );
      }
    }

    // Handle any remaining text in the buffer after the loop
    if (buffer.isNotEmpty) {
      spans.add(
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SimpleRichText(
            buffer.toString(),
            style:
                const TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: spans,
    );
  }
}
