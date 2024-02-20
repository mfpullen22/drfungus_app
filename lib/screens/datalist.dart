import 'package:drfungus_app/screens/item_details.dart';
import "package:flutter/material.dart";

class DataListScreen extends StatelessWidget {
  const DataListScreen({this.title, required this.data, super.key});

  final String? title;
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
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
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
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