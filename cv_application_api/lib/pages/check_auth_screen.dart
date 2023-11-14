// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/pages/login_screen.dart';
import 'package:cv_application_api/pages/navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuthScreen extends StatefulWidget {
  const CheckAuthScreen({super.key});

  @override
  State<CheckAuthScreen> createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  @override
  void initState() {
    _check();
    super.initState();
  }

  _check() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   // print(prefs.getString("token"));
    if (prefs.containsKey("token")) {
      final String token = prefs.getString("token")!;
      if (token.isNotEmpty) {
        showDialog(
          context: context,
          barrierColor: appcoldGreenTrans,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: app2DarkGreen,
            ),
          ),
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavBarScreen()),
            (route) => false);
      }
    } else {
      showDialog(
        context: context,
        barrierColor: appcoldGreenTrans,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: app2DarkGreen,
          ),
        ),
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator(
                color: app2DarkGreen,
              ),
            ),
          )),
    );
  }
}
