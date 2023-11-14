import 'package:flutter/material.dart';
import 'package:project_5/screens/auth/login_screen.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool hasToken = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
