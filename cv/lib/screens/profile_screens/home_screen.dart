// ignore_for_file: use_build_context_synchronously

import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/screens/profile_screens/dispaly_skills_widget.dart';
import 'package:cv/screens/profile_screens/dispaly_userinfo.dart';
import 'package:cv/screens/profile_screens/display_educations_widget.dart';
import 'package:cv/screens/profile_screens/display_projects_wiget.dart';
import 'package:cv/screens/profile_screens/display_social_widget.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DisplayUserInfo(),
                const DisplayAllSkills(),
                hight14(),
                const DisplayAllSocials(),
                hight14(),
                const DisplayAllProject(),
                hight14(),
                const DisplayAllEducation(),
                hight14(),
                IconButton(
                    onPressed: () async {
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
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
