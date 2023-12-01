import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pinput/pinput.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../loading_page.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key, required this.type, required this.email});

  final String type;
  final String email;

  final otbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoadingPage(),
                      ));
                } else if (state is AuthInitial) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
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
              child: Pinput(
                autofocus: true,
                length: 6,
                onCompleted: (pin) {
                  context.read<AuthBloc>().add(VerificationEvent(
                      otp: pin.toString(), email: email, type: type));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
