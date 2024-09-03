// ignore_for_file: prefer_final_fields

import 'package:drfungus_app/services/vectara_service.dart';
import 'package:flutter/material.dart';
import "package:drfungus_app/env.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [];
  TextEditingController _controller = TextEditingController();
  final VectaraService vectaraService = VectaraService(
    apiKey: Env.vectaraApiKey,
    corpusKey: "AskDrFungus",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Dr. Fungus'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                bool isUserMessage = message['type'] == 'user';
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Colors.blue[100]
                          : message['type'] == 'loading'
                              ? Colors.grey[300]
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: message['type'] == 'loading'
                        ? const CircularProgressIndicator()
                        : Column(
                            crossAxisAlignment: isUserMessage
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                message['text']!,
                                style: TextStyle(
                                  color: isUserMessage
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                isUserMessage ? 'You' : 'Vectara',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ask Vectara...',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    String question = _controller.text;

    if (question.isNotEmpty) {
      // Add user message to the chat
      setState(() {
        messages.add({'text': question, 'type': 'user'});
        // Add a placeholder for the Vectara response
        messages.add({'text': '', 'type': 'loading'});
        _controller.clear();
      });

      try {
        // Call the Vectara API and get the response
        String? response = await vectaraService.queryVectara(question);

        // Update the placeholder with the Vectara response
        setState(() {
          messages.removeLast(); // Remove the loading indicator
          messages
              .add({'text': response ?? "No answer found", 'type': 'vectara'});
        });
      } catch (e) {
        // Handle error and show a generic message
        //print('Error occurred: $e');
        setState(() {
          messages.removeLast(); // Remove the loading indicator
          messages.add({
            'text': 'An error occurred. Please try again.',
            'type': 'vectara'
          });
        });
      }
    }
  }
}
