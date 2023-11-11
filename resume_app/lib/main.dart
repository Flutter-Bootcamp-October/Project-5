import 'package:flutter/material.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/views/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
String? token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final StatelessWidget screen;
    if (token != null) {
      print("Yay token saved");
      screen = const SignInScreen();
    } else {
      screen = const SignUpSreen();
    }
    return MaterialApp(debugShowCheckedModeBanner: false, home: screen);
  }
}
