import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/community_screen.dart';
import 'package:cv_app/screens/home_screen.dart';
import 'package:cv_app/screens/my_cv.dart';
import 'package:cv_app/screens/profile_screen.dart';
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
        onPressed: () {},
        backgroundColor: mainColor,
        elevation: 0,
        child: const Icon(
          Icons.add_circle_outline_sharp,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
