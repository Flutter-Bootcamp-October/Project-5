import 'package:flutter/material.dart ';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';

import '../profile/profile_screen.dart';
import 'components/account_availability.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   phoneController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.getHeight() * .103),
              Image.asset("assets/images/sign_logo.png", scale: 3),
              SizedBox(height: context.getHeight() * .075),
              const AuthTextField(isPassword: false, content: "Name"),
              SizedBox(height: context.getHeight() * .019),
              const AuthTextField(isPassword: false, content: "Email"),
              SizedBox(height: context.getHeight() * .019),
              const AuthTextField(isPassword: false, content: "Phone"),
              SizedBox(height: context.getHeight() * .019),
              const AuthTextField(isPassword: true, content: "Password"),
              SizedBox(height: context.getHeight() * .019),
              const AuthTextField(isPassword: true, content: "Password"),
              SizedBox(height: context.getHeight() * .019),
              AuthButton(
                  content: "Sign In",
                  color: Colors.grey[200]!,
                  onPressedFunc: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ));
                  },
                  isDisabled: false),
              const SizedBox(height: 8),
              const AccountAvailability(haveAccount: true)
            ],
          ),
        ),
      ),
    );
  }
}
