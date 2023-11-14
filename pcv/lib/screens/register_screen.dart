// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/screens/verification_screen.dart';
import 'package:pcv/services/auth_api.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

final network = Network();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        'Register',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7052ff)),
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    text: 'Username',
                    obscure: false,
                    controller: usernameController,
                  ),
                  TextFieldWidget(
                    text: 'Phone',
                    obscure: false,
                    controller: phoneController,
                  ),
                  TextFieldWidget(
                    text: 'Email',
                    obscure: false,
                    controller: emailController,
                  ),
                  TextFieldWidget(
                    text: 'Password',
                    obscure: true,
                    controller: passwordController,
                  ),
                  ButtonWidget(
                    onPressed: () async {
                      try {
                        final Response resp = await network.registerMethod({
                          "name": usernameController.text,
                          "phone": phoneController.text,
                          "password": passwordController.text,
                          "email": emailController.text
                        });

                        if (resp.statusCode == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificationScreen(
                                  type: 'registration',
                                  email: emailController.text,
                                ),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text((await jsonDecode(resp.body))["msg"]
                                  .toString())));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                    text: 'Register',
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          const TextSpan(text: 'Already Register?'),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),
                                    )),
                              text: ' Log In',
                              style: const TextStyle(color: Color(0xff7052ff)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
