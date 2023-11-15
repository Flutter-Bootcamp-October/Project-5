import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/services/authorization.dart';
import 'package:resume_app/views/verification_screen.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';
import 'package:resume_app/widgets/custom_rich_text.dart';
import 'package:resume_app/views/signin_screen.dart';

class SignUpSreen extends StatefulWidget {
  const SignUpSreen({super.key});

  @override
  State<SignUpSreen> createState() => _SignUpSreenState();
}

class _SignUpSreenState extends State<SignUpSreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    prefs.clear();
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: nameController,
                decoration: returnDec(
                    icon: const Icon(Icons.person),
                    hint: 'Enter Your Name',
                    labelText: 'Name *'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: returnDec(
                    icon: const Icon(Icons.email_outlined),
                    hint: 'Enter Your Email',
                    labelText: 'Email *'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: returnDec(
                    icon: const Icon(Icons.phone_android_outlined),
                    hint: 'Enter Your Phone Number',
                    labelText: 'Phone Number *'),
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
                        emailController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      try {
                        final res = await Authorization().registrerUser(body: {
                          "name": nameController.text,
                          "phone": phoneController.text,
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
                                    type: 'registration',
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
                  child:
                      const Text("Register", style: TextStyle(fontSize: 20))),
              const SizedBox(height: 20),
              const RichTextCustom(
                  text1: "Already have an account? ",
                  text2: "Sign in",
                  screen: SignInScreen()),
              const SizedBox(height: 50),
            ],
          ),
        )),
      )
    ]);
  }
}
