// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart ';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/auth_bloc/auth_bloc.dart';
import 'package:project_5/extensions/email_validator_extension.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_loading.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';
import 'package:project_5/services/auth_api.dart';
import 'package:project_5/widgets/snack_bar.dart';

import 'components/account_availability.dart';
import 'logic/sign_up_validators.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.getHeight() * .103),
              Image.asset("assets/images/sign_logo.png", scale: 3),
              SizedBox(height: context.getHeight() * .075),
              AuthTextField(
                  isPassword: false,
                  content: "Name",
                  controller: nameController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                isPassword: false,
                content: "Email",
                controller: emailController,
              ),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: false,
                  content: "Phone",
                  controller: phoneController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: true,
                  content: "Password",
                  controller: passwordController),
              SizedBox(height: context.getHeight() * .019),
              AuthTextField(
                  isPassword: true,
                  content: "Re-Enter Password",
                  controller: confirmPasswordController),
              SizedBox(height: context.getHeight() * .019),
              //TODO: FIX LOGIC
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  return AuthButton(
                    content: "Sign Up",
                    color: Colors.grey[200]!,
                    isDisabled: false,
                    onPressedFunc: () async {
                      context.read<AuthBloc>().add(AuthRegisterEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          userName: nameController.text,
                          phone: phoneController.text,
                          confirmPassword: confirmPasswordController.text,
                          context: context));
                    },
                  );
                },
                buildWhen: (previous, current) {
                  if (previous != current) {
                    SystemChannels.textInput.invokeMethod('TextInput.show');
                  }
                  return true;
                },
                listener: (BuildContext context, AuthState state) {
                  state is AuthRegisterErrorState
                      ? showSnackBar(context: context, message: state.errorMsg)
                      : SystemChannels.textInput.invokeMethod('TextInput.show');

                  state is AuthRegisterSuccessState
                      ? navigation(
                          type: "push",
                          context: context,
                          screen: OTPScreen(
                            emailAddress: emailController.text,
                            type: 'registration',
                          ))
                      : const SizedBox();
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state is LoadingState
                      ? state.isLoading
                          ? showLoadingIndicator()
                          : const SizedBox()
                      : const SizedBox();
                },
              ),
              const SizedBox(height: 8),
              const AccountAvailability(haveAccount: true)
            ],
          ),
        ),
      ),
    );
  }
}
