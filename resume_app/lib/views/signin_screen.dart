import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/services/authorization.dart';
import 'package:resume_app/views/signup_screen.dart';
import 'package:resume_app/views/verification_screen.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';
import 'package:resume_app/widgets/custom_rich_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: emailController,
                decoration: returnDec(
                    icon: const Icon(Icons.email_outlined),
                    hint: 'Enter Your Email',
                    labelText: 'Email *'),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: hidePassword,
                controller: passwordController,
                decoration: returnDec(
                    icon: InkWell(
                        onTap: () {
                          hidePassword = !hidePassword;
                          setState(() {});
                        },
                        child: const Icon(Icons.remove_red_eye_outlined)),
                    hint: 'Enter Your Password',
                    labelText: 'Password *'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: appBlue),
                  onPressed: () async {
                    if (passwordController.text.isNotEmpty &&
                        emailController.text.isNotEmpty) {
                      try {
                        final res = await Authorization().loginUser(body: {
                          "email": emailController.text,
                          "password": passwordController.text
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(res)));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationScreen(
                                    email: emailController.text,
                                    type: 'Login',
                                  )),
                        );
                      } on FormatException catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.message.toString())));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please fill out required fields")));
                    }
                  },
                  child: const Text(
                    "login",
                    style: TextStyle(fontSize: 20),
                  )),
              const SizedBox(height: 20),
              const RichTextCustom(
                  text1: "Don't have an account? ",
                  text2: "Sign up",
                  screen: SignUpSreen()),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    ]);
  }
}
