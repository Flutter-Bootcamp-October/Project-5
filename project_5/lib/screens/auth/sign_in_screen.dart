import 'package:flutter/material.dart  ';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/auth_bloc/auth_bloc.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_loading.dart';
import 'package:project_5/screens/auth/otp_screen.dart';
import 'package:project_5/widgets/sized_box.dart';
import 'package:project_5/widgets/snack_bar.dart';
import 'components/account_availability.dart';
import 'components/auth_button.dart';
import 'components/auth_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxH(context: context, multiplier: .103),
              Image.asset("assets/images/sign_logo.png", scale: 3),
              sizedBoxH(context: context, multiplier: .09136),
              AuthTextField(
                  isPassword: false,
                  content: "Email",
                  controller: emailController),
              sizedBoxH(context: context, multiplier: .019),
              AuthTextField(
                  isPassword: true,
                  content: "Password",
                  controller: passwordController),
              sizedBoxH(context: context, multiplier: .019),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  return AuthButton(
                    content: "Sign In",
                    color: Colors.grey[200]!,
                    isDisabled: false,
                    onPressedFunc: () {
                      context.read<AuthBloc>().add(
                            AuthLoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                  );
                },
                listener: (BuildContext context, AuthState state) {
                  state is AuthLoginErrorState
                      ? showSnackBar(context: context, message: state.errorMsg)
                      : SystemChannels.textInput.invokeMethod('TextInput.show');
                  state is AuthLoginSuccessState
                      ? navigation(
                          context: context,
                          type: "push",
                          screen: OTPScreen(
                              emailAddress: state.email, type: state.type))
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
              sizedBoxH(context: context, multiplier: .011),
              const AccountAvailability(haveAccount: false),
            ],
          ),
        ),
      ),
    );
  }
}
