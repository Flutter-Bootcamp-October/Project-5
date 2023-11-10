// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/otp.dart';
import 'package:cv_application_api/model/user.dart';
import 'package:cv_application_api/pages/login_screen.dart';
import 'package:cv_application_api/services/api/otp.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_text_field.dart';
import 'package:cv_application_api/widgets/sign_up_widget/title.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        const BackgroundImage(),
        const BackgroundWhiteContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Column(
            children: [
              const TitleOfScreen(
                title: "Verfiy",
                titleFontSize: 40,
                titleletterSpacing: 10,
                titlefontWeight: FontWeight.bold,
                titleColor: app2DarkGreen,
              ),
              const TitleOfScreen(
                title: "Registration",
                titleFontSize: 40,
                titleletterSpacing: 10,
                titlefontWeight: FontWeight.bold,
                titleColor: app2DarkGreen,
              ),
              height16,
              TitleOfScreen(
                title: 'OTP sent to   ${user.dataUser!.email!}',
                titleFontSize: 20,
                titleletterSpacing: 2,
                titlefontWeight: FontWeight.w700,
                titleColor: appWhite,
              ),
              height50,
              CustomTextFiled(
                controller: otpController,
                suffix: const Icon(
                  Icons.password,
                  color: appGreen,
                ),
                keyboardType: TextInputType.number,
                hintText: 'OTP code',
                obscureText: false,
              ),
              height20,
              CustomButtom(
                textButtom: "Verify",
                onPressed: () async {
                  try {
                    //-------------------------------------

                    showDialog(
                      context: context,
                      barrierColor: appcoldGreenTrans,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: app2DarkGreen,
                        ),
                      ),
                    );

                    //-------------------------------------

                    final OTP response = await verifyOTP({
                      "otp": otpController.text,
                      "email": user.dataUser!.email!,
                      "type": "registration"
                    });

                    //--------------------------------------

                    if (response.codeState == 200) {
                      print(response.msg);
                      print(response.otpData!.token);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  }
                },
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
