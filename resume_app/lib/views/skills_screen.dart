import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/skill_model.dart';
import 'package:resume_app/services/skill_services.dart';
import 'package:resume_app/widgets/Skill_widget.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => SkillScreenState();
}

class SkillScreenState extends State<SkillScreen> {
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
                  const Text("Skills",
                      style: TextStyle(color: Colors.black, fontSize: 40)),
                  IconButton(
                      onPressed: () async {
                        late Skill newSkill;
                        TextEditingController customController =
                            TextEditingController();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Enter Skill "),
                                content: TextField(
                                  controller: customController,
                                ),
                                actions: [
                                  MaterialButton(
                                    elevation: 5.0,
                                    child: const Text("add"),
                                    onPressed: () async {
                                      newSkill = Skill.fromJson(
                                          {"skill": customController.text});
                                      userSkills.add(newSkill);
                                      await SkillServ().addSkill(
                                          token: token, skill: newSkill);
                                      setState(() {});
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            Center(
              child: Wrap(
                  children: List.generate(userSkills.length,
                      (index) => SkillWidget(skill: userSkills[index]))),
            ),
          ]))
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
