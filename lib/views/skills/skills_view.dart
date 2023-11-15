import 'package:flutter/material.dart';
import 'package:project_5/views/projects/projects_view.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({super.key});

  @override
  State<SkillsView> createState() => _EditSkillsViewState();
}

class _EditSkillsViewState extends State<SkillsView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController skill1Controller = TextEditingController();
    final TextEditingController skill2Controller = TextEditingController();
    final TextEditingController skill3Controller = TextEditingController();
    final TextEditingController skill4Controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfff0f6f5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Skills',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Skill',
                hint: 'Enter one skill here',
                isPassword: false,
                icon: Icons.memory_outlined,
                controller: skill1Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Skill',
                hint: 'Enter one skill here',
                isPassword: false,
                icon: Icons.memory_outlined,
                controller: skill2Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Skill',
                hint: 'Enter one skill here',
                isPassword: false,
                icon: Icons.memory_outlined,
                controller: skill3Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Skill',
                hint: 'Enter one skill here',
                isPassword: false,
                icon: Icons.memory_outlined,
                controller: skill4Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   Text('Next'),
                  IconButton(
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectsView()));
                      },
                      icon: Icon(Icons.arrow_right_alt_outlined))
              ],
            ),
          )
        ],
      ),
    );
  }
}
