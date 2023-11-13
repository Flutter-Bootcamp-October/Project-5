import 'dart:developer';

import 'package:cv_app_project/components/general/app_button.dart';
import 'package:cv_app_project/components/general/is_member.dart';
import 'package:cv_app_project/components/general/textfield_with_label.dart';
import 'package:cv_app_project/screens/home_screen.dart';
import 'package:cv_app_project/screens/signin_screen.dart';
import 'package:cv_app_project/services/registration_api.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
              label: 'Name',
              hint: 'Enter Your Name',
              controller: nameController,
              isPass: false,
            ),
            TextFieldWithLabel(
              label: 'Phone',
              hint: 'Enter Your Phone Number',
              controller: phoneController,
              isPass: false,
            ),
            TextFieldWithLabel(
              label: 'Email',
              hint: 'Enter Your Email',
              controller: emailController,
              isPass: false,
            ),
            TextFieldWithLabel(
              label: 'Password',
              hint: 'Enter Your Password',
              controller: passwordController,
              isPass: true,
            ),
            SizedBox(height: 8),
            AppButton(
              text: 'sign up',
              onTap: () {
                if (nameController.text.isEmpty ||
                    phoneController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("All fields are required!"),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
            ),
            SizedBox(height: 16),
            IsMember(
              leftText: 'Already have an account ?',
              rightText: ' Sign in',
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
