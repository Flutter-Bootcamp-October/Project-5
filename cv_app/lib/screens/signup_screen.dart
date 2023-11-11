import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:cv_app/widgets/change_accees_method.dart';
import 'package:cv_app/widgets/or_sign_in_with.dart';
import 'package:cv_app/widgets/signup_bar.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SigninBar(),
            const SizedBox(height: 32),
            const AppTextField(label: "Name", icon: Icons.person_2_rounded),
            const AppTextField(label: "Phone", icon: Icons.local_phone_rounded),
            const AppTextField(
                label: "Email Address", icon: Icons.email_rounded),
            const AppTextField(
                label: "Password", icon: Icons.lock_rounded, isObscure: true),
            const SizedBox(height: 64),
            AppBotton(onTap: () {}, text: "SIGN UP"),
            const OrSignInWith(),
            ChangeAccessMethod(
                quistion: "Already have an account? ",
                accessMethos: "LOG IN",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
