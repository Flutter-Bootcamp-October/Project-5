import 'package:flutter/material.dart';
import 'package:pcv/screens/loading_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
      )),
      home: const LoadingPage(),
    );
  }
}
