import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:cv/screens/add_screens/education_screen.dart';
import 'package:cv/screens/add_screens/project_screen.dart';
import 'package:cv/screens/add_screens/skill_screen.dart';
import 'package:cv/screens/add_screens/social_screen.dart';
import 'package:cv/style/colors.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: CustomSlidingSegmentedControl<int>(
              initialValue: 1,
              padding: 25,
              children: const {
                1: Text(
                  'Project',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                2: Text(
                  'Education',
                  style: TextStyle(color: Colors.white),
                ),
                3: Text(
                  'Skill',
                  style: TextStyle(color: Colors.white),
                ),
                4: Text(
                  'Social',
                  style: TextStyle(color: Colors.white),
                ),
              },
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              thumbDecoration: BoxDecoration(
                color: const Color(0xffFCB85F),
                borderRadius: BorderRadius.circular(6),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onValueChanged: (v) {
                _tabController.animateTo(v - 1);
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProjectsScreen(),
                EducationsScreen(),
                SkillsScreen(),
                SocilaScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
