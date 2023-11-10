import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:cv_app/widgets/or_sign_in_with.dart';
import 'package:cv_app/widgets/welcome_back.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          WelcomeBack(),
          AppTextField(label: "Email Address", icon: Icons.email_rounded),
          AppTextField(
              label: "Password", isObscure: true, icon: Icons.lock_rounded),
          Row(children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 32, bottom: 32),
              child: Text("forgot password?"),
            )
          ]),
          AppBotton(text: "LOGIN"),
          OrSignInWith(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Color(0xff0c3a2d), fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
