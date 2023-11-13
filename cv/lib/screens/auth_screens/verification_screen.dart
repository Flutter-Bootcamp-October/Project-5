// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/screens/auth_screens/loding_screen.dart';
import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/services/auth/verification.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
    required this.email,
    required this.type,
  });
  final String email;
  final String type;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style: TextStyle(
                  fontSize: 35, color: blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            AddTextField(
              label: 'OTP',
              hint: 'Enter your OTP',
              isPassword: false,
              controller: otpController,
              icon: Icons.password_rounded,
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                try {
                  if (otpController.text.isNotEmpty) {
                    final response = await verification({
                      "otp": otpController.text,
                      "email": email,
                      "type": type
                    });
                    if (response.statusCode >= 200 &&
                        response.statusCode < 300) {
                      await prefs.setString(
                          'token', jsonDecode(response.body)["data"]["token"]);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("done")));
                      type == "login"
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LodingScreen(),
                              ),
                              (route) => false,
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninScreen(),
                              ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(jsonDecode(response.body)["msg"])));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter the OTP")));
                  }
                } catch (error) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                }
              },
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: pink),
                child: const Center(
                  child: Text(
                    "Send",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
