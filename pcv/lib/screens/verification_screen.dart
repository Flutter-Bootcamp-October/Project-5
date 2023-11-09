import 'package:flutter/material.dart';
import 'package:pcv/screens/sign_in_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextFieldWidget(text: 'OTP', obscure: false, controller: null),
            ButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                },
                text: 'Done')
          ],
        ),
      ),
    );
  }
}
