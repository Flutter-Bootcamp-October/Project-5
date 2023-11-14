// ignore_for_file: use_build_context_synchronously

import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/services/user/delete_user.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      appBar: AppBar(
        backgroundColor: lightBlue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.remove("token");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: pink),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                      width10(),
                      const Text("logout",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            hight16(),
            InkWell(
              onTap: () {},
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: pink),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                      width10(),
                      const Text("Reset Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            hight16(),
            InkWell(
              onTap: () {
                deleteUser(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: pink),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                      width10(),
                      const Text("Delete account",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
