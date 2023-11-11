import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/auth_model.dart';
import 'package:project_5/screens/login_scrren.dart';

class AccountVerification extends StatefulWidget {
  const AccountVerification({super.key});

  @override
  State<AccountVerification> createState() => _AccountVerificationState();
}

// final Data userdata;

TextEditingController otpController = TextEditingController();

class _AccountVerificationState extends State<AccountVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter OTP"),
            TextField(
                decoration: InputDecoration(label: Text("Enter email otp")),
                controller: otpController),
            ElevatedButton(
                onPressed: () async {
                  final apiMethod = ApiMethods();
                  if (otpController.text.isNotEmpty) {
                    try {
                      apiMethod.emialVerification(
                        body: {
                          "otp": otpController.text,
                          // "email": userdata,
                          "type": "registration"
                        },
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    } on FormatException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          error.message.toString(),
                        ),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Enter otp"),
                    ));
                  }
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
