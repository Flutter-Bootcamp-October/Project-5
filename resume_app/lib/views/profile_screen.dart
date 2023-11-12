import 'package:flutter/material.dart';
import 'package:resume_app/consts/buttons.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/about_services.dart';
import 'package:resume_app/services/education_services.dart';
import 'package:resume_app/services/project_services.dart';
import 'package:resume_app/services/skill_services.dart';
import 'package:resume_app/services/social_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 200,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: FittedBox(
              child: Row(children: [
                Container(
                  color: Colors.white,
                  width: 170,
                  height: 180,
                ),
                const SizedBox(width: 15),
                Text(
                  "Rafal Abu Eshey",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: returnShadows()),
                )
              ]),
            ),
            bottom: tabBar,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: appBlue,
            onPressed: () {},
            child: const Icon(Icons.picture_as_pdf_sharp),
          ),
          backgroundColor: Colors.transparent,
          body: const TabBarView(
            children: [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
            ],
          ),
        ),
      ),
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }

  _loadInfo() async {
    try {
      userAbout = await AboutServ().getAbout(token: getToken());
      userProjects = await ProjectServ().getProjects(token: getToken());
      userEducation = await EducationServ().getEducation(token: getToken());
      userSkills = await SkillServ().getSkills(token: getToken());
      userSocials = await SocialServ().getSocials(token: getToken());
    } on FormatException catch (error) {
      if (error.message.toString().contains("token")) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            ModalRoute.withName("/screen"));
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }
}
