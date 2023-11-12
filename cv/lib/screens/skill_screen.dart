import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController skillController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Skill",
                style: TextStyle(
                    fontSize: 25, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              AddTextField(
                label: 'Skill',
                hint: 'Enter skill name',
                isPassword: false,
                controller: skillController,
                icon: Icons.settings,
              ),
              hight40(),
              hight8(),
              InkWell(
                onTap: () async {},
                child: Container(
                  width: 330,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: pink),
                  child: const Center(
                    child: Text(
                      "Add Skill",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
