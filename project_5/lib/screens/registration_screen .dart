import 'package:flutter/material.dart';
import 'package:project_5/pallete.dart';
import 'package:project_5/widgets/login_button.dart';
import 'package:project_5/widgets/login_field.dart';
import 'package:project_5/widgets/social_button.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key});

  Future<void> _showOtpCheckContainer(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Enter OTP in your Email')),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: Palette.backgroundColor,
          content: SingleChildScrollView(
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    fillColor: Palette.borderColor,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Close the OTP check container

                    // Delay the navigation to the LoginScreen
                    Future.delayed(Duration(milliseconds: 300), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    });
                  },
                  child: const Text('Verify'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                  "Register Now.",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              LoginField(
                hintText: "Name",
                iconData: Icons.person,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Phone",
                iconData: Icons.phone,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Email",
                iconData: Icons.email,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Password",
                iconData: Icons.password,
              ),
              const SizedBox(height: 20),
              LoginButton(
                onPressed: () {
                  // Simulate registration with user data
                  _showOtpCheckContainer(context);
                },
                label: "Register",
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
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  "Do you have an account? Login here",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
