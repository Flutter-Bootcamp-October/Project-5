// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart  ';
import 'package:flutter/services.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_loading.dart';
import 'package:project_5/screens/auth/otp_screen.dart';
import 'package:project_5/services/auth_api.dart';
import 'package:project_5/widgets/sized_box.dart';
import 'package:project_5/widgets/snack_bar.dart';

import 'components/account_availability.dart';
import 'components/auth_button.dart';
import 'components/auth_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              sizedBoxH(context: context, multiplier: .103),
              Image.asset("assets/images/sign_logo.png", scale: 3),
              sizedBoxH(context: context, multiplier: .09136),
              AuthTextField(
                  isPassword: false,
                  content: "Email",
                  controller: _emailController),
              sizedBoxH(context: context, multiplier: .019),
              AuthTextField(
                  isPassword: true,
                  content: "Password",
                  controller: _passwordController),
              sizedBoxH(context: context, multiplier: .019),
              AuthButton(
                  content: "Sign In",
                  color: Colors.grey[200]!,
                  onPressedFunc: () async {
                    isLoading = true;
                    setState(() {});
                    final response = await loginApi(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());
                    if (_emailController.text.trim().isEmpty) {
                      isLoading = false;
                      showSnackBar(
                          context: context, message: "Please Enter Your Email");
                    } else if (_passwordController.text.isEmpty) {
                      isLoading = false;
                      showSnackBar(
                          context: context,
                          message: "Please Enter Your Password");
                    } else if (response.toLowerCase() == "ok") {
                      isLoading = false;
                      navigation(
                          type: "push",
                          context: context,
                          screen: OTPScreen(
                              emailAddress: _emailController.text,
                              type: "login"));
                    } else {
                      isLoading = false;
                      showSnackBar(
                          context: context,
                          message: "Email or Password are incorrect");
                    }
                    SystemChannels.textInput.invokeMethod('TextInput.show');
                    setState(() {});
                  },
                  isDisabled: false),
              isLoading ? showLoadingIndicator() : const SizedBox(),
              sizedBoxH(context: context, multiplier: .011),
              const AccountAvailability(haveAccount: false),
            ],
          ),
        ),
      ),
    );
  }
}
