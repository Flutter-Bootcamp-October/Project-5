import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cv_app/screens/about_screen.dart';
import 'package:cv_app/screens/all_user_screen.dart';
import 'package:cv_app/screens/cv_screen.dart';
import 'package:cv_app/screens/education_screen.dart';
import 'package:cv_app/screens/project_screen.dart';
import 'package:cv_app/screens/skils_screen.dart';
import 'package:cv_app/screens/social_screen.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabProgress extends StatefulWidget {
  TabProgress({Key? key}) : super(key: key);

  @override
  _TabProgressState createState() => _TabProgressState();
}

class _TabProgressState extends State<TabProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text("Cv Maker"),
        ),
        actions: [],
        backgroundColor: purble,
        leading: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("token");
            },
            child: Icon(Icons.exit_to_app)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: DefaultTabController(
            length: 7,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  buttonMargin: EdgeInsets.all(1),
                  labelSpacing: 6,
                  backgroundColor: orang,
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      icon: Icon(Icons.person_add_alt_1),
                      text: "About",
                    ),
                    Tab(
                      icon: Icon(Icons.cast_for_education),
                      text: "Education",
                    ),
                    Tab(
                      icon: Icon(Icons.workspace_premium),
                      text: "Project",
                    ),
                    Tab(
                      icon: Icon(Icons.local_activity_rounded),
                      text: "Skills",
                    ),
                    Tab(
                      icon: Icon(Icons.contact_emergency),
                      text: "Social media",
                    ),
                    Tab(
                      icon: Icon(Icons.contact_page),
                      text: "Cv Page",
                    ),
                    Tab(
                      icon: Icon(Icons.person_pin_circle_outlined),
                      text: "Community",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      AboutScreen(),
                      EducationScreen(),
                      ProjectScreen(),
                      SkillsScreen(),
                      SocialScreen(),
                      CvScreen(),
                      AllUsersScreen()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
