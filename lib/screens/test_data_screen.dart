import "package:flutter/material.dart";
import 'package:simple_rich_text/simple_rich_text.dart';

class TestDataScreen extends StatelessWidget {
  const TestDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Data"),
      ),
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: SimpleRichText(
              "This is a *test* of \nthe /SimpleRichText/ widget.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
