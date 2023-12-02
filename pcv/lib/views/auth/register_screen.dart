import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/extension/ext_string.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pcv/views/auth/verification_screen.dart';
import 'package:pcv/services/auth_api.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:pcv/widgets/text_rich_widget.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';

final network = Network();

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    super.key,
  });
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormState>();
  final displayPass = false;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/log.png",
                        cacheHeight: 200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 1.6,
                          bottom: 20),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffff6700)),
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      keyForm: _nameKey,
                      text: 'Username',
                      obscure: false,
                      controller: usernameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      keyForm: _phoneKey,
                      text: 'Phone',
                      obscure: false,
                      controller: phoneController,
                      validator: (val) {
                        if (!val!.isValidPhone) {
                          return "must be start with 05 and contain 10 digital";
                        }
                        return null;
                      },
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
                      buildWhen: (previous, current) {
                        if (current is DisplayState) {
                          return true;
                        }
                        return false;
                      },
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
                    BlocListener<AuthBloc, AuthState>(
                      listenWhen: (oldState, newState) {
                        if (newState is SignUpErrorState) {
                          return true;
                        }
                        return false;
                      },
                      listener: (context, state) {
                        if (state is SignUpSuccessState) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificationScreen(
                                  type: 'registration',
                                  email: emailController.text,
                                ),
                              ));
                        } else if (state is SignUpErrorState) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              content: Text(state.message),
                            ),
                          );
                        }
                      },
                      child: ButtonWidget(
                        onPressed: () async {
                          context.read<AuthBloc>().add(SignUpAuthEvent(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneController.text,
                              _nameKey,
                              _emailKey,
                              _passwordKey,
                              _phoneKey));
                        },
                        text: 'Register',
                      ),
                    ),
                    const TextRich(
                        view: SignInScreen(),
                        text1: 'Register Already?',
                        text2: ' Sign In')
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
