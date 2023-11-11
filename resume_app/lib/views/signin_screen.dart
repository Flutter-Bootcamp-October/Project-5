import 'package:flutter/material.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/authorization.dart';
import 'package:resume_app/views/signup_screen.dart';
import 'package:resume_app/views/verification_screen.dart';
import 'package:resume_app/widgets/custom_rich_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "enter email *"),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "enter password *"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                if (passwordController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  try {
                    final res = await Authorization().loginUser(body: {
                      "email": emailController.text,
                      "password": passwordController.text
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(res)));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationScreen(
                                email: emailController.text,
                                type: 'login',
                              )),
                    );
                  } on FormatException catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.message.toString())));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill out required fields")));
                }
              },
              child: const Text("login")),
          const SizedBox(height: 20),
          const RichTextCustom(
              text1: "Don't have an account?",
              text2: "Sign up",
              screen: SignUpSreen())
        ],
      )),
    );
  }
  String getToken() {
    print("in getToken: ${prefs.getString("token")}");
    return prefs.getString("token") ?? "";
  }
}
