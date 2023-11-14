import 'package:flutter/material.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/auth/register_screen.dart';

bool hasToken = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hasToken = await shared();
  runApp(const MainApp());
}

Future<bool> shared() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  bool token = pref.containsKey("token");
  return token;
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
