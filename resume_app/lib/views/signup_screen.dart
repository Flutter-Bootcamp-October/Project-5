import 'package:flutter/material.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/authorization.dart';
import 'package:resume_app/views/verification_screen.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({super.key});

  @override
  Widget build(BuildContext context) {
    prefs.clear();
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
            decoration: const InputDecoration(hintText: "enter name *"),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "enter email *"),
          ),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(hintText: "enter phone number *"),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "enter password *"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                if (passwordController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  try {
                    final res = await Authorization().registrerUser(body: {
                      "name": nameController.text,
                      "phone": phoneController.text,
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
                                type: 'registration',
                                token: getToken(),
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
              child: const Text("register")),
        ],
      )),
    );
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
