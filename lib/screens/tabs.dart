// ignore_for_file: unused_local_variable

import "package:drfungus_app/screens/search.dart";
import "package:flutter/material.dart";
import "package:drfungus_app/screens/datalist.dart";
import "package:drfungus_app/screens/home_page.dart";
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
      setState(() {
        activePageTitle = "Fungi";
      });
      activePage = const DataListScreen(
        title: "Fungi",
      );
    } else if (_selectedPageIndex == 2) {
      setState(() {
        activePageTitle = "Search";
      });
      activePage = const SearchScreen();
    } else if (_selectedPageIndex == 3) {
      setState(() {
        activePageTitle = "Medications";
      });
      activePage = const DataListScreen(
        title: "Medications",
      );
    } else if (_selectedPageIndex == 4) {
      setState(() {
        activePageTitle = "Mycoses";
      });
      activePage = const DataListScreen(
        title: "Mycoses",
      );
    }

    return Scaffold(
      body: SafeArea(child: activePage),
      bottomNavigationBar: ConvexAppBar(
        height: 66,
        backgroundColor: Colors.black,
        activeColor: Colors.blue,
        curveSize: 60,
        top: -10,
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
