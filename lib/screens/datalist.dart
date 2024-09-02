//import 'package:drfungus_app/models/bug.dart';
import 'package:drfungus_app/providers/firebase_provider.dart';
import 'package:drfungus_app/screens/item_details_hub.dart';
import "package:flutter/material.dart";

class DataListScreen extends StatelessWidget {
  const DataListScreen({this.title, this.docIds, super.key});

  final String? title;
  final List<String>? docIds;

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>>? data;

    if (title == "Fungi") {
      data = getBugs();
    } else if (title == "Medications") {
      data = getDrugs();
    } else if (title == "Mycoses") {
      data = getMycoses();
    } else if (title == "Trials") {
      data = getTrials();
    } else if (title == "Active Trials") {
      data = getActiveTrials(docIds!);
    }

    Widget content = FutureBuilder(
      future: data,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          // Handle error
          return const Center(child: Text('An error occurred!'));
        } else if (snapshot.hasData && snapshot.data!.isEmpty) {
          // Check if the data is empty
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No data available",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  ListTile(
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
                  ),
                  const SizedBox(height: 2),
                ],
              );
            },
          );
        }
      },
    );

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}



/*  ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            tileColor: Theme.of(context).colorScheme.secondaryContainer,
            title: Text(data[index].name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ItemDetailsScreen(
                    name: data[index].name,
                    data: data[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    ); */


