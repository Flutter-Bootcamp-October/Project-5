import 'package:flutter/material.dart';
import 'package:project_5/screens/first_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key,
      required this.email,
      required this.type,
      required this.token});
  final String email;
  final String type;
  final String token;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController(),
    passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Login"),
          TextField(
              decoration: const InputDecoration(label: Text("Enter email")),
              controller: emailController),
          TextField(
              decoration: const InputDecoration(label: Text("Enter password")),
              controller: passwordController),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
              child: const Text("Create Account")),
        ],
      ),
    );
  }
}
