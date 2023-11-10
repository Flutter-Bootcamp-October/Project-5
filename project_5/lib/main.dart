import 'package:flutter/material.dart';

import 'screens/first_screen.dart';

void main() {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}
