import 'package:flutter/material.dart';
import 'package:project_5/color/palette.dart';
import 'package:project_5/model/Token.dart';
import 'package:project_5/screens/home_page.dart';
import 'package:project_5/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String userToken = await Token().getUserToken();
  runApp(MyApp(userToken: userToken));
}

class MyApp extends StatelessWidget {
  final String userToken;

  const MyApp({Key? key, required this.userToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Palette.backgroundColor,
      ),
      home: userToken.isEmpty ? LoginScreen() : ProfilePage(),
    );
  }
}
