import 'package:cv_app_project/screens/nav_controller_screen.dart';
import 'package:cv_app_project/services/education_api.dart';
import 'package:flutter/material.dart';

void main() {
  getEducation();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFF0CE),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffFFF0CE),
          elevation: 0,
        ),
      ),
      home: NavController(),
    );
  }
}
