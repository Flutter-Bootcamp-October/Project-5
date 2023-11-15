import 'package:flutter/material.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class EditSocialView extends StatefulWidget {
  const EditSocialView({super.key});

  @override
  State<EditSocialView> createState() => _EditSocialViewState();
}

class _EditSocialViewState extends State<EditSocialView> {
  @override
  Widget build(BuildContext context) {
     final TextEditingController social1Controller = TextEditingController();
     final TextEditingController social2Controller = TextEditingController();
     final TextEditingController social3Controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Social',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Social',
                hint: 'UserName',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: social1Controller),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Social',
                hint: 'UserName',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: social2Controller),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Social',
                hint: 'UserName',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: social3Controller),
          ),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'Apdate', onPressedFunc: () {}),
          ),
       
        ],
      )
    );
  }
}
