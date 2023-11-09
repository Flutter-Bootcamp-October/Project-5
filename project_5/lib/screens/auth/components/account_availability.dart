import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
          style: const TextStyle(color: Colors.black),
          text: haveAccount ? "Have an account? " : "Don't Have an Account? ",
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => haveAccount
                              ? const SignInScreen()
                              : const SignUpScreen()));
                },
              text: haveAccount ? "Sign In" : "Sign Up",
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ]),
    );
  }
}
