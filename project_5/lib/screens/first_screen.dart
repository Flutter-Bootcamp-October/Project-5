import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/screens/create_verification.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
  });

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

TextEditingController nameController = TextEditingController(),
    phoneController = TextEditingController(),
    emailController = TextEditingController(),
    passwordController = TextEditingController();

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              decoration: const InputDecoration(label: Text("Enter name")),
              controller: nameController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter phone")),
              controller: phoneController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter email")),
              controller: emailController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter password")),
              controller: passwordController),
          ElevatedButton(
              onPressed: () async {
                final apiMethod = ApiMethods();
                try {
                  await apiMethod.createAccount(body: {
                    "name": nameController.text,
                    "phone": phoneController.text,
                    "email": emailController.text,
                    "password": passwordController.text,
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountVerification(
                            //email, type:register
                            )),
                  );
                } on FormatException catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.message.toString())));
                }
              },
              child: const Text("Create account"))
        ]),
      ),
    );
  }
}
