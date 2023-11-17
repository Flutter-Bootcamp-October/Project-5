// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart ';
import 'package:flutter/services.dart';
import 'package:project_5/extensions/email_validator_extension.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_loading.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';
import 'package:project_5/services/auth_api.dart';

import 'components/account_availability.dart';
import 'logic/sign_up_validators.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.getHeight() * .103),
              Image.asset("assets/images/sign_logo.png", scale: 3),
              SizedBox(height: context.getHeight() * .075),
              AuthTextField(
                  isPassword: false,
                  content: "Name",
                  controller: nameController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                isPassword: false,
                content: "Email",
                controller: emailController,
              ),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: false,
                  content: "Phone",
                  controller: phoneController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: true,
                  content: "Password",
                  controller: passwordController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: true,
                  content: "Re-Enter Password",
                  controller: confirmPasswordController),
              SizedBox(height: context.getHeight() * .019),
              //TODO: FIX LOGIC
              AuthButton(
                  content: "Sign Up",
                  color: Colors.grey[200]!,
                  onPressedFunc: () async {
                    isLoading = true;
                    setState(() {});
                    final isValidName = nameValidator(context, nameController);
                    final isValidEmail = emailValidation(
                        emailController.text.isValidEmail(), context);
                    final isValidPhone =
                        phoneValidator(context, phoneController);
                    final isValidPassword =
                        passwordValidator(context, passwordController);
                    final isMatchPassword = confirmPasswordValidator(
                        context, passwordController, confirmPasswordController);

                    if (isValidName &&
                        isValidEmail &&
                        isValidPhone &&
                        isValidPassword &&
                        isMatchPassword) {
                      final response = await registerApi(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                      );
                      if (response.toLowerCase() == "ok") {
                        isLoading = false;
                        navigation(
                            type: "push",
                            context: context,
                            screen: OTPScreen(
                              emailAddress: emailController.text,
                              type: 'registration',
                            ));
                      } else {
                        isLoading = false;
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(response)));
                      }
                    } else {
                      isLoading = false;
                    }
                    SystemChannels.textInput.invokeMethod('TextInput.show');
                    setState(() {});
                  },
                  isDisabled: false),
              isLoading ? showLoadingIndicator() : const SizedBox(),
              const SizedBox(height: 8),
              const AccountAvailability(haveAccount: true)
            ],
          ),
        ),
      ),
    );
  }
}
