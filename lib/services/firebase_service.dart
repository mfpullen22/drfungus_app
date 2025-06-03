import "package:cloud_firestore/cloud_firestore.dart";
import "package:drfungus_app/models/bug.dart";
import "package:drfungus_app/models/drug.dart";
import "package:drfungus_app/models/mycoses.dart";
import "package:drfungus_app/models/trial.dart";
import 'package:azlistview/azlistview.dart';

Future<List<Bug>> getBugs() async {
  final data = await FirebaseFirestore.instance
      .collection("bugs")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Bug> bugList = [];

  for (var doc in data.docs) {
    final newBug = Bug(
      name: doc["name"],
      name_lower: doc["name_lower"],
      keywords: doc["keywords"],
      description: doc["description"],
      species: doc["species"],
      clinical: doc["clinical"],
      features: doc["features"],
      precautions: doc["precautions"],
      susceptibility: doc["susceptibility"],
      references: doc["references"],
      trials: doc["trials"],
    );
    bugList.add(newBug);
  }

  // Add suspension tag and sort
  for (var bug in bugList) {
    bug.tag = bug.name.isNotEmpty ? bug.name[0].toUpperCase() : "#";
  }

  SuspensionUtil.sortListBySuspensionTag(bugList);
  SuspensionUtil.setShowSuspensionStatus(bugList);

  return bugList;
}

Future<List<Drug>> getDrugs() async {
  final data = await FirebaseFirestore.instance
      .collection("drugs")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Drug> drugList = [];

  for (var doc in data.docs) {
    final newDrug = Drug(
      name: doc["name"],
      name_lower: doc["name_lower"],
      keywords: doc["keywords"],
      mechanism: doc["mechanism"],
      susceptibility: doc["susceptibility"],
      dosage: doc["dosage"],
      adverse: doc["adverse"],
      status: doc["status"],
      references: doc["references"],
      trials: doc["trials"],
    );
    drugList.add(newDrug);
  }

  for (var drug in drugList) {
    drug.tag = drug.name.isNotEmpty ? drug.name[0].toUpperCase() : "#";
  }

  SuspensionUtil.sortListBySuspensionTag(drugList);
  SuspensionUtil.setShowSuspensionStatus(drugList);

  return drugList;
}

Future<List<Mycoses>> getMycoses() async {
  final data = await FirebaseFirestore.instance
      .collection("mycoses")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Mycoses> mycosesList = [];

  for (var doc in data.docs) {
    final newMycoses = Mycoses(
      name: doc["name"],
      name_lower: doc["name_lower"],
      keywords: doc["keywords"],
      mycology: doc["mycology"],
      epidemiology: doc["epidemiology"],
      pathogenesis: doc["pathogenesis"],
      clinical: doc["clinical"],
      diagnosis: doc["diagnosis"],
      treatment: doc["treatment"],
      references: doc["references"],
      trials: doc["trials"],
    );
    mycosesList.add(newMycoses);
  }

  for (var item in mycosesList) {
    item.tag = item.name.isNotEmpty ? item.name[0].toUpperCase() : "#";
  }

  SuspensionUtil.sortListBySuspensionTag(mycosesList);
  SuspensionUtil.setShowSuspensionStatus(mycosesList);

  return mycosesList;
}

Future<List<Trial>> getTrials() async {
  final data = await FirebaseFirestore.instance
      .collection("trials")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Trial> trialsList = [];

  for (var doc in data.docs) {
    final newTrial = Trial(
      name: doc["name"],
      organization: doc["organization"],
      principal: doc["principal"],
      description: doc["description"],
      url: doc["url"],
      email: doc["email"],
    );
    trialsList.add(newTrial);
  }

  for (var trial in trialsList) {
    trial.tag = trial.name.isNotEmpty ? trial.name[0].toUpperCase() : "#";
  }

  SuspensionUtil.sortListBySuspensionTag(trialsList);
  SuspensionUtil.setShowSuspensionStatus(trialsList);

  return trialsList;
}

Future<List<Trial>> getActiveTrials(List<String> docIds) async {
  final List<Trial> trialsList = [];

  for (var docId in docIds) {
    final doc = await FirebaseFirestore.instance
        .collection("trials")
        .doc(docId)
        .get(const GetOptions(source: Source.serverAndCache));
    if (doc.exists) {
      final newTrial = Trial(
        name: doc["name"],
        organization: doc["organization"],
        principal: doc["principal"],
        description: doc["description"],
        url: doc["url"],
        email: doc["email"],
      );
      trialsList.add(newTrial);
    }
  }

  trialsList.sort((a, b) => a.name.compareTo(b.name));

  return trialsList;
}

/* Future<List<Bug>> getBugs() async {
  final data = await FirebaseFirestore.instance
      .collection("bugs")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Bug> bugList = [];

  for (var doc in data.docs) {
    final newBug = Bug(
      name: doc["name"],
      name_lower: doc["name_lower"],
      keywords: doc["keywords"],
      description: doc["description"],
      species: doc["species"],
      clinical: doc["clinical"],
      features: doc["features"],
      precautions: doc["precautions"],
      susceptibility: doc["susceptibility"],
      references: doc["references"],
      trials: doc["trials"],
    );
    bugList.add(newBug);
  }
  bugList.sort((a, b) => a.name.compareTo(b.name));

  return bugList.toList();
}

Future<List<Drug>> getDrugs() async {
  final data = await FirebaseFirestore.instance
      .collection("drugs")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Drug> drugList = [];

  for (var doc in data.docs) {
    final newDrug = Drug(
      name: doc["name"],
      name_lower: doc["name_lower"],
      keywords: doc["keywords"],
      mechanism: doc["mechanism"],
      susceptibility: doc["susceptibility"],
      dosage: doc["dosage"],
      adverse: doc["adverse"],
      status: doc["status"],
      references: doc["references"],
      trials: doc["trials"],
    );
    drugList.add(newDrug);
  }

  drugList.sort((a, b) => a.name.compareTo(b.name));

  return drugList.toList();
}

Future<List<Mycoses>> getMycoses() async {
  final data = await FirebaseFirestore.instance
      .collection("mycoses")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Mycoses> mycosesList = [];

  for (var doc in data.docs) {
    final newMycoses = Mycoses(
      name: doc["name"],
      name_lower: doc["name_lower"],
      keywords: doc["keywords"],
      mycology: doc["mycology"],
      epidemiology: doc["epidemiology"],
      pathogenesis: doc["pathogenesis"],
      clinical: doc["clinical"],
      diagnosis: doc["diagnosis"],
      treatment: doc["treatment"],
      references: doc["references"],
      trials: doc["trials"],
    );
    mycosesList.add(newMycoses);
  }

  mycosesList.sort((a, b) => a.name.compareTo(b.name));

  return mycosesList.toList();
} 

Future<List<Trial>> getTrials() async {
  final data = await FirebaseFirestore.instance
      .collection("trials")
      .get(const GetOptions(source: Source.serverAndCache));
  final List<Trial> trialsList = [];

  for (var doc in data.docs) {
    final newTrial = Trial(
      name: doc["name"],
      organization: doc["organization"],
      principal: doc["principal"],
      description: doc["description"],
      url: doc["url"],
      email: doc["email"],
    );
    trialsList.add(newTrial);
  }

  trialsList.sort((a, b) => a.name.compareTo(b.name));

  return trialsList.toList();
}

*/
