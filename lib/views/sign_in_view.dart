import 'package:flutter/material.dart';
import 'package:project_5/views/home_view.dart';
import 'package:project_5/views/sign_up_view.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/sign_in.png',
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
                      child:
                          CustomButton(text: 'Sign in',
                           onPressedFunc: () {
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()));
                           }),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You dont have an account?'),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: InkWell(
                            onTap:() {
                               Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
