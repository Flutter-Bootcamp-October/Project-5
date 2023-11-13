import 'package:cv_app_project/components/general/app_button.dart';
import 'package:cv_app_project/components/general/is_member.dart';
import 'package:cv_app_project/components/general/textfield_with_label.dart';
import 'package:cv_app_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: double.infinity),
            TextFieldWithLabel(
              label: 'Phone',
              hint: 'Enter Your Phone Number',
              controller: emailController,
              isPass: false,
            ),
            TextFieldWithLabel(
              label: 'Email',
              hint: 'Enter Your Email',
              controller: passController,
              isPass: false,
            ),
            SizedBox(height: 8),
            AppButton(
              text: 'sign in',
              onTap: () {},
            ),
            SizedBox(height: 16),
            IsMember(
              leftText: 'Did not register yet ?',
              rightText: ' Sign up',
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
