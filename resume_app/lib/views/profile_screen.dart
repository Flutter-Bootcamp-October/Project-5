import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/about_services.dart';
import 'package:resume_app/services/education_services.dart';
import 'package:resume_app/services/project_services.dart';
import 'package:resume_app/services/skill_services.dart';
import 'package:resume_app/services/social_services.dart';
import 'package:resume_app/views/Navigation_bar.dart';
import 'package:resume_app/views/signin_screen.dart';

bool isLoading = true;

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
    return FutureBuilder(
        future: _loadInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavigationScreen();
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error while getting data"));
          }
          return const Scaffold(
              backgroundColor: appBlue,
              body: Center(child: CircularProgressIndicator()));
        });
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
