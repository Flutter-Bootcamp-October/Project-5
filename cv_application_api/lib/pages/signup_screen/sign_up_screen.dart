// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/user_model.dart';
import 'package:cv_application_api/pages/login_screen/login_screen.dart';
import 'package:cv_application_api/pages/otp_screen/otp_screen.dart';
import 'package:cv_application_api/services/api/create_account_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_text_field.dart';
import 'package:cv_application_api/widgets/login_and_signup_widget/text_login_or_sign_up.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    title: "Sign Up",
                    titleFontSize: 40,
                    titleletterSpacing: 10,
                    titlefontWeight: FontWeight.bold,
                    titleColor: app2DarkGreen,
                  ),
                  height50,
                  CustomTextFiled(
                    suffix: const Icon(
                      Icons.person,
                      color: appGreen,
                    ),
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    hintText: 'Full Name',
                    obscureText: false,
                  ),
                  height14,
                  CustomTextFiled(
                    suffix: const Icon(
                      Icons.phone_in_talk_outlined,
                      color: appGreen,
                    ),
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    hintText: 'Phone Number',
                    obscureText: false,
                  ),
                  height14,
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
                    titleTest: 'Already have an account?',
                    titleButtom: 'Login',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                  ),
                  height16,
                  CustomButtom(
                    textButtom: 'Sign Up',
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

                        // i want to add condition for password

                        //-------------------------------------

                        if (nameController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all field"),
                            ),
                          );
                        }

                        final User response = await createAccount({
                          "name": nameController.text,
                          "phone": phoneController.text,
                          "email": emailController.text,
                          "password": passwordController.text
                        });

                        //--------------------------------------

                        if (response.codeState == 200) {
                          // print(response.msg);
                          // print(response.dataUser!.email!);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OTPScreen(
                              typeOTP: "registration",
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

                        //--------------------------------------
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
