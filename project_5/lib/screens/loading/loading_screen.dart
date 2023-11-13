import 'package:flutter/material.dart';
import 'package:project_5/main.dart';
import 'package:project_5/screens/auth/login_screen.dart';
import 'package:project_5/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return hasToken ? const HomeScreen() : const LoginScreen();
  }
}
