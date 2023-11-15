import 'package:flutter/material.dart';
import 'package:project_resume/screens/about/personal_info_screen.dart';
import 'package:project_resume/screens/education/education_screen.dart';
import 'package:project_resume/screens/getUser/get_user_screen.dart';
import 'package:project_resume/screens/project/project_screen.dart';
import 'package:project_resume/screens/skills/skills_screen.dart';
import 'package:project_resume/screens/social/social_screen.dart';
import 'package:project_resume/widgets/grid_view_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 89, 201, 228),
          title: const Text('Resume'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                children: [
                  GridViewHome(
                    pageName: 'Personal Information',
                    page: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PersonalInfoScreen()));
                    },
                    colorGridView: Colors.amber,
                    iconGridView: Icons.person,
                  ),
                  GridViewHome(
                    pageName: 'Project',
                    page: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProjectScreen()));
                    },
                    colorGridView: const Color.fromARGB(255, 87, 142, 188),
                    iconGridView: Icons.abc,
                  ),
                  GridViewHome(
                    pageName: 'Skills',
                    page: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SkillsScreen()));
                    },
                    colorGridView: const Color.fromARGB(255, 29, 127, 33),
                    iconGridView: Icons.abc,
                  ),
                  GridViewHome(
                    pageName: 'Social',
                    page: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SocialScreen()));
                    },
                    colorGridView: Colors.deepPurple,
                    iconGridView: Icons.school_sharp,
                  ),
                  GridViewHome(
                    pageName: 'Education',
                    page: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EducationScreen()));
                    },
                    colorGridView: const Color.fromARGB(255, 56, 173, 182),
                    iconGridView: Icons.school_sharp,
                  ),
                  GridViewHome(
                    pageName: 'Users',
                    page: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GetUserScreen()));
                    },
                    colorGridView: const Color.fromARGB(255, 161, 38, 38),
                    iconGridView: Icons.groups,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
