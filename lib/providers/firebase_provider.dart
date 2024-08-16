import "package:cloud_firestore/cloud_firestore.dart";
import "package:drfungus_app/models/bug.dart";
import "package:flutter/material.dart";

Future<List<Bug>> getBugs() async {
  final data = await FirebaseFirestore.instance.collection("bugs").get();
  final List<Bug> bugList = [];

  for (var doc in data.docs) {
    final newBug = Bug(
        name: doc["name"],
        taxonomy: doc["taxonomy"],
        description: doc["description"],
        species: doc["species"],
        clinical: doc["clinical"],
        features: doc["features"],
        precautions: doc["precautions"],
        susceptibility: doc["susceptibility"]);
    bugList.add(newBug);
  }

  return bugList.toList();
}
