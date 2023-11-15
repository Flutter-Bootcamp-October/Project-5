import 'package:flutter/material.dart';
import 'package:flutter_project5_api/screens/login_screen.dart';
import 'package:flutter_project5_api/screens/navbar_screen.dart';
import 'package:flutter_project5_api/screens/registration_screen.dart';
import 'package:flutter_project5_api/screens/welcome_screen.dart';
import 'package:flutter_project5_api/servers_api/auth/login_api.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen (),
    );
  }
}
