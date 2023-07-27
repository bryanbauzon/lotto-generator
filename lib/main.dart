import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/AppCommon.dart';
import 'package:flutter_application_1/common/strings.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings().appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppCommon().appThemeColor),
        useMaterial3: true,
      ),
      home: MyHomePage(title: Strings().appName),
    );
  }
}
