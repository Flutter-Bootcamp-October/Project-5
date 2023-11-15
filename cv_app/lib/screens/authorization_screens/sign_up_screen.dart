import 'dart:convert';

import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/authentiction/authentiction_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/screens/authorization_screens/log_in_screen.dart';
import 'package:cv_app/screens/authorization_screens/verification_screen.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          height20,
          Expanded(
            child: Container(
              child: ImageIcon(
                AssetImage(
                  'lib/assets/images/pngkey.com-resume-png-1225289.png',
                ),
                color: white,
                size: 150,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 600,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SignUp',
                    style: TextStyle(
                        color: prussianBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthTextFelid(
                        text: 'Name',
                        title: 'Name',
                        icon: null,
                        isHaveIcon: false,
                        controller: nameController,
                      ),
                      AuthTextFelid(
                        text: 'Phone Number',
                        title: 'Phone Number',
                        icon: null,
                        isHaveIcon: false,
                        controller: phoneNumberController,
                      ),
                      AuthTextFelid(
                        text: 'Email',
                        title: 'Email',
                        icon: Icons.email_outlined,
                        controller: emailController,
                        isHaveIcon: true,
                      ),
                      AuthTextFelid(
                        text: 'Password',
                        title: 'Password',
                        icon: Icons.lock_outline_rounded,
                        controller: passwordController,
                        isHaveIcon: true,
                      ),
                      height10,
                      InkWell(
                        onTap: () async {
                          final network = ConsentNetworking();
                          final AuthentictionModel respons =
                              await network.registrationMethod(body: {
                            "name": nameController.text,
                            "phone": phoneNumberController.text,
                            "password": passwordController.text,
                            "email": emailController.text
                          });

                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationScreen(
                                        email: respons.data.email,
                                        type: 'registration',
                                      )));
                          setState(() {});
                        },
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: payneGrey,
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: eggShell,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?  ',
                            style: TextStyle(
                                color: payneGrey, fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()));
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  color: prussianBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
