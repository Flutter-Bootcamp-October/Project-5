// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/otp_model.dart';
import 'package:cv_application_api/model/user_model.dart';
import 'package:cv_application_api/pages/navbar_screen.dart';
import 'package:cv_application_api/services/api/otp_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_text_field.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.user, required this.typeOTP});
  final User user;
  final String typeOTP;
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
                      "type": typeOTP
                    });

                    //--------------------------------------

                    if (response.codeState == 200) {
                      final token = response.otpData!.token.toString();
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("token", token);

                      print(response.msg);
                      print(response.otpData!.token.toString());
                      print('prefs ${prefs.setString("token", token)}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const NavBarScreen();
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
