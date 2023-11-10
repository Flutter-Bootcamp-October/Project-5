import 'package:flutter/material.dart';
import 'package:resume_app/services/api_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/views/verification_screen.dart';
import 'package:resume_app/widgets/custom_rich_text.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "enter name"),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "enter email *"),
          ),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(hintText: "enter phone number"),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "enter password *"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                final x = await ApiServices().registrerUser(body: {
                  "name": nameController.text,
                  "phone": phoneController.text,
                  "email": emailController.text,
                  "password": passwordController.text
                });
                print('Response status: ${x.statusCode}');
                print('Response body: ${x.body}');
                if (x.statusCode == 200) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationScreen(
                              email: emailController.text,
                              type: 'registration',
                              token: '',
                            )),
                  );
                }
              },
              child: const Text("register")),
          const SizedBox(height: 20),
          const RichTextCustom(
              text1: "already have an account",
              text2: "Sign in",
              screen: SignInScreen(
                  token:
                      "eyJhbGciOiJIUzI1NiIsImtpZCI6Ikc4c2lRbVB5dGw3Vzc2K00iLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjk5NjIyNTE2LCJpYXQiOjE2OTk2MDQ1MTYsImlzcyI6Imh0dHBzOi8vbXpranV5cnZ3eHVsc3d3cmlvcm0uc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6IjE3OTAzM2YyLTRkZTYtNGMzOS1hOWQyLWJlMGIyY2YzZTRkMCIsImVtYWlsIjoiZGVtbGlndXJkdUBndWZ1bS5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJvdHAiLCJ0aW1lc3RhbXAiOjE2OTk2MDQ1MTZ9XSwic2Vzc2lvbl9pZCI6IjA5MmYwYzUwLTlmMTktNGZhMy04YWYyLTdlOWY0NGQxYTVlNiJ9.JR2uMgMB09YKB8Nqvh2MwvRtL7Uya7oNbJF1LBx1P1Y"))
        ],
      )),
    );
  }
}
