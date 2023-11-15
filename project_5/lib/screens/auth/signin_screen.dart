import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/screens/auth/create_verification.dart';
import 'package:project_5/screens/auth/register_screen.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/input_text_fields.dart';

SharedPreferences? pref;

class SigninScreen extends StatefulWidget {
  const SigninScreen({
    super.key,
  });

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

TextEditingController emailController = TextEditingController(),
    passwordController = TextEditingController();

class _SigninScreenState extends State<SigninScreen> {
  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          const Text(
            "Sign In",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          SizedBox(
            height: 50,
          ),
          InputTextFields(
            controller: emailController,
            title: "Enter email",
            lines: 1,
          ),
          InputTextFields(
            controller: passwordController,
            title: "Enter password",
            lines: 1,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                textEntry: "Login",
                onpress: () async {
                  final apiMethod = ApiMethods();
                  // add login method and conditions
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    try {
                      final Auth res = await apiMethod.login(body: {
                        "email": emailController.text,
                        "password": passwordController.text,
                      });
                      if (res.codeState == 200) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountVerification(
                                    email: res.data.email,
                                    type: "login",
                                  )),
                        );
                      }
                    } on FormatException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          error.message.toString(),
                        ),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter all text fields"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 120,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
            },
            child: const Text("create account"),
          ),
        ],
      ),
    );
  }
}

Future getPref() async {
  pref = await SharedPreferences.getInstance();
}
