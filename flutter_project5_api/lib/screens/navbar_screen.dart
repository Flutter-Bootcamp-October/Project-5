import 'package:flutter/material.dart';
import 'package:flutter_project5_api/screens/about_screen.dart';
import 'package:flutter_project5_api/screens/education_screen.dart';
//import 'package:flutter_project5_api/screens/login_screen.dart';
import 'package:flutter_project5_api/screens/project_screen.dart';
//import 'package:flutter_project5_api/screens/registration_screen.dart';
import 'package:flutter_project5_api/screens/skills_screen.dart';
import 'package:flutter_project5_api/screens/socialmedial_screen.dart';
//import 'package:flutter_project5_api/screens/summery.dart';
import 'package:flutter_project5_api/screens/users_screen.dart';
//import 'package:flutter_project5_api/screens/welcome_screen.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  List screensList = [
    AboutScreen(),
    ProjectScreen(),
    EducationScreen(),
    SkillScreen(),
    SocialMediaScreen(),
    UsersScreen(),
    //CVScreen(),
  ];

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[selected],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: selected,
          onTap: (value) {
            setState(() {
              selected = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Personal"),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: "Work"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cast_for_education), label: "Educstion"),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_document), label: "Skills"),
            BottomNavigationBarItem(
                icon: Icon(Icons.social_distance), label: "social"),
            BottomNavigationBarItem(
                icon: Icon(Icons.summarize), label: "Summary"),
          ]),
    );
  }
}
