import 'package:flutter/material.dart';
import 'package:project_5/screens/auth/register_screen.dart';
import 'package:project_5/screens/auth/signin_screen.dart';
import 'package:project_5/screens/home/home_screen.dart';

// bool hasToken = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninScreen(),
    );
  }
}
