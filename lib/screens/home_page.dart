import "package:drfungus_app/screens/bugs.dart";
import "package:drfungus_app/screens/drugs.dart";
import "package:drfungus_app/screens/trials.dart";
import "package:drfungus_app/widgets/menubutton.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(17, 75, 95, 100),
                Color.fromRGBO(2, 128, 144, 100),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.9),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Fungi",
                  onSelectMenu: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BugsScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Drugs",
                  onSelectMenu: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DrugsScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Clinical Trials",
                  onSelectMenu: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrialsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
