// ignore_for_file: use_build_context_synchronously

import 'package:cv/screens/profile_screens/dispaly_info/dispaly_skills_widget.dart';
import 'package:cv/screens/profile_screens/dispaly_info/dispaly_userinfo.dart';
import 'package:cv/screens/profile_screens/dispaly_info/display_educations_widget.dart';
import 'package:cv/screens/profile_screens/dispaly_info/display_projects_wiget.dart';
import 'package:cv/screens/profile_screens/dispaly_info/display_social_widget.dart';
import 'package:cv/screens/profile_screens/settings_screen.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    const DisplayUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
            child: const Icon(Icons.settings)),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hight14(),
                const DisplayUserInfo(),
                const DisplayAllSkills(),
                hight14(),
                const DisplayAllSocials(),
                hight14(),
                const DisplayAllProject(),
                hight14(),
                const DisplayAllEducation(),
                hight14(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
