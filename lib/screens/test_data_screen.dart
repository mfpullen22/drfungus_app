import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfungus_app/models/bug.dart';
import 'test_bug_details_screen.dart';

class TestDataScreen extends StatelessWidget {
  const TestDataScreen({super.key});

  Future<List<Bug>> fetchBugData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('bugs')
        .get(const GetOptions(source: Source.serverAndCache));

    return snapshot.docs.map((doc) => Bug.fromMap(doc.data())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Markdown Display")),
      body: FutureBuilder<List<Bug>>(
        future: fetchBugData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('ERROR: ${snapshot.error}');
            return const Center(child: Text("Error loading bugs"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No bugs found"));
          }

          final bugs = snapshot.data!;
          return ListView.builder(
            itemCount: bugs.length,
            itemBuilder: (context, index) {
              final bug = bugs[index];
              return ListTile(
                title: Text(bug.name),
                tileColor: Theme.of(context).colorScheme.secondaryContainer,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TestBugDetailsScreen(
                      name: bug.name,
                      data: bug, // Pass the full Bug object
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}





/* import 'package:drfungus_app/services/firebase_service.dart';
import 'package:drfungus_app/screens/item_details_hub.dart';
import "package:flutter/material.dart";

class TestDataScreen extends StatelessWidget {
  const TestDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Data Screen"),
      ),
      body: FutureBuilder(
        future: getBugs(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            // Handle error
            return const Center(child: Text('An error occurred!'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  tileColor: Theme.of(context).colorScheme.secondaryContainer,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ItemDetailsScreen(
                          name: snapshot.data![index].name,
                          data: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
 */