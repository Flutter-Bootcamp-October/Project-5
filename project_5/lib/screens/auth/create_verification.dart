import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/verification_model.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:project_5/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            const Text("Enter OTP"),
            TextField(
                decoration: const InputDecoration(label: Text("Enter otp")),
                controller: otpController),
            ElevatedButton(
              onPressed: () async {
                final apiMethod = ApiMethods();
                if (otpController.text.isNotEmpty) {
                  try {
                    final Verification res =
                        await apiMethod.emailVerification(body: {
                      "otp": otpController.text,
                      "email": widget.email,
                      "type": widget.type,
                    });
                    if (res.codeState == 200) {
                      final SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString("token", res.data.token);
                      //sharedprefrence
                      print(res.data.token);

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
                      content: Text("Enter otp"),
                    ),
                  );
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
