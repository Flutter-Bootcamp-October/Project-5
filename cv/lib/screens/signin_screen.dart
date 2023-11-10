// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/screens/signup_screen.dart';
import 'package:cv/screens/verification_screen.dart';
import 'package:cv/services/auth/login.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Let's Sign in",
            style: TextStyle(
                fontSize: 35, color: blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 60,
          ),
          AddTextField(
            label: 'Email',
            hint: 'Enter your email',
            isPassword: false,
            controller: emailController,
            icon: Icons.email,
          ),
          hight30(),
          AddTextField(
            label: 'Password',
            hint: 'Enter Password',
            isPassword: true,
            controller: passwordController,
            icon: Icons.password_rounded,
          ),
          hight40(),
          hight8(),
          InkWell(
            onTap: () async {
              try {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  final response = await login({
                    "email": emailController.text,
                    "password": passwordController.text
                  });
                  if (response.statusCode >= 200 && response.statusCode < 300) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("done")));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationScreen(
                            email: emailController.text,
                            type: 'login',
                          ),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(jsonDecode(response.body)["msg"])));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("please enter all information")));
                }
              } catch (error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.toString())));
              }
            },
            child: Container(
              width: 330,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: pink),
              child: const Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          hight30(),
          hight14(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account yet?"),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ));
                },
                child: Text(
                  "  Sign up",
                  style: TextStyle(
                      fontSize: 15, color: blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
