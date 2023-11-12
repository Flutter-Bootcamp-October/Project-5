import 'package:cv/screens/community_screen.dart';
import 'package:cv/screens/education_screen.dart';
import 'package:cv/screens/home_screen.dart';
import 'package:cv/screens/login_screen.dart';
import 'package:cv/screens/regestratio_screen%20.dart';
import 'package:cv/screens/verification_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
