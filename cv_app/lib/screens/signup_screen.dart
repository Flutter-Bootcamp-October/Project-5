import 'package:cv_app/globals/app_loading.dart';
import 'package:cv_app/screens/otp_screen.dart';
import 'package:cv_app/services/auth.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:cv_app/widgets/change_accees_method.dart';
import 'package:cv_app/widgets/or_sign_in_with.dart';
import 'package:cv_app/widgets/signup_bar.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(),
        phoneController = TextEditingController(text: "05"),
        emailController = TextEditingController(),
        passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SigninBar(),
            const SizedBox(height: 32),
            AppTextField(
              label: "Name",
              icon: Icons.person_2_rounded,
              controller: nameController,
            ),
            AppTextField(
              label: "Phone",
              icon: Icons.local_phone_rounded,
              controller: phoneController,
              textInputType: TextInputType.number,
            ),
            AppTextField(
              label: "Email Address",
              icon: Icons.email_rounded,
              controller: emailController,
            ),
            AppTextField(
              label: "Password",
              icon: Icons.lock_rounded,
              isObscure: true,
              controller: passwordController,
            ),
            const SizedBox(height: 64),
            AppBotton(
                onTap: () async {
                  if (nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    loading(context);
                    final response = await registration(
                        nameController.text,
                        phoneController.text,
                        emailController.text,
                        passwordController.text);
                    Navigator.pop(context);
                    if (response['codeStatus'] == 200) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                  email: emailController.text,
                                  type: "registration")));
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['msg'])));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Fill all required fields.")),
                    );
                  }
                },
                text: "SIGN UP"),
            const OrSignInWith(),
            ChangeAccessMethod(
                quistion: "Already have an account? ",
                accessMethos: "LOG IN",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
