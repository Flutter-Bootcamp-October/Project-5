import 'package:cv/screens/communty_screen.dart';
import 'package:cv/screens/home_screen.dart';
import 'package:cv/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  var _currentIndex = 0;
  List screensList = [
    const HomeScreen(),
    const TabsScreen(),
    const communityScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Profile"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.add_circle_outline_sharp),
            title: const Text("Add"),
            selectedColor: Colors.pink,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.people_alt_outlined),
            title: const Text("community"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
