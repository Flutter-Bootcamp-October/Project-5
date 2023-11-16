import 'package:cv/main.dart';
import 'package:cv/screens/home_screen.dart';
import 'package:cv/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (prefs!.getString('token')!.isNotEmpty) {
        print(prefs!.getString('token'));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => LogIn()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
