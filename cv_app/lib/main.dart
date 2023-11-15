import 'package:cv_app/models/globals.dart';
import 'package:cv_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await check();
  // await DataLoader.loadData();
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) { 
    return const MaterialApp(
      home: LoadingScreen(),debugShowCheckedModeBanner: false,  
    );
  }
}
