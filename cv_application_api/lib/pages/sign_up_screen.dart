import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
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
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: Column(
                children: [
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
                    keyboardType: TextInputType.number,
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: false,
                  ),
                  height20,
                  CustomButtom(
                    textButtom: 'Sign Up',
                    onPressed: () async {
                      // i want to add condition for password

                      // condition the text field not empty

                      if (nameController.text.isEmpty &&
                          phoneController.text.isEmpty &&
                          emailController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                      }

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return LoginScreen();
                      // }));
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
