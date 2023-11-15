import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/skill/skill_data_model.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:cv_app/widgets/information_widget/textfiled_widget.dart';
import 'package:flutter/material.dart';

class AddSkillsWidget extends StatefulWidget {
  const AddSkillsWidget({super.key});

  @override
  _AddSkillsWidgetState createState() => _AddSkillsWidgetState();
}

class _AddSkillsWidgetState extends State<AddSkillsWidget> {
  TextEditingController skillController = TextEditingController();
  List<SkillData> skillsList = [];

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
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          TextFelidWidget(
                            hintTitle: 'Enter skill',
                            title: 'Add Skills',
                            controller: skillController,
                            onChanged: (value) {
                              skillsList[index].skill = value;
                              skillController.text = value;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  height10,
                  if (skillsList.isNotEmpty)
                    ButtonWidget(
                      onTap: () async {
                        final result = await network.addSkillsMethod(
                            body: {"skill": skillController.text});
                      },
                      name: 'Send Skills',
                    ),
                  if (skillsList.isEmpty)
                    ButtonWidget(
                      onTap: () {
                        setState(() {
                          skillsList.add(SkillData(skill: ''));
                        });
                      },
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
