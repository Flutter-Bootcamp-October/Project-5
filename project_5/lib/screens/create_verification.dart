import 'package:flutter/material.dart';

class AccountVerification extends StatefulWidget {
  const AccountVerification({super.key});

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
          children: [
            TextField(
                decoration: InputDecoration(label: Text("Enter email otp")),
                controller: otpController),
          ],
        ),
      ),
    );
  }
}
