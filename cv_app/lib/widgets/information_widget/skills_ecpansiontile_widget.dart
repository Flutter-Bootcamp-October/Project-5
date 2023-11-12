import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/skill/skill_data_model.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:cv_app/widgets/information_widget/textfiled_widget.dart';
import 'package:flutter/material.dart';

class AddSkillsWidget extends StatefulWidget {
  const AddSkillsWidget({Key? key}) : super(key: key);

  @override
  _AddSkillsWidgetState createState() => _AddSkillsWidgetState();
}

class _AddSkillsWidgetState extends State<AddSkillsWidget> {
  TextEditingController skillController = TextEditingController();
  List<SkillData> skillsList = [];

  void addSkill() {
    String skillNames = skillController.text;
    List<String> skills = skillNames.split(',');

    for (String skillName in skills) {
      String? imageString = getImageString(skillName.trim());

      if (imageString != null && imageString.isNotEmpty) {
        setState(() {
          skillsList.add(SkillData(skill: skillNames));
        });
      }
    }

    skillController.clear();
  }

  String? getImageString(String skillName) {
    switch (skillName) {
      case 'C':
        return 'lib/assets/icon_skills/c-.png';
      case 'Java':
        return 'lib/assets/icon_skills/java.png';
      case 'JavaScript':
        return 'lib/assets/icon_skills/java-script.png';
      case 'Html':
        return 'lib/assets/icon_skills/html-5.png';
      case 'Github':
        return 'lib/assets/icon_skills/github.png';
      case 'Css':
        return 'lib/assets/icon_skills/css-3.png';
      case 'C#':
        return 'lib/assets/icon_skills/c-sharp.png';
      case 'Xml':
        return 'lib/assets/icon_skills/xml.png';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: lightGrey,
      collapsedBackgroundColor: lightGrey,
      iconColor: prussianBlue,
      collapsedIconColor: prussianBlue,
      title: const Text(
        'Skills',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: prussianBlue,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: skillsList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      SkillData skill = skillsList[index];
                      String? imageString = getImageString(skill as String);
                      return TextFelidWidget(
                        hintTitle: 'Enter skill',
                        title: 'Add Skills',
                        controller: skillController,
                        onChanged: (value) {
                          setState(() {
                            skillsList[index].skill = value;
                          });
                        },
                      );
                    },
                  ),
                  height10,
                  ButtonWidget(
                    onTap: addSkill,
                    name: 'Add Skills',
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
