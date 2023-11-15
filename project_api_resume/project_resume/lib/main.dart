import 'package:flutter/material.dart';
import 'package:project_resume/screens/auth/check_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckScreen(),
    );
  }
}
