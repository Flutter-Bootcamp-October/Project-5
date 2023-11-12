import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/screens/home_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
//final String type => "reset"
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

TextEditingController emailController =
// TextEditingController(),
//     passwordController =
    TextEditingController();

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Column(
        children: [
          TextField(
              decoration: const InputDecoration(label: Text("Enter email")),
              controller: emailController),
          // TextField(
          //     decoration: const InputDecoration(label: Text("Enter password")),
          //     controller: passwordController),
          ElevatedButton(
            onPressed: () async {
              final apiMethod = ApiMethods();
              if (emailController.text.isNotEmpty) {
                try {
                  final Auth res = await apiMethod
                      .resetPassword(body: {"email": emailController.text});
                  if (res.codeState == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(res.msg),
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
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
                    content: Text("Enter email"),
                  ),
                );
              }
            },
            child: const Text("reset"),
          ),
        ],
      ),
    );
  }
}
