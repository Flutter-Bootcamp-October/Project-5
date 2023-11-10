import 'package:cv_app/screens/signup_screen.dart';
import 'package:cv_app/services/auth.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:cv_app/widgets/change_accees_method.dart';
import 'package:cv_app/widgets/or_sign_in_with.dart';
import 'package:cv_app/widgets/welcome_back.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeBack(),
            const SizedBox(height: 24),
            const AppTextField(
                label: "Email Address", icon: Icons.email_rounded),
            const AppTextField(
                label: "Password", isObscure: true, icon: Icons.lock_rounded),
            const Row(children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 32, bottom: 32),
                child: Text("forgot password?"),
              )
            ]),
            const AppBotton(text: "LOGIN"),
            const OrSignInWith(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ChangeAccessMethod(
                quistion: "Don't have an account? ",
                accessMethos: "SIGN UP",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
