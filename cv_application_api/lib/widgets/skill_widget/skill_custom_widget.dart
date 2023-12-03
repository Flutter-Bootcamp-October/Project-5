import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/skill_model.dart';
import 'package:cv_application_api/pages/skills_and_soical_media_screen/add_skill_screen.dart';
import 'package:cv_application_api/services/api/skill_api.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class SkillCustomWidget extends StatefulWidget {
  const SkillCustomWidget({super.key});

  @override
  State<SkillCustomWidget> createState() => _SkillCustomWidgetState();
}

class _SkillCustomWidgetState extends State<SkillCustomWidget> {
  bool _isLoading = true;
  Skill? skill;
  @override
  void initState() {
    super.initState();
    getUserInfoMethode();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    setState(() {});
  }

  Future<Skill?> getUserInfoMethode() async {
    final Skill? response = await getUserSkill(context: context);
    skill = response;
    return skill;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddSkillScreen();
            }));
            setState(() {});
          },
          child: const TitleOfScreen(
            title: "Add Skill",
            titleFontSize: 30,
            titleletterSpacing: 3,
            titleColor: appWhite,
            titlefontWeight: FontWeight.bold,
          ),
        ),
        if (_isLoading == true)
          const Center(
            child: CircularProgressIndicator(
              color: app2DarkGreen,
            ),
          ),
        if (_isLoading == false)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: app2DarkGreenTrans),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height14,
                      const TitleOfScreen(
                        title: 'Skill :',
                        titleFontSize: 18,
                        titleletterSpacing: 0,
                        titlefontWeight: FontWeight.w300,
                        titleColor: appWhite,
                      ),
                      height10,
                      for (int i = 0; i < skill!.skillData!.length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                NormalText(
                                  title: 'o  ',
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                NormalText(
                                  title: skill?.skillData![i].skill! ?? '',
                                  titleFontSize: 20,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await deleteUserSkill(context: context, {
                                        "id_skill": skill!.skillData![i].id,
                                      });
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_rounded,
                                      size: 40,
                                    )),
                              ],
                            )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
