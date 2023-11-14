import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/screens/auth/create_verification.dart';
import 'package:project_5/screens/auth/register_screen.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController(),
    passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    getPref();
  }

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
              child: const Text("Login")),
          ElevatedButton(
              onPressed: () async {
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
              child: const Text("Login"))
        ],
      ),
    );
  }
}

Future getPref() async {
  pref = await SharedPreferences.getInstance();
}