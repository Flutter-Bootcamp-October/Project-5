import 'package:cv_app/models/education/education_data_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/projects/project_data_model.dart';
import 'package:cv_app/models/projects/project_model.dart';
import 'package:cv_app/models/skill/skill_data_model.dart';
import 'package:cv_app/models/skill/skill_model.dart';
import 'package:cv_app/models/social_media/social_media_data_model.dart';
import 'package:cv_app/models/social_media/social_media_model.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:cv_app/widgets/home_tab_bar/social_media_tab_bar/gridview_social_media.dart';
import 'package:flutter/material.dart';
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/education/education_model.dart';
import 'package:cv_app/widgets/home_tab_bar/education_tab_bar/education_card.dart';
import 'package:cv_app/widgets/home_tab_bar/project_tab_bar/gridview_project.dart';
import 'package:cv_app/widgets/home_tab_bar/skill_tab_bar/gridview_skill.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: richBlack,
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
                            color: eggShell,
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
                    color: eggShell,
                  ),
                ),
                const Text(
                  'about mehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: silverBlue,
                  ),
                ),
                height20,
                const TabBar(
                  isScrollable: true,
                  indicatorColor: eggShell,
                  unselectedLabelStyle: TextStyle(color: payneGrey),
                  labelColor: eggShell,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  tabs: [
                    Tab(text: 'Education'),
                    Tab(text: 'Skills'),
                    Tab(text: 'Projects'),
                    Tab(text: 'Social Media'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      FutureBuilder<EducationModel>(
                        future: network.getEducationMethod(),
                        builder: (BuildContext context,
                            AsyncSnapshot<EducationModel> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final EducationData data =
                                snapshot.data as EducationData;
                            return EducationCard(education: data);
                          } else {
                            return Text('');
                          }
                        },
                      ),
                      FutureBuilder<SkillsModel>(
                        future: network.getSkillsMethod(),
                        builder: (BuildContext context,
                            AsyncSnapshot<SkillsModel> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final SkillData data = snapshot.data as SkillData;
                            return GridViewSkills(skill: data);
                          } else {
                            return Text('');
                          }
                        },
                      ),
                      FutureBuilder<ProjectsModel>(
                        future: network.getProjectsMethod(),
                        builder: (BuildContext context,
                            AsyncSnapshot<ProjectsModel> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final ProjectData data =
                                snapshot.data as ProjectData;
                            return ProjectGridView(project: data);
                          } else {
                            return Text('');
                          }
                        },
                      ),
                      FutureBuilder<SocialMediaModel>(
                        future: network.getSocialMediaMethod(),
                        builder: (BuildContext context,
                            AsyncSnapshot<SocialMediaModel> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final SocialMediaData data =
                                snapshot.data as SocialMediaData;
                            return GridViewSocialMedia(socialmedia: data);
                          } else {
                            return Text('');
                          }
                        },
                      ),
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
