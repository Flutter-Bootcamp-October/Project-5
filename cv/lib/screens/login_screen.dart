import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/screens/regestratio_screen%20.dart';
import 'package:cv/screens/reset_password.dart';
import 'package:cv/widgets/app_rich_text.dart';
import 'package:cv/widgets/app_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 630,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: EdgeInsets.only(top: 214),
            child: Padding(
              padding: const EdgeInsets.only(top: 64, left: 22, right: 22),
              child: Column(
                children: [
                  const MainText(
                    title: "Login",
                    Subtitle: "Login to conuinue",
                  ),
                  height26,
                  AppTextField(
                      controller: emailController,
                      lable: "Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                      hint: "Joud@gmail.com"),
                  AppTextField(
                      controller: passwordController,
                      lable: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      hint: "******"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPassword(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  Appbutton(
                      onpressed: () {
                        //post
                      },
                      btnColor: AppColors.primaryColor,
                      title: "Login",
                      titleColor: Colors.white),
                  height24,
                  AppRichText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Regestration()),
                        );
                      },
                      text: "Don't have any account?",
                      linkText: " Sign Up"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
