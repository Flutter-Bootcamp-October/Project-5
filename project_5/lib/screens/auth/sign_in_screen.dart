import 'package:flutter/material.dart  ';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/otp_screen.dart';
import 'package:project_5/services/auth_api.dart';

import 'components/account_availability.dart';
import 'components/auth_button.dart';
import 'components/auth_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.getHeight() * .103),
              Image.asset("assets/images/sign_logo.png", scale: 3),
              SizedBox(height: context.getHeight() * .09136),
              AuthTextField(
                  isPassword: false,
                  content: "Email",
                  controller: emailController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: true,
                  content: "Password",
                  controller: passwordController),
              SizedBox(height: context.getHeight() * .019),
              AuthButton(
                  content: "Sign In",
                  color: Colors.grey[200]!,
                  onPressedFunc: () async {
                    final response = await loginApi(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    if (response.toLowerCase() == "ok") {
                      navigationPush(
                          context: context,
                          screen: OTPScreen(
                              emailAddress: emailController.text,
                              type: "login"));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Email or Password are incorrect")));
                    }
                  },
                  isDisabled: false),
              const SizedBox(height: 8),
              const AccountAvailability(haveAccount: false),
            ],
          ),
        ),
      ),
    );
  }
}
