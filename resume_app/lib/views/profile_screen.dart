import 'dart:math';

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
  late String userToken;
  @override
  void initState() {
    userToken = getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      FutureBuilder(
          future: _loadInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const UserDisplay();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error while getting data"));
            }
            return const Center(child: CircularProgressIndicator());
          })
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }

  _loadInfo() async {
    try {
      userAbout = await AboutServ().getAbout(token: userToken);
      print("-----------------About Set Successful-----------------");
      userProjects = await ProjectServ().getProjects(token: userToken);
      print("-----------------project Set Successful-----------------");
      userEducation = await EducationServ().getEducation(token: userToken);
      print("-----------------education Set Successful-----------------");
      userSkills = await SkillServ().getSkills(token: userToken);
      print("-----------------skills Set Successful-----------------");
      userSocials = await SocialServ().getSocials(token: userToken);
      print("-----------------social Set Successful---------------------");
      return "loaded";
    } on FormatException catch (error) {
      if (error.message.toString().contains("token") ||
          error.message.toString().contains("Token")) {
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

class UserDisplay extends StatefulWidget {
  const UserDisplay({
    super.key,
  });

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: FittedBox(
            child: Row(children: [
              Text(
                "Rafal Abu Eshey",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: returnShadows()),
              ),
              const SizedBox(width: 15),
              Container(
                color: Colors.white,
                width: 170,
                height: 180,
              ),
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
    );
  }
}
