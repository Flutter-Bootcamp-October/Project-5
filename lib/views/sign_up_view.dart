import 'package:flutter/material.dart';
import 'package:project_5/views/about/about_view.dart';

import 'package:project_5/views/about/edit_about_view.dart';
import 'package:project_5/views/otp_view.dart';

import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isMatched = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                top: -75,
                left: -75,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffe0d4f4)),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height - 120,
                left: MediaQuery.of(context).size.width - 100,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xfff2c4cc)),
                )),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/sign_up.png',
                        height: size.height * 0.35),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomTextField(
                          lable: 'Email',
                          hint: 'Enter your Email',
                          icon: Icons.mail_outline,
                          isPassword: false,
                          controller: emailController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomTextField(
                          lable: 'Password',
                          hint: 'Enter your Password',
                          icon: Icons.visibility_outlined,
                          isPassword: true,
                          controller: passwordController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomTextField(
                          lable: 'ConfirmPassword',
                          hint: 'Confirm your Password',
                          icon: Icons.visibility_outlined,
                          isPassword: true,
                          controller: passwordController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomButton(
                          text: 'Sign up',
                          onPressedFunc: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  OtpView()));
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
