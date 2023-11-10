import 'package:cv/global/global_data.dart';
import 'package:cv/screens/home_screen.dart';
import 'package:cv/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lodingScreen extends StatefulWidget {
  const lodingScreen({super.key});

  @override
  State<lodingScreen> createState() => _lodingScreenState();
}

class _lodingScreenState extends State<lodingScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          token = (snapshot.data as SharedPreferences).getString("token") ?? "";
          print(token);
          return token.isNotEmpty ? const HomeScreen() : const SigninScreen();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
