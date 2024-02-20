//import "package:drfungus_app/screens/bugs.dart";
import "package:drfungus_app/screens/datalist.dart";
//import "package:drfungus_app/screens/drugs.dart";
import "package:drfungus_app/screens/home_page.dart";
import "package:flutter/material.dart";
import "package:drfungus_app/data/data.dart";

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
    } else if (_selectedPageIndex == 2) {
      activePage = const DataListScreen(
        data: drugs,
      );
      activePageTitle = "Medications";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.biotech), label: "Fungi"),
          BottomNavigationBarItem(icon: Icon(Icons.medication), label: "Drugs"),
        ],
      ),
    );
  }
}
