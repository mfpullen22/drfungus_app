import "package:drfungus_app/screens/datalist.dart";
import "package:flutter/material.dart";

class ActiveTrialsListTile extends StatelessWidget {
  const ActiveTrialsListTile({required this.data, super.key});

  final dynamic data;

  void trialTile(BuildContext context) async {
    // Fetch the active trials for the doc IDs in the data.trials array
    List<String> trialDocIds = List<String>.from(data.trials);
    // Navigate to the DataListScreen with the active trials
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataListScreen(
          title: "Active Trials",
          docIds: trialDocIds, // Passing the docIds to DataListScreen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700), // Gold-like color
          borderRadius: BorderRadius.circular(8), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          title: const Text(
            "There are active trials related to this topic!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Making the title bold
            ),
          ),
          subtitle: const Text(
            "Tap to learn more.",
            style: TextStyle(color: Colors.black),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios, // Icon suggesting navigation
            color: Colors.black,
          ),
          onTap: () => trialTile(context), // Call trialTile on tap
        ),
      ),
    );
  }
}
