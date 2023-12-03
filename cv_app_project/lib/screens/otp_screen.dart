import 'package:cv_app_project/components/general/app_button.dart';
import 'package:cv_app_project/components/general/is_member.dart';
import 'package:cv_app_project/components/general/textfield_with_label.dart';
import 'package:cv_app_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: double.infinity),
            TextFieldWithLabel(
              label: 'OTP',
              hint: 'Enter The OTP sent to your email',
              controller: otpController,
              isPass: false,
            ),
            SizedBox(height: 8),
            AppButton(
              text: 'Send',
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
