import 'package:flutter/material.dart';
import 'package:project_5/pallete.dart';
import 'package:project_5/screens/registration_screen%20.dart';
import 'package:project_5/widgets/login_button.dart';
import 'package:project_5/widgets/login_field.dart';
import 'package:project_5/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/signin_balls.png"),
              const Center(
                child: Text(
                  "Login in. ",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              const LoginField(
                hintText: "Email",
                iconData: Icons.person,
              ),
              const SizedBox(height: 20),
              const LoginField(hintText: "Password", iconData: Icons.password),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0), // Adjust left padding as needed
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Add your logic for "Forgot Password?" here
                    },
                    child: const Text(
                      "Forgot password?",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              LoginButton(
                onPressed: () {},
                label: "Login in",
              ),
              const SizedBox(height: 10),
              const Text("or"),
              const SizedBox(height: 10),
              const SocialButton(
                iconPath: "assets/svgs/g_logo.svg",
                label: "Continue with Google",
                horizontalPadding: 38,
              ),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: "assets/svgs/f_logo.svg",
                label: "Continue with Face Book",
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                },
                child: const Text(
                  "Do you have an account? Register now",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
