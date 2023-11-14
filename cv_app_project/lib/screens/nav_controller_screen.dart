import 'package:cv_app_project/components/nav_controller/floating_option.dart';
import 'package:cv_app_project/screens/edit_about_screen.dart';
import 'package:cv_app_project/screens/edit_education_screen.dart';
import 'package:cv_app_project/screens/edit_project_screen.dart';
import 'package:cv_app_project/screens/edit_skill_screen.dart';
import 'package:cv_app_project/screens/edit_social_media.dart';
import 'package:cv_app_project/screens/home_screen.dart';
import 'package:cv_app_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class NavController extends StatefulWidget {
  NavController({super.key});

  @override
  State<NavController> createState() => _NavControllerState();
}

class _NavControllerState extends State<NavController> {
  List screen = [
    Home(),
    ProfileScreen(),
  ];

  int index = 0;

  Color homeIconColor = Color(0xffD35400);

  Color orderIconColor = Color.fromARGB(128, 0, 0, 0);

  Color profileIconColor = Color.fromARGB(128, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0C356A),
        child: Icon(
          Icons.edit_note_outlined,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            context: context,
            builder: (context) {
              return Container(
                color: Color(0xff0174BE),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          FloatinOptions(
                            text: 'About',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditAboutScreen(),
                                  ));
                            },
                          ),
                          SizedBox(height: 24),
                          FloatinOptions(
                            text: 'Education',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditEducationScreen(),
                                  ));
                            },
                          ),
                          SizedBox(height: 24),
                          FloatinOptions(
                            text: 'Projects',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProjectScreen(),
                                  ));
                            },
                          ),
                          SizedBox(height: 24),
                          FloatinOptions(
                            text: 'Skills',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditSkillScreen(),
                                  ));
                            },
                          ),
                          SizedBox(height: 24),
                          FloatinOptions(
                            text: 'Social Media',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditSocialMediaScreen(),
                                  ));
                            },
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
          setState(() {});
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          elevation: 0,
          backgroundColor: Color(0xff0C356A),
          selectedItemColor: Color(0xffFFF0CE),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (value) {
            index = value;
            setState(() {});
          },
        ),
      ),
      body: screen[index],
    );
  }
}
