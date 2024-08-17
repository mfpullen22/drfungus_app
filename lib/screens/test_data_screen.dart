import 'package:drfungus_app/providers/firebase_provider.dart';
import 'package:drfungus_app/screens/item_details_hub.dart';
import "package:flutter/material.dart";

class TestDataScreen extends StatelessWidget {
  const TestDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
