// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pcv/views/home/home_screen.dart';
import 'package:pcv/services/api_about.dart';

import '../main.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  initState() {
    super.initState();
    netAbout.aboutMethod(context: context);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (prefs!.getString('token') != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false,
          );
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
