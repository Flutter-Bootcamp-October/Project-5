// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/signup_bloc/signup_bloc.dart';
import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/screens/auth_screens/verification_screen.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Let's Sign up",
            style: TextStyle(
                fontSize: 35, color: blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          AddTextField(
            label: 'Name',
            hint: 'Enter your name',
            isPassword: false,
            controller: nameController,
            icon: Icons.person,
          ),
          hight30(),
          AddTextField(
            label: 'Phone',
            hint: 'Enter your phone',
            isPassword: false,
            controller: phoneController,
            icon: Icons.phone,
          ),
          hight30(),
          AddTextField(
            label: 'Email',
            hint: 'Enter your email',
            isPassword: false,
            controller: emailController,
            icon: Icons.email,
          ),
          hight30(),
          AddTextField(
            label: 'Password',
            hint: 'Enter Password',
            isPassword: true,
            controller: passwordController,
            icon: Icons.password_rounded,
          ),
          hight40(),
          BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      state.massege,
                      style: const TextStyle(color: Colors.black),
                    )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      "done",
                      style: TextStyle(color: Colors.black),
                    )));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(
                        type: 'registration',
                        email: emailController.text,
                      ),
                    ));
              }
            },
            child: InkWell(
              onTap: () async {
                context.read<SignupBloc>().add(SignUpEvent(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                    phoneController.text));
              },
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: pink),
                child: const Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          hight30(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Joined us before?"),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ));
                },
                child: Text(
                  "  Sign in",
                  style: TextStyle(
                      fontSize: 15, color: blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
