import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/home_tab_bar/education_tab_bar/education_card.dart';
import 'package:cv_app/widgets/home_tab_bar/project_tab_bar/gridview_project.dart';
import 'package:cv_app/widgets/home_tab_bar/skill_tab_bar/gridview_skill.dart';
import 'package:cv_app/widgets/home_tab_bar/social_media_tab_bar/gridview_social_media.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: eggShell,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'lib/assets/images/image.jpg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    width20,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'name',
                          style: TextStyle(
                            color: prussianBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height12,
                        Text(
                          'age  .  title_position  .  location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: payneGrey,
                          ),
                        ),
                        height12,
                        Text(
                          'phone 0555112233',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: silverBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height20,
                const Text(
                  'about me',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: prussianBlue,
                  ),
                ),
                const Text(
                  'about mehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: payneGrey,
                  ),
                ),
                height20,
                const TabBar(
                  isScrollable: true,
                  indicatorColor: richBlack,
                  unselectedLabelStyle: TextStyle(color: payneGrey),
                  labelColor: prussianBlue,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  tabs: [
                    Tab(text: 'Education'),
                    Tab(text: 'Skills'),
                    Tab(text: 'Projects'),
                    Tab(text: 'Social Media'),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      EducationCard(),
                      GridViewSkills(),
                      ProjectGridView(),
                      GridViewSocialMedia()
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
