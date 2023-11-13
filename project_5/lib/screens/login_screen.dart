import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_5/model/Auth.dart';
import 'package:project_5/screens/home_page.dart';
import 'package:project_5/screens/registration_screen%20.dart';
import 'package:project_5/widgets/login_button.dart';
import 'package:project_5/widgets/login_field.dart';
import 'package:project_5/widgets/social_button.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();

  var auth = Auth();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                    child: Image.asset("assets/images/signin_balls.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svgs/earth.svg",
                        // adjust width and height accordingly
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "Login in.",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              LoginField(
                hintText: "Email",
                iconData: Icons.person,
                controller: controllerEmail,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Password",
                iconData: Icons.password,
                controller: controllerPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0), // Adjust left padding as needed
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      ///////////////
                      ///////////??
                      ////////////
                      ///////////
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
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });

                  try {
                    final http.Response res = await auth.postLogin({
                      "email": controllerEmail?.text,
                      "password": controllerPassword?.text,
                    });
                    Navigator.of(context).pop();
                    if (res.statusCode == 200) {
                      String userEmail = json.decode(res.body)["data"]["email"];
                      print("Logged in successfully. User email: $userEmail");
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            (await json.decode(res.body))["msg"].toString(),
                          ),
                        ),
                      );
                    }
                  } catch (error) {
                    // Handle other errors during login
                    print('Error during login: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'An error occurred during login. Please try again.'),
                      ),
                    );
                  }
                },
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
