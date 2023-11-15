import 'package:flutter/material.dart';
import 'package:resume_app/views/loading_screen.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
late String? token;
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
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Oswald',
        ),
        debugShowCheckedModeBanner: false,
        home: token != null ? const LoadingScreen() : const SignInScreen());
  }
}
