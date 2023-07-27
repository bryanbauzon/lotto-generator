import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/AppCommon.dart';
import 'package:flutter_application_1/common/strings.dart';

import 'lottoGenerator.dart';
import 'records.dart';

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
    RecordsPage(),
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
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(Strings().dev)));
              },
              icon: Icon(Icons.info, color: AppCommon().white))
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
              label: Strings().home),
          BottomNavigationBarItem(
              icon: Icon(
                (_selectedIndex == 1) ? Icons.list_alt : Icons.list_alt_sharp,
                color: AppCommon().appThemeColor,
              ),
              label: Strings().records),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppCommon().appThemeColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
