import "package:drfungus_app/screens/datalist.dart";
//import "package:drfungus_app/widgets/menubutton.dart";
import "package:flutter/material.dart";
import "package:drfungus_app/data/data.dart";
import 'package:url_launcher/url_launcher.dart';

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: const Color.fromRGBO(21, 40, 77, 1),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo_bgless.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DataListScreen(
                                          title: "Fungi",
                                          data: bugs,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 237, 240),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Makes the buttons square
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.hub,
                                            color:
                                                Color.fromRGBO(21, 40, 77, 1),
                                            size: 48),
                                        Text("Fungi",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    21, 40, 77, 1))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DataListScreen(
                                          title: "Medications",
                                          data: drugs,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 237, 240),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Makes the buttons square
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.medication,
                                            color:
                                                Color.fromRGBO(21, 40, 77, 1),
                                            size: 48),
                                        Text("Medications",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    21, 40, 77, 1))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DataListScreen(
                                          title: "Mycoses",
                                          data: mycoses,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 237, 240),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Makes the buttons square
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.medical_information,
                                            color:
                                                Color.fromRGBO(21, 40, 77, 1),
                                            size: 48),
                                        Text("Mycoses",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    21, 40, 77, 1))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 237, 240),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Makes the buttons square
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.question_answer,
                                            color:
                                                Color.fromRGBO(21, 40, 77, 1),
                                            size: 48),
                                        Text("Ask Dr. Fungus",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    21, 40, 77, 1))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DataListScreen(
                                          title: "Clinical Trials",
                                          data: trials,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 237, 240),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Makes the buttons square
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.biotech,
                                            color:
                                                Color.fromRGBO(21, 40, 77, 1),
                                            size: 48),
                                        Text("Research",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    21, 40, 77, 1))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _launchURL('https://msgerc.org/');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 237, 240),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Makes the buttons square
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.person_add,
                                            color:
                                                Color.fromRGBO(21, 40, 77, 1),
                                            size: 48),
                                        Text("Join MSG",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    21, 40, 77, 1))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* 
Container(
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
                        builder: (context) => const DataListScreen(
                          title: "Fungi",
                          data: bugs,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Syndromes",
                  onSelectMenu: () {},
                ),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Drugs",
                  onSelectMenu: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DataListScreen(
                          title: "Medications",
                          data: drugs,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Guidelines",
                  onSelectMenu: () {},
                ),
                const SizedBox(height: 20),
                MenuButton(
                  title: "Clinical Trials",
                  onSelectMenu: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DataListScreen(
                          title: "Clinical Trials",
                          data: trials,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ), */


                          
