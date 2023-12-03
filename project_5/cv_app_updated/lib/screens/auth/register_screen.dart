// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/api_methods/auth_methods.dart';
import 'package:project_5/blocs/auth/bloc/auth_bloc.dart';
import 'package:project_5/screens/auth/create_verification.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/utils/loading_widget.dart';

import '../components/input_text_fields.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(),
        phoneController = TextEditingController(),
        emailController = TextEditingController(),
        passwordController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            )),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Create Account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            InputTextFields(
                controller: nameController, title: "Enter name", lines: 1),
            InputTextFields(
                controller: phoneController, title: "Enter phone", lines: 1),
            InputTextFields(
                controller: emailController, title: "Enter email", lines: 1),
            InputTextFields(
              controller: passwordController,
              title: "Enter password",
              lines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) async {
                loadingWidget(context: context);
                try {
                  if (state is RegisterState) {
                    var res = await AuthMethodNetworking().createAccount(body: {
                      "name": nameController.text,
                      "phone": phoneController.text,
                      "email": emailController.text,
                      "password": passwordController.text,
                    });

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountVerification(
                                email: res.data.email,
                                type: 'registration',
                              )),
                    );
                  } else if (state is AuthErrorState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  } else {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("plese fill all the fields"),
                    ));
                  }
                } on FormatException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      e.message.toString(),
                    ),
                  ));
                }
              },
              child: ButtonWidget(
                textEntry: "Create account",
                onpress: () async {
                  context.read<AuthBloc>().add(RegisterEvent(
                      name: nameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      password: passwordController.text));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

/**
 * AuthMethodNetworking apiMethod = AuthMethodNetworking();
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  try {
                    final res = await apiMethod.createAccount(body: {
                      "name": nameController.text,
                      "phone": phoneController.text,
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
                                  type: 'registration',
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

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("plese fill all the fields"),
                  ));
                }
 */