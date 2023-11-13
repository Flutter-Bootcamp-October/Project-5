import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/screens/navigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LodingScreen extends StatefulWidget {
  const LodingScreen({super.key});

  @override
  State<LodingScreen> createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {
  @override
  Widget build(BuildContext context) {
    String token = "";
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          token = (snapshot.data as SharedPreferences).getString("token") ?? "";
          print(token);
          return token.isNotEmpty
              ? const NavigationBarScreen()
              : const SigninScreen();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
