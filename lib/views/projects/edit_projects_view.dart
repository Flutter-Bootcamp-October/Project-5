import 'package:flutter/material.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class EditProjectsView extends StatefulWidget {
  const EditProjectsView({super.key});

  @override
  State<EditProjectsView> createState() => _EditProjectsViewState();
}

class _EditProjectsViewState extends State<EditProjectsView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController project1Controller = TextEditingController();
    final TextEditingController project2Controller = TextEditingController();
    final TextEditingController project3Controller = TextEditingController();
    final TextEditingController project4Controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfffaeff4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child:Text(
              'Projects',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Project 1',
                hint: 'Enter your project here',
                icon: Icons.settings,
                isPassword: false,
                controller: project1Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Project 2',
                hint: 'Enter your project here',
                icon: Icons.settings,
                isPassword: false,
                controller: project2Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Project 3',
                hint: 'Enter your project here',
                icon: Icons.settings,
                isPassword: false,
                controller: project3Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Project 4',
                hint: 'Enter your project here',
                icon: Icons.settings,
                isPassword: false,
                controller: project4Controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'Apdate', onPressedFunc: () {}),
          )
        ],
      ),
    );
  }
}
