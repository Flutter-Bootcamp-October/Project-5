import 'package:cv_app/models/about/about_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/projects/project_model.dart';
import 'package:cv_app/models/skill/skill_model.dart';
import 'package:cv_app/models/social_media_model.dart';
import 'package:cv_app/widgets/home_tab_bar/project_tab_bar/project_card.dart';
import 'package:cv_app/widgets/home_tab_bar/skill_tab_bar/skill_widget.dart';
import 'package:cv_app/widgets/home_tab_bar/social_media_tab_bar/socialmedia_widget.dart';
import 'package:flutter/material.dart';
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/education/education_model.dart';
import 'package:cv_app/widgets/home_tab_bar/education_tab_bar/education_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int calculateAge(String dateString) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(dateString);
    int age = now.year - date.year;
    if (now.month < date.month ||
        (now.month == date.month && now.day < date.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: richBlack,
        ),
        backgroundColor: richBlack,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: network.getAboutMethod(context: context),
                builder: (BuildContext context,
                    AsyncSnapshot<AboutModel?> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                snapshot.data!.data.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            width20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.data.name,
                                  style: const TextStyle(
                                    color: eggShell,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                height12,
                                Text(
                                  '${calculateAge(snapshot.data!.data.birthday)}  .  ${snapshot.data!.data.titlePosition}  .  ${snapshot.data!.data.location}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: payneGrey,
                                  ),
                                ),
                                height12,
                                Text(
                                  snapshot.data!.data.email,
                                  style: const TextStyle(
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
                        const Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            'About me',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: eggShell,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Text(
                            snapshot.data!.data.about,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: silverBlue,
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Text('');
                  }
                },
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
                    FutureBuilder<EducationModel?>(
                      future: network.getEducationMethod(context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<EducationModel?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return SingleChildScrollView(
                            child: Column(
                              children: snapshot.data!.data
                                  .map((e) => EducationCard(education: e))
                                  .toList(),
                            ),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                    FutureBuilder<SkillsModel?>(
                      future: network.getSkillsMethod(context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<SkillsModel?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return SingleChildScrollView(
                            child: Wrap(
                                spacing: 10,
                                children: snapshot.data!.data
                                    .map((e) => SkillWidget(skill: e))
                                    .toList()),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                    FutureBuilder<ProjectsModel?>(
                      future: network.getProjectsMethod(context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<ProjectsModel?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return SingleChildScrollView(
                            child: Column(
                                children: snapshot.data!.data
                                    .map((e) => ProjectCard(project: e))
                                    .toList()),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                    FutureBuilder<SocialMediaModel?>(
                      future: network.getSocialMediaMethod(context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<SocialMediaModel?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return SingleChildScrollView(
                            child: Wrap(
                                spacing: 10,
                                children: snapshot.data!.data
                                    .map((e) =>
                                        SocialMediaWidget(socialMedia: e))
                                    .toList()),
                          );
                          ;
                        } else {
                          return const Text('');
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
    );
  }
}
