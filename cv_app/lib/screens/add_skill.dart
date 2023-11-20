import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/skills.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class AddSkillScreen extends StatelessWidget {
  const AddSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController skillController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Add Skill"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AppTextField(
                label: "Skill",
                icon: Icons.pages_rounded,
                controller: skillController),
            AppBotton(
              text: "Add",
              onTap: () async {
                final response = await addSkill(skill: skillController.text);
                if (response['codeState'] == 200) {
                  skillController.text = "";
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(response['msg'].toString())),
                  );
                }
              },
            )
          ],
        ));
  }
}
