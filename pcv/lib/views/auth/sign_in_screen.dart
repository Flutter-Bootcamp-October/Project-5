// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/extension/ext_string.dart';
import 'package:pcv/views/auth/register_screen.dart';

import 'package:pcv/views/auth/verification_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:pcv/widgets/text_rich_widget.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool displayPass = false;

  final _emailKey = GlobalKey<FormState>();

  final _passwordKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 1.5,
                        bottom: 20),
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFieldWidget(
                    keyForm: _emailKey,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter the email";
                      }
                      if (!val.isValidEmail) {
                        return "Email must be contain @ And .com";
                      }
                      return null;
                    },
                    text: 'Email',
                    obscure: false,
                    controller: emailController,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is DisplayState) {
                        return TextFieldWidget(
                          displayPass: state.display,
                          keyForm: _passwordKey,
                          text: 'Password',
                          obscure: true,
                          controller: passwordController,
                          validator: (val) {
                            if (!val!.isValidPassword) {
                              return "must be contain Uppercase, lowercase and (!@#*~)";
                            }
                            return null;
                          },
                          onTap: () {
                            context
                                .read<AuthBloc>()
                                .add(DisplayPasswordEvent(state.display));
                          },
                        );
                      }
                      return TextFieldWidget(
                        displayPass: displayPass,
                        keyForm: _passwordKey,
                        text: 'Password',
                        obscure: true,
                        controller: passwordController,
                        validator: (val) {
                          if (!val!.isValidPassword) {
                            return "must be contain Uppercase, lowercase and (!@#*~)";
                          }
                          return null;
                        },
                        onTap: () {
                          context
                              .read<AuthBloc>()
                              .add(DisplayPasswordEvent(displayPass));
                        },
                      );
                    },
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: Color(0xffFF6700)),
                      )),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationScreen(
                                type: 'login',
                                email: emailController.text,
                              ),
                            ));
                      } else if (state is ErrorState) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    child: ButtonWidget(
                        onPressed: () {
                          context.read<AuthBloc>().add(LogInAuthEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              emailKey: _emailKey,
                              passwordKey: _passwordKey));
                        },
                        text: 'Sign In'),
                  ),
                  TextRich(
                      view: RegisterScreen(),
                      text1: 'Don\'t have an account?',
                      text2: ' Register')
                ],
              ))),
    );
  }
}
