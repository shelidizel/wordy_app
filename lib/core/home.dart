import 'package:flutter/material.dart';
import 'package:wordy_app/core/wordy_theme.dart';
import 'package:wordy_app/models/user.dart';
import 'package:wordy_app/presentation/screens/design_screen.dart';
import 'package:wordy_app/presentation/screens/dictionary_screen.dart';
import 'package:wordy_app/presentation/screens/info_screen.dart';
import 'package:wordy_app/presentation/screens/response_screen.dart';

class Home extends StatefulWidget {

   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> pages = [
    InfoScreen(),
    DesignScreen(),
    ResponseScreen(),
    DictionaryScreen(),
  ];
  final List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.info), label:'Info', ),
    const BottomNavigationBarItem(icon: Icon(Icons.design_services), label:'Design' ),
    const BottomNavigationBarItem(icon: Icon(Icons.task), label:'Response', ),
    const BottomNavigationBarItem(icon: Icon(Icons.book), label:'Dictionary', )
  ];

    var selectedTab = 0;

  void handleIndexChanged(int i) {
    setState(() {
      selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        onTap: handleIndexChanged,
        items: navItems,
        currentIndex: selectedTab,
      ),
    );
  }
}