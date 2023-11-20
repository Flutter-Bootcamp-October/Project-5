import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/community_screen.dart';
import 'package:cv_app/screens/education_screen.dart';
import 'package:cv_app/screens/home_screen.dart';
import 'package:cv_app/screens/my_cv.dart';
import 'package:cv_app/screens/profile_screen.dart';
import 'package:cv_app/screens/project_screen.dart';
import 'package:cv_app/screens/skills_screen.dart';
import 'package:cv_app/screens/social_screen.dart';
import 'package:cv_app/widgets/add_to_cv.dart';
import 'package:cv_app/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    const HomeScreen(),
    const MyCVScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 60,
        elevation: 0,
        color: mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              selectedIcon: Icons.home_filled,
              unselectedIcon: Icons.home_outlined,
              isSelected: selectedIndex == 0,
            ),
            NavBarItem(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              selectedIcon: Icons.drag_indicator_outlined,
              unselectedIcon: Icons.drag_indicator,
              isSelected: selectedIndex == 1,
            ),
            const SizedBox(width: 24),
            NavBarItem(
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              selectedIcon: Icons.people,
              unselectedIcon: Icons.people_alt_outlined,
              isSelected: selectedIndex == 2,
            ),
            NavBarItem(
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              selectedIcon: Icons.person,
              unselectedIcon: Icons.person_outline,
              isSelected: selectedIndex == 3,
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 175,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddToCV(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProjectScreen(),
                            ),
                          ).then((value) => Navigator.pop(context));
                        },
                        icon: Icons.work,
                        text: "Project",
                        color: const Color(0xff9bc5f9),
                      ),
                      AddToCV(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SkillScreen(),
                            ),
                          ).then((value) => Navigator.pop(context));
                        },
                        icon: Icons.precision_manufacturing,
                        text: "Skills",
                        color: const Color(0xfff4bf8d),
                      ),
                      AddToCV(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SocialScreen(),
                            ),
                          ).then((value) => Navigator.pop(context));
                        },
                        icon: Icons.connect_without_contact,
                        text: "Social",
                        color: const Color(0xffb0d6a7),
                      ),
                      AddToCV(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EducationScreen(),
                            ),
                          ).then((value) => Navigator.pop(context));
                        },
                        icon: Icons.school,
                        text: "Education",
                        color: const Color(0xfff38ea8),
                      ),
                    ],
                  ),
                );
              });
        },
        backgroundColor: mainColor,
        elevation: 0,
        child: const Icon(
          Icons.space_dashboard_outlined,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
