import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/otp_text_filed.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:flutter/material.dart';

class VerificationOtp extends StatelessWidget {
  VerificationOtp({
    super.key,
  });

  TextEditingController filedOne = TextEditingController(),
      filedTwo = TextEditingController(),
      filedThree = TextEditingController(),
      filedFour = TextEditingController(),
      filedFive = TextEditingController(),
      filedSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 650,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: EdgeInsets.only(top: 66),
            child: Padding(
              padding: const EdgeInsets.only(top: 64, left: 22, right: 22),
              child: Column(
                children: [
                  const MainText(
                    title: "Verification",
                    Subtitle: "A 6 digit code has been sent to your email",
                  ),
                  height26,
                  OtpTextFiled(controller: filedOne, hint: "897659"),
                  Appbutton(
                      onpressed: () {},
                      btnColor: AppColors.primaryColor,
                      title: "Continue",
                      titleColor: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
