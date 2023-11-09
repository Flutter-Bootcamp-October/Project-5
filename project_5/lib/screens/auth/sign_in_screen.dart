import 'package:flutter/material.dart  ';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/profile/profile_screen.dart';

import 'components/account_availability.dart';
import 'components/auth_button.dart';
import 'components/auth_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.getHeight() * .103),
            Image.asset("assets/images/sign_logo.png", scale: 3),
            SizedBox(height: context.getHeight() * .09136),
            const AuthTextField(isPassword: false, content: "Email"),
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
            const AccountAvailability(haveAccount: false),
          ],
        ),
      ),
    );
  }
}
