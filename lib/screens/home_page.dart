import "package:drfungus_app/screens/datalist.dart";
import "package:drfungus_app/widgets/menubutton.dart";
import "package:flutter/material.dart";
import "package:drfungus_app/data/data.dart";

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
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Makes the buttons square
                                  ),
                                ),
                                child: const Center(
                                  child: Text("Button 1"),
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
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Makes the buttons square
                                  ),
                                ),
                                child: const Center(
                                  child: Text("Button 2"),
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Makes the buttons square
                                  ),
                                ),
                                child: const Center(
                                  child: Text("Button 3"),
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
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Makes the buttons square
                                  ),
                                ),
                                child: const Center(
                                  child: Text("Button 4"),
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Makes the buttons square
                                  ),
                                ),
                                child: const Center(
                                  child: Text("Button 5"),
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
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Makes the buttons square
                                  ),
                                ),
                                child: const Center(
                                  child: Text("Button 6"),
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


                          
