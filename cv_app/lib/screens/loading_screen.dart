import 'package:cv_app/models/globals.dart';
import 'package:cv_app/screens/authorization_screens/log_in_screen.dart';
import 'package:cv_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool token = sharedPreferences() as bool;
    return  token ? const HomeScreen() : LogInScreen();
  }
}
