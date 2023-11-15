import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/screens/add_information_screen.dart';
import 'package:cv_app/screens/all_user_screen.dart';
import 'package:cv_app/screens/home_screen.dart';
import 'package:cv_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class CVNavigationBar extends StatefulWidget {
  const CVNavigationBar({
    super.key,
  });

  @override
  State<CVNavigationBar> createState() => _CVNavigationBarState();
}

class _CVNavigationBarState extends State<CVNavigationBar> {
  var _selectedTab = _SelectedTab.home;
  int index = 0;
  List screen = [
    const HomeScreen(),
    const AddInformation(),
    UserListScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screen[index],
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: Colors.grey.withOpacity(0.4),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: Colors.grey,
          onTap: (int i) {
            setState(() {
              index = i;
              _selectedTab = _SelectedTab.values[i];
            });
          },
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: richBlack,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.add_box_outlined),
              selectedColor: richBlack,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.supervised_user_circle_outlined),
              selectedColor: richBlack,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.person_2_outlined),
              selectedColor: richBlack,
            ),
          ],
        ));
  }
}

enum _SelectedTab { home, addInformation, users, profail }
