import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:resume_app/services/api_services.dart';
import 'package:resume_app/views/verification_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, required this.token});
  final String token;

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
                Response x = await ApiServices().loginUser(body: {
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
                              type: 'login',
                              token: token,
                            )),
                  );
                }
              },
              child: const Text("login"))
        ],
      )),
    );
  }
}
