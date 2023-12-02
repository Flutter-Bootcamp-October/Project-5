import 'package:cv_app/globals/app_loading.dart';
import 'package:cv_app/screens/otp_screen.dart';
import 'package:cv_app/screens/signup_screen.dart';
import 'package:cv_app/services/auth.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:cv_app/widgets/change_accees_method.dart';
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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(),
        passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeBack(),
            const SizedBox(height: 24),
            AppTextField(
              label: "Email Address",
              icon: Icons.email_rounded,
              controller: emailController,
            ),
            AppTextField(
              label: "Password",
              isObscure: true,
              icon: Icons.lock_rounded,
              controller: passwordController,
            ),
            const Row(children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 32, bottom: 32),
                child: Text("forgot password?"),
              )
            ]),
            AppBotton(
                onTap: () async {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    loading(context);

                    final response = await login(
                        emailController.text, passwordController.text);
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    if (response['codeState'] == 200) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                              email: emailController.text, type: "login"),
                        ),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['msg'])));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Email and password are required.")));
                  }
                },
                text: "LOGIN"),
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
                        builder: (context) => const SignupScreen()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
