import 'package:cv_app/globals/app_loading.dart';
import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/bottom_nav_bar.dart';
import 'package:cv_app/services/auth.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.email, required this.type});
  final String email;
  final String type;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.45,
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
                Text(
                  email,
                  style: const TextStyle(
                      color: mainColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: "Enter OTP 6-Digits",
                  icon: Icons.shield,
                  textInputType: TextInputType.number,
                  autofocus: true,
                  controller: otpController,
                ),
                const SizedBox(height: 16),
                AppBotton(
                    text: "SEND",
                    onTap: () async {
                      if (otpController.text.length == 6) {
                        loading(context);
                        final response =
                            await verification(otpController.text, email, type);
                        Navigator.pop(context);
                        print(response.body);
                        if (response.statusCode == 200) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()),
                              (route) => false);
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Invalid otp.")),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("otp must contain 6 digits.")),
                        );
                      }
                    })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
