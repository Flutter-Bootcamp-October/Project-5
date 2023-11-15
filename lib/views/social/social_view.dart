import 'package:flutter/material.dart';
import 'package:project_5/views/home_view.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class SocialView extends StatefulWidget {
  const SocialView({super.key});

  @override
  State<SocialView> createState() => _SocialViewState();
}

class _SocialViewState extends State<SocialView> {
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
                hint: 'Enter Social',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: social1Controller),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Social',
                hint: 'Enter Social',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: social2Controller),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Social',
                hint: 'Enter Social',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: social3Controller),
          ),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'Submit', onPressedFunc: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
            }),
          ),
       
        ],
      )
    );
  }
}
