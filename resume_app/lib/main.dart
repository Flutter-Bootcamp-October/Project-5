import 'package:flutter/material.dart';
import 'package:resume_app/views/profile_screen.dart';
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
    if (token != null) {
      print("Yay token saved");
      return const MaterialApp(
          debugShowCheckedModeBanner: false, home: ProfileScreen());
    } else {
      return const MaterialApp(
          debugShowCheckedModeBanner: false, home: SignInScreen());
    }
  }
}
