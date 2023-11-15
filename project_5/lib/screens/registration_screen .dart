import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_5/api/auth.dart';
import 'package:project_5/color/palette.dart';
import 'package:project_5/model/Token.dart';
import 'package:project_5/screens/home_page.dart';
import 'package:project_5/screens/login_screen.dart';
import 'package:project_5/widgets/login_button.dart';
import 'package:project_5/widgets/login_field.dart';
import 'package:project_5/widgets/social_button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key});
  var auth = Auth();
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerPhone = TextEditingController();
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  TextEditingController? controllerOtp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/signin_balls.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svgs/planet-registration.svg",
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
                        "Register Now.",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              LoginField(
                hintText: "Name",
                iconData: Icons.person,
                controller: controllerName,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Phone",
                iconData: Icons.phone,
                controller: controllerPhone,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Email",
                iconData: Icons.email,
                controller: controllerEmail,
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: "Password",
                iconData: Icons.password,
                controller: controllerPassword,
              ),
              const SizedBox(height: 20),
              LoginButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  try {
                    final http.Response res = await auth.postRegistration({
                      "name": controllerName?.text,
                      "phone": controllerPhone?.text,
                      "password": controllerPassword?.text,
                      "email": controllerEmail?.text,
                    });
                    Navigator.of(context).pop(); // Close the loading dialog
                    if (res.statusCode == 200) {
                      String userEmail = json.decode(res.body)["data"]["email"];
                      print("Registered successfully. User email: $userEmail");
                      showOtpCheckContainer(context);
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
                    print('Error during registration: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'An error occurred during registration. Please try again.',
                        ),
                      ),
                    );
                  }
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
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

  showOtpCheckContainer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Enter OTP in your Email')),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: Palette.backgroundColor,
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controllerOtp,
                  decoration: const InputDecoration(
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
                  onPressed: () async {
                    Token().deleteToken();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );

                    try {
                      final http.Response res = await auth.postVerification(
                        {
                          "otp": controllerOtp?.text,
                          "email": controllerEmail?.text,
                          "type": "registration",
                        },
                      );
                      Navigator.of(context).pop();

                      if (res.statusCode == 200) {
                        String token = json.decode(res.body)["data"]["token"];
                        print("Verification successful. User token: $token");

                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('userToken', token);

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
                      // Handle errors during verification
                      print('Error during verification: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'An error occurred during verification. Please try again.',
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: const Text('Verify'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
