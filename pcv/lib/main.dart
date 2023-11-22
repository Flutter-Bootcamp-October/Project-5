import 'package:flutter/material.dart';
import 'package:pcv/screens/loading_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

 SharedPreferences? prefs;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs=await SharedPreferences.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      home:  const LoadingPage(),
    );
  }
}
