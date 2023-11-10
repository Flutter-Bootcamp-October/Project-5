import 'package:flutter/material.dart';
import 'package:resume_app/services/api_services.dart';
import 'package:resume_app/views/verification_screen.dart';

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
              child: const Text("register"))
        ],
      )),
    );
  }
}
