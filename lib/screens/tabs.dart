//import "package:drfungus_app/screens/bugs.dart";
import "package:drfungus_app/screens/datalist.dart";
//import "package:drfungus_app/screens/drugs.dart";
import "package:drfungus_app/screens/home_page.dart";
import "package:drfungus_app/screens/test_data_screen.dart";
import "package:flutter/material.dart";
import "package:drfungus_app/data/data.dart";
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomePage();
    var activePageTitle = "Doctor Fungus";

    if (_selectedPageIndex == 1) {
      activePage = const DataListScreen(
        data: bugs,
      );
      activePageTitle = "Fungi";
    } else if (_selectedPageIndex == 3) {
      activePage = const DataListScreen(
        data: drugs,
      );
      activePageTitle = "Medications";
    } else if (_selectedPageIndex == 2) {
      activePage = const TestDataScreen();
      activePageTitle = "Medications";
    } else if (_selectedPageIndex == 4) {
      activePage = const DataListScreen(
        data: bugs,
      );
      activePageTitle = "Mycoses";
    }

    return Scaffold(
      appBar: activePageTitle == "Doctor Fungus"
          ? null
          : AppBar(
              title: Text(activePageTitle),
            ),
      body: activePage,
      bottomNavigationBar: ConvexAppBar(
        height: 50,
        backgroundColor: Colors.black,
        activeColor: Colors.blue,
        curveSize: 100,
        top: -15,
        //type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        style: TabStyle.fixed,
        initialActiveIndex: 2,
        //currentIndex: _selectedPageIndex,
        items: const [
          TabItem(icon: Icon(Icons.home), title: "Home"),
          TabItem(icon: Icon(Icons.biotech), title: "Fungi"),
          TabItem(icon: Icon(Icons.search), title: "Search"),
          TabItem(icon: Icon(Icons.medication), title: "Medications"),
          TabItem(icon: Icon(Icons.medication), title: "Mycoses"),
        ],
      ),
    );
  }
}
