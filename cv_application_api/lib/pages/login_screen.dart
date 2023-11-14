// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/user_model.dart';
import 'package:cv_application_api/pages/otp_screen.dart';
import 'package:cv_application_api/pages/sign_up_screen.dart';
import 'package:cv_application_api/services/api/login_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_text_field.dart';
import 'package:cv_application_api/widgets/login_and_signup_widget/text_login_or_sign_up.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                const BackgroundImage(),
                const BackgroundWhiteContainer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                  child: Column(
                    children: [
                      const TitleOfScreen(
                        title: "Login",
                        titleFontSize: 40,
                        titleletterSpacing: 10,
                        titlefontWeight: FontWeight.bold,
                        titleColor: app2DarkGreen,
                      ),
                      height50,
                      CustomTextFiled(
                        suffix: const Icon(
                          Icons.email,
                          color: appGreen,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      height14,
                      CustomTextFiled(
                        suffix: const Icon(
                          Icons.lock_outline_rounded,
                          color: appGreen,
                        ),
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      height10,
                      TextLoginorSignUP(
                        titleTest: 'Don\'t have an account?',
                        titleButtom: 'SignUp',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUpScreen();
                          }));
                        },
                      ),
                      height16,
                      CustomButtom(
                        textButtom: "Login",
                        onPressed: () async {
                          //--------------------------------------
                          try {
                            //--------------------------------------

                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please fill all field"),
                                ),
                              );
                            }

                            final User response = await login({
                              "email": emailController.text,
                              "password": passwordController.text
                            });

                            if (response.codeState == 200) {
                              // print(response.msg);
                              // print(response.dataUser!.email!);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return OTPScreen(
                                  typeOTP: "login",
                                  user: response,
                                );
                              }));
                            } else {
                              showDialog(
                                context: context,
                                barrierColor: appcoldGreenTrans,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: app2DarkGreen,
                                  ),
                                ),
                              );
                            }
                          } catch (error) {
                            //print(error);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(error.toString())));
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
