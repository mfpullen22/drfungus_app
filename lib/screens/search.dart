// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:drfungus_app/models/bug.dart';
import 'package:drfungus_app/models/drug.dart';
import 'package:drfungus_app/models/mycoses.dart';
import 'package:drfungus_app/screens/item_details_hub.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<DocumentSnapshot> searchResults = [];

  void search(String input) async {
    if (input.isEmpty) {
      setState(() {
        query = '';
        searchResults = [];
      });
      return;
    }

    String lowerCaseInput = input.toLowerCase();

    // Perform search in the "bugs" collection
    QuerySnapshot bugsSnapshot = await FirebaseFirestore.instance
        .collection('bugs')
        .where('name_lower', isGreaterThanOrEqualTo: lowerCaseInput)
        .where('name_lower', isLessThanOrEqualTo: lowerCaseInput + '\uf8ff')
        .get();

    // Perform search in the "drugs" collection
    QuerySnapshot drugsSnapshot = await FirebaseFirestore.instance
        .collection('drugs')
        .where('name_lower', isGreaterThanOrEqualTo: lowerCaseInput)
        .where('name_lower', isLessThanOrEqualTo: lowerCaseInput + '\uf8ff')
        .get();

    // Perform search in the "mycoses" collection
    QuerySnapshot mycosesSnapshot = await FirebaseFirestore.instance
        .collection('mycoses')
        .where('name_lower', isGreaterThanOrEqualTo: lowerCaseInput)
        .where('name_lower', isLessThanOrEqualTo: lowerCaseInput + '\uf8ff')
        .get();

    // Combine the results from all collections
    List<DocumentSnapshot> allResults = [];
    allResults.addAll(bugsSnapshot.docs);
    allResults.addAll(drugsSnapshot.docs);
    allResults.addAll(mycosesSnapshot.docs);

    setState(() {
      query = input;
      searchResults = allResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search Dr. Fungus'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              onChanged: (value) => search(value),
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                var document = searchResults[index];
                var data = document.data() as Map<String, dynamic>;

                dynamic modelData;
                if (document.reference.parent.id == 'bugs') {
                  modelData = Bug.fromMap(data);
                } else if (document.reference.parent.id == 'drugs') {
                  modelData = Drug.fromMap(data);
                } else if (document.reference.parent.id == 'mycoses') {
                  modelData = Mycoses.fromMap(data);
                }

                return ListTile(
                  title: Text(
                    data['name'] ?? '',
                    style: const TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ItemDetailsScreen(
                          name: data["name"],
                          data: modelData,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
