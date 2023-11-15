import 'dart:convert';
import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/screens/login_screen.dart';
import 'package:cv/screens/verification_screen.dart';
import 'package:cv/services/regestration_api.dart';
import 'package:cv/services/verification.dart';
import 'package:cv/widgets/app_rich_text.dart';
import 'package:cv/widgets/app_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

TextEditingController nameController = TextEditingController(),
    phoneController = TextEditingController(),
    passwordController = TextEditingController(),
    emailController = TextEditingController();

bool? isSent;

class Regestration extends StatefulWidget {
  Regestration({super.key});

  @override
  State<Regestration> createState() => _RegestrationState();
}

class _RegestrationState extends State<Regestration> {
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
                    title: "Sign Up",
                    Subtitle: "Enter your details below to get started",
                  ),
                  height26,
                  AppTextField(
                      controller: nameController,
                      lable: "Name",
                      icon: Icons.person_outlined,
                      isPassword: false,
                      hint: "Joud"),
                  AppTextField(
                    controller: phoneController,
                    lable: "Phone",
                    icon: Icons.phone_android_outlined,
                    isPassword: false,
                    hint: "0554783945",
                  ),
                  AppTextField(
                      controller: passwordController,
                      lable: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      hint: "******"),
                  AppTextField(
                      controller: emailController,
                      lable: "Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                      hint: "Joud@gmail.com"),
                  Appbutton(
                    

                      onpressed: () async {
                        //post
                        try {
                          Response? result = await registrationPost(
                              nameController.text,
                              phoneController.text,
                              passwordController.text,
                              emailController.text);

                          if (result!.statusCode == 200) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationOtp(
                                        email: emailController.text,
                                        type: "registration",
                                      )),
                            );
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text((error.toString()).toString())));
                        }
                      },
                      btnColor: AppColors.primaryColor,
                      title: "Sign Up",
                      titleColor: Colors.white),
                  height24,
                  AppRichText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                        );
                      },
                      text: "Already have an account?",
                      linkText: " Login"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
