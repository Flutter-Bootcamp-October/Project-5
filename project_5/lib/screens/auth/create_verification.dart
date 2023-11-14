import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/verification_model.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:project_5/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/input_text_fields.dart';

class AccountVerification extends StatefulWidget {
  const AccountVerification(
      {super.key, required this.email, required this.type});

  final String email;
  final String type;
  @override
  State<AccountVerification> createState() => _AccountVerificationState();
}

TextEditingController otpController = TextEditingController();

class _AccountVerificationState extends State<AccountVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter OTP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            InputTextFields(
              controller: otpController,
              title: "Enter otp",
              lines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final apiMethod = ApiMethods();
                if (otpController.text.isNotEmpty) {
                  final Verification res =
                      await apiMethod.emailVerification(body: {
                    "otp": otpController.text,
                    "email": widget.email,
                    "type": widget.type,
                  });
                  final SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString("token", res.data.token);

                  if (widget.type == "registration") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => LoginScreen())));
                  } else {
                    if (widget.type == "login") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  }
                }
              },
              child: const Text("submit OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
