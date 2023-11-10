import 'package:flutter/material.dart';

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
          ElevatedButton(onPressed: () async{
            ApiServices x = ApiServices()

          }, child: const Text("register"))
        ],
      )),
    );
  }
}
