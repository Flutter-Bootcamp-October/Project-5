import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/views/about_screen.dart';
import 'package:resume_app/views/skills_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationScreen> {
  int selected = 0;
  Color selectedColor = appBlue;
  Color unselectedColor = const Color(0xff999999);
  List<Widget> list = [
    const AboutScreen(),
    const SkillScreen(),
    const SkillScreen(),
    const SkillScreen(),
    const SkillScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[selected],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: unselectedColor,
          selectedItemColor: selectedColor,
          selectedIconTheme: IconThemeData(color: selectedColor),
          currentIndex: selected,
          onTap: (index) {
            selected = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                label: "You", icon: Icon(size: 30, Icons.person)),
            BottomNavigationBarItem(
                label: "Education", icon: Icon(size: 30, Icons.school)),
            BottomNavigationBarItem(
                label: "Skills", icon: Icon(size: 30, Icons.list_alt)),
            BottomNavigationBarItem(
                label: "Projects",
                icon: Icon(size: 30, Icons.work_outline_outlined)),
            BottomNavigationBarItem(
                label: "Contacts",
                icon: Icon(size: 30, Icons.web_stories_outlined)),
          ]),
    );
  }
}
