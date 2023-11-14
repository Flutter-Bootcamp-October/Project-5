// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:pcv/screens/rest_screen.dart';
import 'package:pcv/screens/verification_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7052ff)),
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    text: 'Email',
                    obscure: false,
                    controller: emailController,
                  ),
                  TextFieldWidget(
                      text: 'Password',
                      obscure: true,
                      controller: passwordController),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestScreen(),
                            ));
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: Color(0xff7052ff)),
                      )),
                  ButtonWidget(
                      onPressed: () async {
                        try {
                          final Response resp = await network.loginMethod({
                            "password": passwordController.text,
                            "email": emailController.text,
                          });

                          if (resp.statusCode == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationScreen(
                                    type: 'login',
                                    email: emailController.text,
                                  ),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    (await jsonDecode(resp.body))["msg"]
                                        .toString())));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                      text: 'Sign In'),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          const TextSpan(text: 'Don\'t have an account?'),
                          TextSpan(
                              text: ' Register',
                              style: const TextStyle(color: Color(0xff7052ff)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    )))
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
