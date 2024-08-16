import 'package:drfungus_app/models/bug.dart';
import 'package:drfungus_app/providers/firebase_provider.dart';
import 'package:drfungus_app/screens/item_details.dart';
import "package:flutter/material.dart";

class DataListScreen extends StatelessWidget {
  const DataListScreen({this.title, required this.data, super.key});

  final String? title;
  final List<dynamic> data;

  void testGetBugs() async {
    final testData = await getBugs();
    print(testData);

    // To print the first item:
    if (testData.isNotEmpty) {
      print(testData[0].name);
    } else {
      print("No bugs found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    testGetBugs();
    print(getBugs());
    Widget content = ListView.builder(
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
    );

    if (data.isEmpty) {
      content = Center(
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
    }

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


/* void _selectDetailsType(BuildContext context, dynamic data) {
    if (data is Drug) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => DrugDetailsScreen(
            name: data.name,
            data: data,
          ),
        ),
      );
    } else if (data is Trial) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => TrialDetailsScreen(
            name: data.name,
            data: data,
          ),
        ),
      );
    } else if (data is Bug) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => BugDetailsScreen(
            name: data.name,
            data: data,
          ),
        ),
      );
    }
  } */