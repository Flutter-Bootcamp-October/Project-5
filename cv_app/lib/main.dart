import 'package:cv_app/models/globals.dart';
import 'package:cv_app/screens/authorization_screens/sign_up_screen.dart';
import 'package:cv_app/screens/home_screen.dart';
import 'package:cv_app/screens/navigation_bar.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hasToken = await sharedPreferences();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CVNavigationBar(),
    );
  }
}
