import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/AppCommon.dart';

import 'lottoGenerator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    LottoGenerator(),
    Text('Settings'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Developer: Max Bryan C. Bauzon')));
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                (_selectedIndex == 0) ? Icons.home : Icons.home_filled,
                color: AppCommon().appThemeColor,
              ),
              label: (_selectedIndex == 0) ? 'Home' : ''),
          BottomNavigationBarItem(
              icon: Icon(
                (_selectedIndex == 1)
                    ? Icons.settings
                    : Icons.settings_outlined,
                color: AppCommon().appThemeColor,
              ),
              label: (_selectedIndex == 1) ? 'Settings' : ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppCommon().appThemeColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
