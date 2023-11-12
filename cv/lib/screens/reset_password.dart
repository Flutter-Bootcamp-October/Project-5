import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/screens/verification_screen.dart';
import 'package:cv/widgets/app_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  TextEditingController emailController = TextEditingController();

  get navigator => null;

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
                icon: Icon(
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
                    title: "Forgot password",
                    Subtitle: "Enter your email for the verification proccess",
                  ),
                  height26,
                  AppTextField(
                      controller: emailController,
                      lable: "Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                      hint: "Joud@gmail.com"),
                  Appbutton(
                      onpressed: () {
                        //post
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationOtp()),
                        );
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
