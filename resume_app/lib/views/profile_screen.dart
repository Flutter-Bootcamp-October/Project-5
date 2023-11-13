import 'package:flutter/material.dart';
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
import 'package:resume_app/widgets/user_display.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
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
