import "package:flutter/material.dart";
import "package:flutter_quill/flutter_quill.dart";

class TestDataEntryScreen extends StatefulWidget {
  const TestDataEntryScreen({super.key});

  @override
  State<TestDataEntryScreen> createState() => _TestDataEntryScreenState();
}

class _TestDataEntryScreenState extends State<TestDataEntryScreen> {
  QuillController _controller = QuillController.basic();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.readOnly = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Rich Text Editor')),
      body: Column(
        children: [
          QuillToolbar.simple(controller: _controller),
          Expanded(
            child: QuillEditor(
              controller: _controller,
              scrollController: _scrollController,
              focusNode: _focusNode,
              configurations: const QuillEditorConfigurations(
                scrollable: true,
                padding: EdgeInsets.all(10),
                autoFocus: true,
                expands: true,
              ),
              // Expands to fill available space
            ),
          ),
        ],
      ),
    );
  }
}
