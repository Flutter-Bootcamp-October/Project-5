import 'package:flutter/material.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class EditEducationView extends StatefulWidget {
  const EditEducationView({super.key});

  @override
  State<EditEducationView> createState() => _EditEducationViewState();
}

class _EditEducationViewState extends State<EditEducationView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController educationController = TextEditingController();
    return Scaffold(backgroundColor: Color(0xfffbf4ed),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
              'Education',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
              lable: 'Education',
              hint: 'Your Education',
              icon: Icons.cast_for_education,
              isPassword: false,
              controller: educationController
              ),
        ),
               Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'Apdate', onPressedFunc: () {}),
          )
      ],
    ));
  }
}
