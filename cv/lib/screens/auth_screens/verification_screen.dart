// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/verification_bloc/verification_bloc.dart';
import 'package:cv/screens/auth_screens/loding_screen.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
    required this.email,
    required this.type,
  });
  final String email;
  final String type;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style: TextStyle(
                  fontSize: 35, color: blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            AddTextField(
              label: 'OTP',
              hint: 'Enter your OTP',
              isPassword: false,
              controller: otpController,
              icon: Icons.password_rounded,
            ),
            const SizedBox(
              height: 100,
            ),
            BlocListener<VerificationBloc, VerificationState>(
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LodingScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: InkWell(
                onTap: () async {
                  context
                      .read<VerificationBloc>()
                      .add(VerificationEvent(email, otpController.text, type));
                },
                child: Container(
                  width: 330,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: pink),
                  child: const Center(
                    child: Text(
                      "Send",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
