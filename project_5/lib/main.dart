import 'package:flutter/material.dart';
import 'package:project_5/color/palette.dart';
import 'package:project_5/screens/home_page.dart';
import 'package:project_5/screens/login_screen.dart';
import 'package:project_5/screens/registration_screen%20.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Palette.backgroundColor,
      ),
      home: ProfilePage(),
    );
  }
}
