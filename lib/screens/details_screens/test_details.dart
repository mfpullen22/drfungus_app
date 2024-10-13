import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayRichTextScreen extends StatefulWidget {
  final String documentId; // The Firestore document ID to fetch

  const DisplayRichTextScreen({super.key, required this.documentId});

  @override
  State<DisplayRichTextScreen> createState() => _DisplayRichTextScreenState();
}

class _DisplayRichTextScreenState extends State<DisplayRichTextScreen> {
  QuillController? _controller;
  bool _isLoading = true;
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchDocument();
  }

  Future<void> _fetchDocument() async {
    try {
      // Fetch the document from Firestore
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('test')
          .doc(widget.documentId)
          .get();

      if (doc.exists && doc.data() != null) {
        var jsonContent = doc['content'];
        var document = Document.fromJson(jsonContent);

        // Initialize the QuillController with the fetched document
        setState(() {
          _controller = QuillController(
            document: document,
            readOnly: true,
            selection: TextSelection.collapsed(offset: 0),
          );
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Document not found!')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load document: $e')),
      );
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Display Rich Text',
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: _controller != null
                  ? QuillEditor.basic(
                      configurations: const QuillEditorConfigurations(
                        scrollable: true, // Allow scrolling
                        padding:
                            EdgeInsets.all(10), // Add padding around the editor
                        autoFocus: false, // Don't auto-focus
                        expands:
                            false, // Allow manual resizing based on content
                        showCursor: false,
                      ),
                      controller: _controller!,
                      scrollController: _scrollController,
                      focusNode: _focusNode,
                    )
                  : const Center(child: Text('No content available')),
            ),
    );
  }
}
