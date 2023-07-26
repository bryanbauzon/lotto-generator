import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/AppCommon.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppCommon().appThemeColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lotto Generator'),
    );
  }
}
