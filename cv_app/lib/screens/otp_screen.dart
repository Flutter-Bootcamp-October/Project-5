import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shield_rounded,
                size: 120,
                color: Colors.white,
              ),
              const Text(
                "We sent you a code",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter it below to verify your email",
                style: TextStyle(color: Colors.white),
              ),
              const Text(
                "xxxx@xxxxx.xxxx",
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const AppTextField(
                label: "Enter OTP 6-Digits",
                icon: Icons.shield,
                textInputType: TextInputType.number,
                autofocus: true,
              ),
              const SizedBox(height: 16),
              AppBotton(text: "Enter", onTap: () {})
            ],
          ),
        ),
      ]),
    );
  }
}
