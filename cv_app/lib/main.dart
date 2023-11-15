import 'package:cv_app/screens/get_started.dart';
import 'package:cv_app/screens/about_screen.dart';
import 'package:cv_app/screens/login_screen.dart';
import 'package:cv_app/screens/onboarding.dart';
import 'package:cv_app/screens/progress_screen.dart';
import 'package:cv_app/screens/project_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: OnBoarding()));
  }
}
