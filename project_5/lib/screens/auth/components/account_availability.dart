import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/main.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/sign_up_screen.dart';

import '../sign_in_screen.dart';

class AccountAvailability extends StatelessWidget {
  const AccountAvailability({
    super.key,
    required this.haveAccount,
  });

  final bool haveAccount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
          text: haveAccount ? "Have an account? " : "Don't Have an Account? ",
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  navigation(
                      context: context,
                      screen: haveAccount
                          ? const SignInScreen()
                          : const SignUpScreen(),
                      type: "push");
                },
              text: haveAccount ? "Sign In" : "Sign Up",
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ]),
    );
  }
}
