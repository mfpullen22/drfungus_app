import "package:cloud_firestore/cloud_firestore.dart";
import "package:drfungus_app/models/bug.dart";
import "package:drfungus_app/models/drug.dart";
import "package:drfungus_app/models/mycoses.dart";
import "package:drfungus_app/models/trial.dart";

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

Future<List<Drug>> getDrugs() async {
  final data = await FirebaseFirestore.instance.collection("drugs").get();
  final List<Drug> drugList = [];

  for (var doc in data.docs) {
    final newDrug = Drug(
      name: doc["name"],
      mechanism: doc["mechanism"],
      susceptibility: doc["susceptibility"],
      dosage: doc["dosage"],
      adverse: doc["adverse"],
      status: doc["status"],
    );
    drugList.add(newDrug);
  }

  return drugList.toList();
}

Future<List<Mycoses>> getMycoses() async {
  final data = await FirebaseFirestore.instance.collection("mycoses").get();
  final List<Mycoses> mycosesList = [];

  for (var doc in data.docs) {
    final newMycoses = Mycoses(
      name: doc["name"],
      mycology: doc["mycology"],
      epidemiology: doc["epidemiology"],
      pathogenesis: doc["pathogenesis"],
      clinical: doc["clinical"],
      diagnosis: doc["diagnosis"],
      treatment: doc["treatment"],
    );
    mycosesList.add(newMycoses);
  }

  return mycosesList.toList();
}

Future<List<Trial>> getTrials() async {
  final data = await FirebaseFirestore.instance.collection("trials").get();
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

  return trialsList.toList();
}
