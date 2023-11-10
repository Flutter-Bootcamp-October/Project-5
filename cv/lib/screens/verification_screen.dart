import 'package:cv/style/colors.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
  });

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
              onTap: () {},
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
