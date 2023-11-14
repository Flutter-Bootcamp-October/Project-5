import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/views/add_education_scree.dart';
import 'package:resume_app/widgets/Skill_widget.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => EducationScreenState();
}

class EducationScreenState extends State<EducationScreen> {
  late String token;
  @override
  void initState() {
    token = getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Education",
                      style: TextStyle(color: Colors.black, fontSize: 40)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddEducationScreen()),
                        );
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            Center(
              child: Wrap(
                  children: List.generate(userEducation.length,
                      (index) => SkillWidget(skill: userSkills[index]))),
            ),
          ]))
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
