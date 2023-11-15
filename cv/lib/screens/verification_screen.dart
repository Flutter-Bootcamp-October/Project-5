import 'dart:convert';

import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/screens/home_screen.dart';
import 'package:cv/screens/login_screen.dart';
import 'package:cv/screens/regestratio_screen%20.dart';
import 'package:cv/services/verification.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/otp_text_filed.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VerificationOtp extends StatefulWidget {
  VerificationOtp({
    super.key,
    required this.email,
    required this.type,
  });

  final String email;
  final String type;

  @override
  State<VerificationOtp> createState() => _VerificationOtpState();
}

class _VerificationOtpState extends State<VerificationOtp> {
  TextEditingController otpController = TextEditingController();

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
                  OtpTextFiled(controller: otpController, hint: "897659"),
                  Appbutton(
                      onpressed: () async {
                        //post
                        try {
                          Response? result = await verificationPost(
                              otpController.text, widget.email, widget.type);
                          if (result!.statusCode == 200) {
                            final String token =
                                json.decode(result.body)["data"]["token"];
                            print(token);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Home()),
                                (Route<dynamic> route) => false);
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString())));
                        }
                      },
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
