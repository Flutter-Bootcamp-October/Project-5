// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/api_methods/auth_methods.dart';
import 'package:project_5/blocs/auth/bloc/auth_bloc.dart';
import 'package:project_5/screens/auth/create_verification.dart';
import 'package:project_5/screens/auth/register_screen.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/utils/loading_widget.dart';

import '../components/input_text_fields.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(),
        passwordController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              "Sign In",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            InputTextFields(
              controller: emailController,
              title: "Enter email",
              lines: 1,
            ),
            InputTextFields(
              controller: passwordController,
              title: "Enter password",
              lines: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) async {
                    loadingWidget(context: context);
                    try {
                      if (state is SigninState) {
                        var res =
                            await AuthMethodNetworking().loginMethod(body: {
                          "email": emailController.text,
                          "password": passwordController.text,
                        });

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountVerification(
                                    email: res.data.email,
                                    type: "login",
                                  )),
                        );
                      } else if (state is AuthErrorState) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.message),
                        ));
                      }
                    } on FormatException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.message.toString()),
                      ));
                    }
                  },
                  child: ButtonWidget(
                    textEntry: "Login",
                    onpress: () async {
                      // add context read to add bloc
                      context.read<AuthBloc>().add(SigninEvent(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
              child: const Text(
                "create account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 *  loadingWidget(context: context);
                  AuthMethodNetworking authMethod = AuthMethodNetworking();
                  // add login method and conditions
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    try {
                      final res = await authMethod.loginMethod(body: {
                        "email": emailController.text,
                        "password": passwordController.text,
                      });
                      if (res.codeState == 200) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountVerification(
                                    email: res.data.email,
                                    type: "login",
                                  )),
                        );
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(res.msg),
                        ));
                      }
                    } on FormatException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          error.message.toString(),
                        ),
                      ));
                    }
                  } else {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter all text fields"),
                      ),
                    );
                  }
 */