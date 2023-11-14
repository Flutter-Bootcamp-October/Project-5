import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/views/test.dart';
import 'package:resume_app/widgets/user_display.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationScreen> {
  int selected = 0;
  Color selectedColor = appBlue;
  Color unselectedColor = const Color(0xff999999);
  List<Widget> list = [const UserDisplay(), const MyWidget()];
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
                label: "You", icon: Icon(size: 30, Icons.crop_square_sharp)),
            BottomNavigationBarItem(
                label: "More", icon: Icon(size: 30, Icons.list_alt)),
          ]),
    );
  }
}
